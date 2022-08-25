#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.h"

#define END -1

struct cmd_map_elem {
	const char *key;
	enum cmd_t type;
	enum arithmetic_t a_type;
};

static struct cmd_map_elem cmd_map[] = {
	{ .key = "add",		.type= C_ARITHMETIC, .a_type = A_ADD },
	{ .key = "sub",		.type= C_ARITHMETIC, .a_type = A_SUB },
	{ .key = "neg",		.type= C_ARITHMETIC, .a_type = A_NEG },
	{ .key = "eq",		.type= C_ARITHMETIC, .a_type = A_EQ  },
	{ .key = "gt",		.type= C_ARITHMETIC, .a_type = A_GT  },
	{ .key = "lt",		.type= C_ARITHMETIC, .a_type = A_LT  },
	{ .key = "and",		.type= C_ARITHMETIC, .a_type = A_AND },
	{ .key = "or",		.type= C_ARITHMETIC, .a_type = A_OR  },
	{ .key = "not",		.type= C_ARITHMETIC, .a_type = A_NOT },
	{ .key = "push",	.type= C_PUSH },
	{ .key = "pop",		.type= C_POP  },
	{ .key = "label",	.type= C_LABEL },
	{ .key = "goto",	.type= C_GOTO },
	{ .key = "if-goto",	.type= C_IF },
	{ .key = "function",	.type= C_FUNCTION },
	{ .key = "call",	.type= C_CALL },
	{ .key = "return",	.type= C_RETURN }
};

struct segment_map_elem {
	const char *key;
	enum segment_t type;
};

static struct segment_map_elem segment_map[] = {
	{ .key = "argument",  .type= S_ARGUMENT },
	{ .key = "local",     .type= S_LOCAL    },
	{ .key = "static", .   type= S_STATIC   },
	{ .key = "constant",  .type= S_CONSTANT },
	{ .key = "this",      .type= S_THIS     },
	{ .key = "that",      .type= S_THAT     },
	{ .key = "pointer",   .type= S_POINTER  },
	{ .key = "temp",      .type= S_TEMP     },
};

struct parser *parser_init(const char *file)
{
	struct parser *parser;

	if (!file)
		return NULL;

	parser = calloc(1, sizeof(*parser));
	if (!parser)
		return NULL;

	parser->fp = fopen(file, "r");
	if (!parser->fp) {
		printf("Unable to open file: '%s'\n", file);

		free(parser);
		return NULL;
	}

	return parser;
}

void parser_deinit(struct parser *parser)
{
	if (!parser)
		return;

	if (parser->line)
		free(parser->line);

	fclose(parser->fp);
	free(parser);
}

// returns false on EOF
bool parser_advance(struct parser *parser)
{
	int match;
	size_t n;
	ssize_t read;

	if (!parser)
		return false;

	if (parser->line) {
		free(parser->line);
		parser->line = NULL;
	}

	while ((read = getline(&parser->line, &n, parser->fp)) != END) {
		char *cr, *buf = calloc(1, read + 1);
		if (!buf)
			return false;

		if ((cr = strchr(parser->line, '\r'))) {
			*cr = '\n';
			*++cr = '\0';
		}

		match = sscanf(parser->line, "%s", buf);
		if (match > 0 && buf[0] != '/') {
			free(buf);
			return true;
		}

		free(buf);
	}

	return false;
}

static struct call *parse_call(char *buf)
{
	char cmd[32];
	struct call *c = calloc(1, sizeof(*c));

	if (!c)
		return NULL;

	if (sscanf(buf, "%s %s %d", cmd, c->func, &c->nargs) != 3) {
		free(c);
		return NULL;
	}

	return c;
}

static struct function *parse_function(char *buf)
{
	char cmd[32];
	struct function *f = calloc(1, sizeof(*f));

	if (!f)
		return NULL;

	if (sscanf(buf, "%s %s %d", cmd, f->name, &f->nvars) != 3) {
		free(f);
		return NULL;
	}

	return f;
}

static char *parse_arg1(char *buf)
{
	char cmd[32];
	char *arg0 = calloc(1, strlen(buf) + 1);

	if (!arg0)
		return NULL;

	if(sscanf(buf, "%s %s", cmd, arg0) != 2)
		return NULL;

	return arg0;
}

static struct push_pop *parse_push_pop(char *buf)
{
	size_t i, n;
	char cmd[32];
	char segment[32];
	int indx;
	struct segment_map_elem *s_elem = NULL;
	struct push_pop *push_pop;

	if(sscanf(buf, "%s %s %d", cmd, segment, &indx) != 3) {
		printf("Push/pop incorrect format\n");
		return NULL;
	}

	n = sizeof(segment_map) / sizeof(segment_map[0]);

	for (i = 0; i < n; i++) {
		if (!strncmp(segment_map[i].key, segment,
			     strlen(segment) + 1)) {
			s_elem = &segment_map[i];
			break;
		}
	}

	if (!s_elem) {
		printf("Segment unrecognized: '%s\n", segment);
		return NULL;
	}

	push_pop = calloc(1, sizeof(*push_pop));
	if (!push_pop)
		return NULL;

	push_pop->segment = s_elem->type;
	push_pop->indx = indx;

	return push_pop;
}

static struct cmd_map_elem *get_map_elem(char *key)
{
	size_t i, n = sizeof(cmd_map) / sizeof(cmd_map[0]);

	for (i = 0; i < n; i++)
		if (!strncmp(cmd_map[i].key, key, strlen(key) + 1))
		    return &cmd_map[i];

	return NULL;
}

struct cmd *parser_cmd(struct parser *parser)
{
	char *buf;
	struct cmd_map_elem *elem;
	struct cmd *cmd;

	if (!parser || !parser->line)
		return NULL;

	buf = calloc(1, strlen(parser->line) + 1);
	if (!buf)
		return false;

	sscanf(parser->line, "%s", buf);

	elem = get_map_elem(buf);
	if (!elem) {
		printf("Unrecognized cmd: '%s'\n", buf);
		return NULL;
	}

	free(buf);

	cmd = calloc(1, sizeof(*cmd));
	if (!cmd)
		return NULL;

	cmd->type = elem->type;

	if (elem->type == C_ARITHMETIC) {
		cmd->a_type = elem->a_type;
	} else if (elem->type == C_PUSH || elem->type == C_POP) {
		cmd->push_pop = parse_push_pop(parser->line);
		if (!cmd->push_pop) {
			printf("Unable to parse push/pop cmd: '%s'\n",
			       parser->line);
			return NULL;
		}
	} else if (elem->type == C_LABEL) {
		cmd->label = parse_arg1(parser->line);
		if (!cmd->label) {
			printf("Unable to parse label: '%s'\n",
			       parser->line);
			return NULL;
		}
	} else if (elem->type == C_GOTO) {
		cmd->goto_label = parse_arg1(parser->line);
		if (!cmd->goto_label) {
			printf("Unable to parse goto cmd: '%s'\n",
			       parser->line);
			return NULL;
		}
	} else if (elem->type == C_IF) {
		cmd->if_goto_label = parse_arg1(parser->line);
		if (!cmd->if_goto_label) {
			printf("Unable to parse if goto cmd: '%s'\n",
			       parser->line);
			return NULL;
		}
	} else if (elem->type == C_FUNCTION) {
		cmd->func = parse_function(parser->line);
		if (!cmd->func) {
			printf("Unable to parse function cmd: '%s'\n",
			       parser->line);
			return NULL;
		}
	} else if (elem->type == C_CALL) {
		cmd->call = parse_call(parser->line);
		if (!cmd->call) {
			printf("Unable to parser call cmd: '%s'\n",
			       parser->line);
			return NULL;
		}
	} else if (elem->type == C_RETURN) {
		// just to have the same structure
	} else {
		printf("Type: %d is unsupported\n", elem->type);
		return NULL;
	}

	return cmd;
}
