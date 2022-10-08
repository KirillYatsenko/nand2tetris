#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <stdlib.h>

#include "parser.h"
#include "code-writer.h"

static void print_usage(const char *exec)
{
	printf("Usage: %s <file_name>.vm\n", exec);
}

char *out_file_name(const char *in_file)
{
	char *out_file;

	char *delim = strrchr(in_file, '.');
	if (!delim)
		delim = (char *)in_file + strlen(in_file);

	out_file = calloc(1, strlen(in_file) + 1);
	if (!out_file)
		return NULL;

	strncpy(out_file, in_file, delim - in_file);

	return out_file;
}

int main(int argc, char *argv[])
{
	int rc = 0;
	char *out_file;
	struct parser *parser;
	struct writer *writer;
	struct cmd *cmd;

	if (argc != 2) {
		print_usage(argv[0]);
		return -EINVAL;
	}

	out_file = out_file_name(argv[1]);
	if (!out_file)
		return -ENOMEM;

	parser = parser_init(argv[1]);
	if (!parser) {
		free(out_file);
		return -ENOMEM;
	}

	writer = writer_init(out_file);
	if (!writer) {
		free(out_file);
		parser_deinit(parser);
		return -ENOMEM;
	}

	while(parser_advance(parser)) {
		cmd = parser_cmd(parser);
		if (!cmd)
			goto exit;

		rc = write_comment(writer, parser->line);
		if (rc) {
			printf("Unable to write comment\n");
			goto exit;
		}

		if (cmd->type == C_ARITHMETIC)
			rc = write_arithmetic(writer, cmd->a_type);
		else if (cmd->type == C_PUSH || cmd->type == C_POP)
			rc = write_push_pop(writer, cmd->type, cmd->push_pop);

		if (rc) {
			printf("Unable to translate line: '%s\n", parser->line);
			goto exit;
		}
	}

	write_end(writer);

exit:
	writer_deinit(writer);
	parser_deinit(parser);
	free(out_file);

	return rc;
}
