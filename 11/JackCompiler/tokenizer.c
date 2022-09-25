#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <errno.h>
#include <ctype.h>
#include <sys/types.h>

#include "tokenizer.h"

#define END -1

struct table_elem {
	const char *key;
	enum token_t val;
};

struct table_elem keywords[] = {
	{ .key = "class",	.val = CLASS  },
	{ .key = "constructor", .val = CONSTR },
	{ .key = "function",	.val = FUNC   },
	{ .key = "method",	.val = METHOD },
	{ .key = "field",	.val = FIELD  },
	{ .key = "static",	.val = STATIC },
	{ .key = "var",		.val = VAR    },
	{ .key = "int",		.val = INT    },
	{ .key = "char",	.val = CHAR   },
	{ .key = "boolean",	.val = BOOL   },
	{ .key = "void",	.val = VOID   },
	{ .key = "true",	.val = TR     },
	{ .key = "false",	.val = FLS    },
	{ .key = "null",	.val = NLL    },
	{ .key = "this",	.val = THIS   },
	{ .key = "let",		.val = LET    },
	{ .key = "do",		.val = DO     },
	{ .key = "if",		.val = IF     },
	{ .key = "else",	.val = ELSE   },
	{ .key = "while",	.val = WHILE  },
	{ .key = "return",	.val = RET    },
};

struct table_elem symbols[] = {
	{ .key = "{",	.val = O_CURLY	 },
	{ .key = "}",	.val = C_CURLY	 },
	{ .key = "(",	.val = O_ROUND	 },
	{ .key = ")",	.val = C_ROUND	 },
	{ .key = "[",	.val = O_SQUARE	 },
	{ .key = "]",	.val = C_SQUARE	 },
	{ .key = ".",	.val = DOT,	 },
	{ .key = ",",	.val = COMMA,	 },
	{ .key = ";",	.val = SEMICOLON },
	{ .key = "+",	.val = ADD	 },
	{ .key = "-",	.val = MINUS	 },
	{ .key = "*",	.val = MULT	 },
	{ .key = "/",	.val = DIV	 },
	{ .key = "&",	.val = AND	 },
	{ .key = "|",	.val = OR	 },
	{ .key = "<",	.val = LT	 },
	{ .key = ">",	.val = GT	 },
	{ .key = "=",	.val = EQL	 },
	{ .key = "~",	.val = NOT	 }
};

struct tokenizer *tokenizer_init(const char *file)
{
	struct tokenizer *tokenizer;

	if (!file)
		return NULL;

	tokenizer = calloc(1, sizeof(*tokenizer));
	if (!tokenizer)
		return NULL;

	tokenizer->line_num = -1;

	tokenizer->fp = fopen(file, "r");
	if (!tokenizer->fp) {
		printf("Unable to open file: '%s'\n", file);

		free(tokenizer);
		return NULL;
	}

	return tokenizer;
}

void tokenizer_deinit(struct tokenizer *tokenizer)
{
	if (!tokenizer)
		return;

	fclose(tokenizer->fp);
	free(tokenizer);
}

static bool is_identifier(char **buf, char **str)
{
	size_t i = 0;
	char *identifier;

	if (*buf[0] != '_' && !isalpha(*buf[0]))
		return false;

	identifier = calloc(1, 64);
	if (!identifier)
		return NULL;

	while (isalnum(**buf) || **buf == '_')
		identifier[i++] = *((*buf)++);

	*str = identifier;

	return true;
}

static bool is_string(char **buf, char **str)
{
	char *str_end, *_str;

	if (**buf != '"')
		return false;

	str_end = strchr((*buf) + 1, '"');
	if (!str_end) {
		printf("Unterminated string: '%s'\n", *buf);
		exit(-EINVAL);
	}

	_str = calloc(1, str_end - *buf);
	if (!_str)
		return false;

	strncpy(_str, (*buf) + 1, str_end - *buf - 1); // except closing "

	*buf = str_end + 1;
	*str= _str;

	return true;
}

static bool is_integer(char **buf, int *val)
{
	int i = 0;
	char str[16] = "";

	while (isdigit(**buf))
		str[i++] = *((*buf)++);

	if (!i)
		return false;

	*val = atoi(str);

	return true;
}

static bool exists(struct table_elem elems[], size_t size, char **buf,
		   const char **key, enum token_t *val, bool is_keyword)
{
	size_t i;

	for (i = 0; i < size; i++) {
		char next;
		if (strstr(*buf, elems[i].key) != *buf)
			continue;

		next = *(*buf + strlen(elems[i].key));
		if (is_keyword && isalnum(next))
			continue;

		*val = elems[i].val;
		*buf = *buf + strlen(elems[i].key); // advance pointer
		*key = elems[i].key;

		return true;
	}

	return false;
}

static bool is_keyword(char **buf, const char **key, enum token_t *val)
{
	size_t size = sizeof(keywords) / sizeof(keywords[0]);
	return exists(keywords, size, buf, key, val, true);
}

static bool is_symbol(char **buf, const char **key, enum token_t *val)
{
	size_t size = sizeof(symbols) / sizeof(symbols[0]);
	return exists(symbols, size, buf, key, val, false);
}

static char *skip_spaces(char *buf)
{
	while (isspace(*buf))
		buf++;

	return buf;
}

static bool advance(struct tokenizer *tokenizer, bool is_comment)
{
	size_t n;
	ssize_t read;

	if (!tokenizer)
		return false;

	if (!tokenizer->line) {
		char *cr;

		read = getline(&tokenizer->line, &n, tokenizer->fp);
		if (read == END) {
			free(tokenizer->line);
			tokenizer->cur = tokenizer->line = NULL;
			return false;
		}

		tokenizer->line_num++;

		if ((cr = strchr(tokenizer->line, '\r'))) {
			*cr = '\n';
			*++cr = '\0';
		}

		tokenizer->cur = tokenizer->line;
	}

	tokenizer->cur = skip_spaces(tokenizer->cur);
	if (is_comment ||
	    (tokenizer->cur[0] == '/' && tokenizer->cur[1] == '*')) {
		char *comment_end = strstr(tokenizer->cur, "*/");
		if (!comment_end) {
			is_comment = true;
			goto next_line;
		}

		tokenizer->cur = comment_end + 2;

		return advance(tokenizer, false);
	} else if (tokenizer->cur[0] == '/' && tokenizer->cur[1] == '/') {
		is_comment = false;
		goto next_line;
	} else if (*tokenizer->cur) {
		return true;
	}

next_line:
	free(tokenizer->line);
	tokenizer->cur = tokenizer->line = NULL;

	return advance(tokenizer, is_comment);
}

bool tokenizer_advance(struct tokenizer *tokenizer)
{
	return advance(tokenizer, false);
}

struct token *get_token(struct tokenizer *tokenizer)
{
	struct token *token;

	if (!tokenizer)
		return NULL;

	token = calloc(1, sizeof(*token));
	if (!token)
		return NULL;

	if (is_keyword(&tokenizer->cur, &token->keyword, &token->t)) {
		token->is_keyword = true;
	} else if (is_symbol(&tokenizer->cur, &token->symbol, &token->t)) {
		token->is_symbol = true;
	} else if (is_integer(&tokenizer->cur, &token->integer)) {
		token->t = CINT;
	} else if (is_string(&tokenizer->cur, &token->str)) {
		token->t = CSTR;
	} else if (is_identifier(&tokenizer->cur, &token->str)) {
		token->t = IDENT;
	} else {
		free(token);
		printf("Unrecognized token: '%s'\n", tokenizer->cur);
		return NULL;
	}

	return token;
}
