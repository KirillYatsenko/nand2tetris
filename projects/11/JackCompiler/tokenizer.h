#ifndef TOKENIZER_H
#define TOKENIZER_H

#include <stdio.h>
#include <stdbool.h>

struct tokenizer {
	FILE *fp;
	char *line;
	char *cur;
	int line_num;
};

enum token_t {
	UNDEF = 0,
	CINT,		// constant int
	CSTR,		// constant string
	IDENT,		// identifier
	CLASS,
	CONSTR,		// constructor
	FUNC,
	METHOD,
	FIELD,
	STATIC,
	VAR,
	INT,
	CHAR,
	BOOL,
	VOID,
	TR,		// true
	FLS,		// false
	NLL,		// null
	THIS,
	LET,
	DO,
	IF,
	ELSE,
	WHILE,
	RET,
	O_CURLY,	// open curly bracket
	C_CURLY,	// close curly bracket
	O_ROUND,	// open round bracket
	C_ROUND,	// close round bracket
	O_SQUARE,	// open square bracket
	C_SQUARE,	// close square bracket
	DOT,
	COMMA,
	SEMICOLON,
	ADD,
	NEG,
	MINUS,
	MULT,
	DIV,
	AND,
	OR,
	LT,		// less then
	GT,		// greater then
	EQL,		// equal
	NOT,
};

struct token {
	enum token_t t;
	bool is_keyword;
	const char *keyword;
	bool is_symbol;
	const char *symbol;
	union {
		int integer;
		char *ident;
		char *str;
	};
};

struct tokenizer *tokenizer_init(const char *file);
void tokenizer_deinit(struct tokenizer *tokenizer);

bool tokenizer_advance(struct tokenizer *tokenizer);
struct token *get_token(struct tokenizer *tokenizer);

#endif /* TOKENIZER_H */
