#ifndef PARSER_H
#define PARSER_H

#include <stdlib.h>
#include <stdbool.h>

struct parser {
	const char *buffer;
	const char *pos;
};

enum command_t {
	CMD_A = 0,
	CMD_C,
	CMD_L
};

struct parser *parser_init(const char *file);
void parser_reset(struct parser *parser);
void parser_deinit(struct parser *parser);

bool parser_has_commands(struct parser *parser);
void parser_advance(struct parser *parser);

enum command_t parser_cmd_type(struct parser *parser);

const char *parser_symbol(struct parser *parser);
const char *parser_dest(struct parser *parser);
const char *parser_comp(struct parser *parser);
const char *parser_jmp(struct parser *parser);

#endif /* PARSER_H */
