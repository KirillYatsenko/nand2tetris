#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <math.h>

#include "parser.h"
#include "code.h"
#include "symbols.h"

#define FILE_OUT	"a.hack"
#define VARS_ADDR	16

static void print_usage(const char *exec)
{
	printf("Usage: %s <file_name>\n", exec);
}

static char *dec_to_bin(int val)
{
	int i, j;
	char *bin = calloc(1, 15);
	if (!bin) {
		printf("Not enough  memory\n");
		return NULL;
	}

	for (i = 14, j = 0; i >= 0; i--, j++) {
		if(val / (int)pow(2, i))
			bin[j] = '1';
		else
			bin[j] = '0';

		val = val % (int)pow(2, i);
	}

	return bin;
}

static int assemble_a(struct parser *parser, struct symbols *symbols,
		      char cmd_line[16], bool first_pass)
{
	int val;
	const char *sym;
	static int vars_addr = VARS_ADDR;

	cmd_line[0] = '0';

	sym = parser_symbol(parser);
	if (!sym) {
		printf("Unable to parse symbol\n");
		return -EINVAL;
	}

	if (first_pass)
		return 0;

	if (*sym >= '0' && *sym <= '9') { // constant
		val = atoi(sym);
	} else {
		if(!symbols_exist(symbols, sym))
			symbols_add(symbols, sym, vars_addr++);

		val = symbols_get_addr(symbols, sym);
	}

	sym = dec_to_bin(val);
	strcat(cmd_line, sym);

	return 0;
}

static int assemble_c(struct parser *parser, char cmd_line[16], bool first_pass)
{
	const char *dest, *comp, *jmp, *val;

	cmd_line[0] = '1';
	cmd_line[1] = '1';
	cmd_line[2] = '1';

	dest = parser_dest(parser);
	comp = parser_comp(parser);
	if (!comp) {
		printf("Unable to parse comp\n");
		return -EINVAL;
	}
	jmp = parser_jmp(parser);

	if (first_pass)
		return 0;

	val = code_comp(comp);
	if (!val) {
		printf("Unable to convert comp: '%s'\n", comp);
		return -EINVAL;
	}
	strcat(cmd_line, val);

	val = code_dest(dest);
	if (!val) {
		printf("Unable to convert dest: '%s'\n", dest);
		return -EINVAL;
	}
	strcat(cmd_line, val);

	val = code_jmp(jmp);
	if (!val) {
		printf("Unable to convert jmp: '%s'\n", jmp);
		return -EINVAL;
	}
	strcat(cmd_line, val);

	return 0;
}

static int assemble(struct parser *parser, struct symbols *symbols, FILE *fpo,
		    bool first_pass)
{
	int rc = 0;
	int cmd_count = 0;

	while (parser_has_commands(parser)) {
		char cmd_line[16] = "";

		enum command_t cmd_t = parser_cmd_type(parser);
		if (cmd_t == CMD_A) {
			cmd_count++;
			rc = assemble_a(parser, symbols, cmd_line, first_pass);
			if (rc) {
				printf("Unable to assemble A instruction\n");
				return rc;
			}
		} else if (cmd_t == CMD_C) {
			cmd_count++;
			rc = assemble_c(parser, cmd_line, first_pass);
			if (rc) {
				printf("Unable to assemble C instruction\n");
				return rc;
			}
		} else if (cmd_t == CMD_L) {
			const char *sym;
			sym = parser_symbol(parser);
			if (!sym) {
				printf("Unable to parse symbol\n");
				return -EINVAL;
			}

			symbols_add(symbols, sym, cmd_count);
		}

		if (!first_pass && (cmd_t == CMD_A || cmd_t == CMD_C)) {
			strcat(cmd_line, "\n");
			fputs(cmd_line, fpo);
		}

		parser_advance(parser);
	}

	return 0;
}

int main(int argc, char *argv[])
{
	FILE *fpo;
	int rc = 0;
	struct symbols *symbols;
	struct parser *parser;

	if (argc != 2) {
		print_usage(argv[0]);
		return -EINVAL;
	}

	symbols = symbols_init();
	if (!symbols)
		return -ENOMEM;

	parser = parser_init(argv[1]);
	if (!parser) {
		symbols_deinit(symbols);
		return -ENOMEM;
	}

	fpo = fopen(FILE_OUT, "w");

	// first pass
	rc = assemble(parser, symbols, fpo, true);
	if (rc) {
		printf("Unable to collect symbols\n");
		goto exit;
	}

	parser_reset(parser);

	// second pass
	rc = assemble(parser, symbols, fpo, false);
	if (rc)
		printf("Unable to assemble program\n");

exit:
	fclose(fpo);
	parser_deinit(parser);
	symbols_deinit(symbols);

	return rc;
}
