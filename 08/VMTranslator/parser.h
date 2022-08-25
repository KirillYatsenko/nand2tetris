#ifndef PARSER_H
#define PARSER_H

#include <stdio.h>
#include <stdbool.h>

struct parser {
	FILE *fp;
	char *line;
};

enum arithmetic_t {
	A_ADD = 0,
	A_SUB,
	A_NEG,
	A_EQ,
	A_GT,
	A_LT,
	A_AND,
	A_OR,
	A_NOT
};

enum cmd_t {
	C_ARITHMETIC = 0,
	C_PUSH,
	C_POP,
	C_LABEL,
	C_GOTO,
	C_IF,
	C_FUNCTION,
	C_RETURN,
	C_CALL,
};

enum segment_t {
	S_ARGUMENT = 0,
	S_LOCAL,
	S_STATIC,
	S_CONSTANT,
	S_THIS,
	S_THAT,
	S_POINTER,
	S_TEMP
};

struct push_pop {
	const char *file; // without extension
	enum segment_t segment;
	int indx;
};

struct function {
	char name[128];
	int nvars;
};

struct call {
	char func[128];
	int nargs;
};

struct cmd {
	enum cmd_t type;
	union {
		enum arithmetic_t a_type;
		struct push_pop *push_pop;
		char *label;
		char *goto_label;
		char *if_goto_label;
		struct function *func;
		struct call *call;
	};
};

struct parser *parser_init(const char *file);
void parser_deinit(struct parser *parser);

bool parser_advance(struct parser *parser);
struct cmd *parser_cmd(struct parser *parser);

#endif /* PARSER_H */
