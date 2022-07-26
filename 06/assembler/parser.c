#include <stdio.h>
#include <errno.h>
#include <string.h>

#include "parser.h"

#define CMD_PART_SIZE	4

#define IS_EMPTY(c) ((c) == ' ' || (c) == '\t' || (c) == '\n' || (c) == '\r')

static int read_file(const char *file, char **buffer)
{
	FILE *fp;
	long size;
	char *buf;
	size_t read;

	fp = fopen(file, "r");
	if (fp == NULL) {
		printf("Unable to open file: '%s'\n", file);
		return -EINVAL;
	}

	fseek(fp, 0, SEEK_END);
	size = ftell(fp);
	rewind(fp);

	buf = (char *)calloc(sizeof(*buf), size);
	if (buf == NULL) {
		fclose(fp);
		return -ENOMEM;
	}

	read = fread(buf, 1, size, fp);
	if (read != size) {
		printf("Unable read from file: '%s'\n", file);
		fclose(fp);
		free(buf);
		return -EFAULT;
	}

	buf[size - 1] = '\0';
	*buffer = buf;

	fclose(fp);

	return 0;
}

struct parser *parser_init(const char *file)
{
	int rc;
	char *buffer;
	struct parser *parser;

	if (!file)
		return NULL;

	rc = read_file(file, &buffer);
	if (rc)
		return NULL;

	parser = calloc(1, sizeof(*parser));
	if (!parser)
		return NULL;

	parser->buffer = buffer;
	parser->pos = buffer;

	// skip head spaces and comments
	parser_advance(parser);

	return parser;
}

void parser_reset(struct parser *parser)
{
	if (!parser)
		return;

	parser->pos = parser->buffer;

	// skip head spaces and comments
	parser_advance(parser);
}

void parser_deinit(struct parser *parser)
{
	if(!parser)
		return;

	free((void *)parser->buffer);
	free(parser);
}

bool parser_has_commands(struct parser *parser)
{
	return *parser->pos != '\0';
}

void parser_advance(struct parser *parser)
{
	// skip spaces/newlines/tabs and comments
	while (*parser->pos && IS_EMPTY(*parser->pos))
		parser->pos++;

	if (*parser->pos && *parser->pos == '/') {
		// go to the end of the line
		while (*parser->pos && *parser->pos != '\n')
			parser->pos++;

		parser_advance(parser);
	}
}

enum command_t parser_cmd_type(struct parser *parser)
{
	while (IS_EMPTY(*parser->pos))
		parser->pos++;

	if (*parser->pos == '@')
		return CMD_A;
	else if (*parser->pos == '(')
		return CMD_L;
	else
		return CMD_C;
}

const char *parser_symbol(struct parser *parser)
{
	const char *symbol;
	const char *cur = parser->pos;
	enum command_t cmd = parser_cmd_type(parser);

	if (cmd != CMD_A && cmd != CMD_L) {
		printf("Cmd should be of type CMD_A/CMD_L");
		return NULL;
	}

	for (cur++; *cur && *cur != ')' && !IS_EMPTY(*cur); cur++);

	symbol = calloc(1, cur - parser->pos);
	if (!symbol) {
		printf("Not enough memory");
		return NULL;
	}

	memcpy((void *)symbol, parser->pos + 1, cur - parser->pos - 1);

	if (*cur == ')')
		cur++;

	parser->pos = cur;

	return symbol;
}

const char *parser_dest(struct parser *parser)
{
	size_t i = 0;
	char *dest;
	const char *cur = parser->pos;

	char *equal = strpbrk(parser->pos, "=\n");
	if (!equal || *equal == '\n')
		return NULL;

	dest = calloc(1, CMD_PART_SIZE);
	if (!dest) {
		printf("Not enough memory");
		return NULL;
	}

	while (cur != equal && i != CMD_PART_SIZE) {
		if(!IS_EMPTY(*cur))
			dest[i++] = *cur;

		cur++;
	}

	parser->pos = equal + 1;

	return dest;
}

const char *parser_comp(struct parser *parser)
{
	size_t i = 0;
	char *comp;
	const char *cur = parser->pos;

	comp = calloc(1, CMD_PART_SIZE);
	if (!comp) {
		printf("Not enough memory");
		return NULL;
	}

	while (*cur && *cur != ';' && *cur != '\n' && *cur != '/') {
		if(!IS_EMPTY(*cur))
			comp[i++] = *cur;

		cur++;
	}

	parser->pos = cur;

	return comp;
}

const char *parser_jmp(struct parser *parser)
{
	size_t i = 0;
	char *jmp;
	const char *cur = parser->pos;

	if (*cur != ';')
		return NULL;

	jmp = calloc(1, CMD_PART_SIZE);
	if (!jmp) {
		printf("Not enough memory");
		return NULL;
	}

	// skip empty spaces
	cur++;
	while (IS_EMPTY(*cur))
		cur++;

	while (*cur && !IS_EMPTY(*cur))
		jmp[i++] = *cur++;

	parser->pos = cur;

	return jmp;
}
