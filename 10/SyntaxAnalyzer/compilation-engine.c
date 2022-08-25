#include <stdlib.h>
#include <errno.h>
#include <string.h>

#include "tokenizer.h"
#include "compilation-engine.h"

static void compile_statements(struct compilation_engine *engine);
static void compile_expression(struct compilation_engine *engine);

struct token *tok;	// current token

const char *tok_type_str_map[] = {
    "undefined", "int",	      "string", "identifier", "class", "constructor",
    "function",	 "method",    "field",	"static",     "var",   "int type",
    "char type", "bool type", "void",	"true",	      "false", "null",
    "this",	 "let",	      "do",	"if",	      "else",  "while",
    "return",	 "{",	      "}",	"(",	      ")",     "[",
    "]",	 ".",	      ",",	";",	      "+",     "-",
    "*",	 "/",	      "&",	"|",	      "<",     ">",
    "=",	 "~"
};

static char *out_file_name(const char *path)
{
	char *_path, *delim = strrchr(path, '.');
	if (!delim)
		return NULL;

	_path = calloc(1, strlen(path) + 3);
	if (!_path)
		return NULL;

	strncpy(_path, path, delim - path + 1);
	strcat(_path, "c.xml");

	return _path;
}

struct compilation_engine *compilation_engine_init(const char *file)
{
	struct tokenizer *tokenizer;
	struct compilation_engine *engine;

	if (!file)
		return NULL;

	tokenizer = tokenizer_init(file);
	if (!tokenizer)
		return NULL;

	engine = calloc(1, sizeof(*engine));
	if (!engine)
		return NULL;

	engine->tokenizer = tokenizer;
	engine->file = out_file_name(file);

	if (!engine->file) {
		printf("Invalid file name: '%s'\n", file);
		goto error;
	}

	engine->fp = fopen(engine->file, "w");
	if (!engine->fp) {
		printf("Unable to open file: '%s'\n", engine->file);
		goto error;
	}

	return engine;

error:
	tokenizer_deinit(tokenizer);
	free(engine);
	return NULL;
}

void compilation_engine_deinit(struct compilation_engine *engine)
{
	if (!engine)
		return;

	tokenizer_deinit(engine->tokenizer);

	fclose(engine->fp);
	free(engine->file);
	free(engine);
}

static int write(struct compilation_engine *engine, const char *line)
{
	if(fputs(line, engine->fp) == EOF)
		return errno;

	return 0;
}

static struct token *next_token(struct compilation_engine *engine)
{
	if (!tokenizer_advance(engine->tokenizer))
		return NULL;

	return get_token(engine->tokenizer);
}

static void print_xml(struct compilation_engine *engine, struct token *token)
{
	char line[300] = "";

	if (token->is_keyword) {
		sprintf(line, "<keyword>%s</keyword>\n", token->keyword);
	} else if (token->is_symbol) {
		const char *sym = token->symbol;
		if (token->t == LT)
			sym = "&lt;";
		else if (token->t == GT)
			sym = "&gt;";
		else if (token->t == AND)
			sym = "&amp;";

		sprintf(line, "<symbol>%s</symbol>\n", sym);
	} else if (token->t == CINT) {
		sprintf(line, "<integerConstant>%d</integerConstant>\n",
			token->integer);
	} else if (token->t == CSTR) {
		sprintf(line, "<stringConstant>%s</stringConstant>\n",
			token->str);
	} else if (token->t == IDENT) {
		sprintf(line, "<identifier>%s</identifier>\n",
			token->identifier);
	} else {
		printf("unhandled token type: %d\n", token->t);
	}

	write(engine, line);
}

static void syntax_error(struct compilation_engine *engine)
{
	printf("Syntax error in file: '%s' on line: #%d\n", engine->file,
	       engine->tokenizer->line_num);
	exit(-EINVAL);
}

static void process(struct compilation_engine *engine, enum token_t types[],
		    size_t size)
{
	size_t i;

	if (!tok) {
		tok = next_token(engine);
		if (!tok)
			goto error;
	}

	for (i = 0; i < size; i++) {
		if (tok->t != types[i])
			continue;

		print_xml(engine, tok);
		tok = next_token(engine);

		return;
	}

error:
	printf("expecting: ");
	for (i = 0; i < size; i++) {
		printf("'%s' ", tok_type_str_map[types[i]]);
		if (i < size - 1)
			printf(",");
	}

	printf("\n");

	printf("found: '%s'\n", tok ? tok_type_str_map[tok->t] : "EOF");

	syntax_error(engine);
}

static void process_single(struct compilation_engine *engine, enum token_t type)
{
	process(engine, (enum token_t[]){type}, 1);
}

static bool contains(enum token_t types[], size_t size)
{
	size_t i;

	if (!tok)
		return false;

	for (i = 0; i < size; i++)
		if (tok->t == types[i])
			return true;

	return false;
}

/* expressionList: (expression ( ',' expression) *)? */
static void compile_expression_list(struct compilation_engine *engine)
{
	write(engine, "<expressionList>\n");

	if (tok->t == C_ROUND)
		goto exit;

	compile_expression(engine);

	while (tok->t == COMMA) {
		process_single(engine, COMMA);
		compile_expression(engine);
	}

exit:
	write(engine, "</expressionList>\n");
}

/* term: integerConstant | stringConstant | keywordConstant | identifier |
 *	 identifier '[' expression ']' | '(' expression ')' |
 *	 (unaryOp term) | subroutineCall */
static void compile_term(struct compilation_engine *engine)
{
	enum token_t types[] = {CINT, CSTR, TR, FLS, NLL, THIS};
	size_t size = sizeof(types) / sizeof(types[0]);

	enum token_t u_types[] = {MINUS, NOT};
	size_t u_size = sizeof(u_types) / sizeof(u_types[0]);

	write(engine, "<term>\n");

	if (contains(types, size)) {
		process(engine, types, size);
		goto exit;
	}

	if (tok->t == O_ROUND) {
		process_single(engine, O_ROUND);
		compile_expression(engine);
		process_single(engine, C_ROUND);
		goto exit;
	}

	if (contains(u_types, u_size)) {
		process(engine, u_types, u_size);
		compile_term(engine);
		goto exit;
	}

	if (tok->t == IDENT) {
		process_single(engine, IDENT);

		if (tok->t == O_SQUARE) {
			process_single(engine, O_SQUARE);
			compile_expression(engine);
			process_single(engine, C_SQUARE);
		} else if (tok->t == O_ROUND) {
			process_single(engine, O_ROUND);
			compile_expression_list(engine);
			process_single(engine, C_ROUND);
		} else if (tok->t == DOT) {
			process_single(engine, DOT);
			process_single(engine, IDENT);
			process_single(engine, O_ROUND);
			compile_expression_list(engine);
			process_single(engine, C_ROUND);
		}

		goto exit;
	}

	syntax_error(engine);

exit:
	write(engine, "</term>\n");
}

/* expression: term (op term) */
static void compile_expression(struct compilation_engine *engine)
{
	enum token_t types[] = {PLUS, MINUS, MULT, DIV, AND, OR, LT, GT, EQL};
	size_t size = sizeof(types) / sizeof(types[0]);

	write(engine, "<expression>\n");
	compile_term(engine);

	while (contains(types, size)) {
		process(engine, types, size);
		compile_term(engine);
	}

	write(engine, "</expression>\n");
}

/* returnStatement: 'return' expression? ';'  */
static void compile_return_statement(struct compilation_engine *engine)
{
	write(engine, "<returnStatement>\n");

	process_single(engine, RET);

	if (tok->t != SEMICOLON)
		compile_expression(engine);

	process_single(engine, SEMICOLON);

	write(engine, "</returnStatement>\n");
}

/* doStatement: subroutineCall ';' */
static void compile_do_statement(struct compilation_engine *engine)
{
	write(engine, "<doStatement>\n");

	process_single(engine, DO);
	process_single(engine, IDENT);

	if (tok->t == O_ROUND) {
		process_single(engine, O_ROUND);
		compile_expression_list(engine);
		process_single(engine, C_ROUND);
	} else if (tok->t == DOT) {
		process_single(engine, DOT);
		process_single(engine, IDENT);
		process_single(engine, O_ROUND);
		compile_expression_list(engine);
		process_single(engine, C_ROUND);
	}

	process_single(engine, SEMICOLON);

	write(engine, "</doStatement>\n");
}

/* whileStatement: 'while' '(' expression ')' '{' statements '}' */
static void compile_while_statement(struct compilation_engine *engine)
{
	write(engine, "<whileStatement>\n");

	process_single(engine, WHILE);

	process_single(engine, O_ROUND);
	compile_expression(engine);
	process_single(engine, C_ROUND);

	process_single(engine, O_CURLY);
	compile_statements(engine);
	process_single(engine, C_CURLY);

	write(engine, "</whileStatement>\n");
}

/* ifStatement: 'if' '(' expression ')' '{' statements '}'
 * ('else' '{' statements '}')? */
static void compile_if_statement(struct compilation_engine *engine)
{
	write(engine, "<ifStatement>\n");

	process_single(engine, IF);

	process_single(engine, O_ROUND);
	compile_expression(engine);
	process_single(engine, C_ROUND);

	process_single(engine, O_CURLY);
	compile_statements(engine);
	process_single(engine, C_CURLY);

	if (tok->t == ELSE) {
		process_single(engine, ELSE);
		process_single(engine, O_CURLY);
		compile_statements(engine);
		process_single(engine, C_CURLY);
	}

	write(engine, "</ifStatement>\n");
}

/* letStatement: 'let' identifier('[' expression ']')? '=' expression ';' */
static void compile_let_statement(struct compilation_engine *engine)
{
	write(engine, "<letStatement>\n");

	process_single(engine, LET);
	process_single(engine, IDENT);

	if (tok->t == O_SQUARE) {
		process_single(engine, O_SQUARE);
		compile_expression(engine);
		process_single(engine, C_SQUARE);
	}

	process_single(engine, EQL);
	compile_expression(engine);
	process_single(engine, SEMICOLON);

	write(engine, "</letStatement>\n");
}

/* statement: letStatement | ifStatement | whileStatement | doStatement |
 *	      returnStatement */
static void compile_statement(struct compilation_engine *engine)
{
	if (tok->t == LET)
		compile_let_statement(engine);
	else if (tok->t == IF)
		compile_if_statement(engine);
	else if (tok->t == WHILE)
		compile_while_statement(engine);
	else if (tok->t == DO)
		compile_do_statement(engine);
	else if (tok->t == RET)
		compile_return_statement(engine);
}

/* statements: statement* */
static void compile_statements(struct compilation_engine *engine)
{
	enum token_t types[] = {LET, IF, WHILE, DO, RET};
	size_t size = sizeof(types) / sizeof(types[0]);

	write(engine, "<statements>\n");

	while (contains(types, size))
		compile_statement(engine);

	write(engine, "</statements>\n");
}

/* varDec: 'var' type identifier (',' varName)* ';' */
static void compile_var_dec(struct compilation_engine *engine)
{
	write(engine, "<varDec>\n");

	process_single(engine, VAR);
	process(engine, (enum token_t[]){INT, CHAR, BOOL, IDENT}, 4);
	process_single(engine, IDENT);

	while (tok->t == COMMA) {
		process_single(engine, COMMA);
		process_single(engine, IDENT);
	}

	process_single(engine, SEMICOLON);

	write(engine, "</varDec>\n");
}

/* subroutineBody: '{' varDec* statements '}' */
static void compile_subroutine_body(struct compilation_engine *engine)
{
	write(engine, "<subroutineBody>\n");

	process_single(engine, O_CURLY);

	while (tok->t == VAR)
		compile_var_dec(engine);

	compile_statements(engine);

	process_single(engine, C_CURLY);

	write(engine, "</subroutineBody>\n");
}

/* parameterList: ((type identifier) (',' type identifier)*)? */
static void compile_parameter_list(struct compilation_engine *engine)
{
	enum token_t types[] = {INT, CHAR, BOOL, IDENT};
	size_t size = sizeof(types) / sizeof(types[0]);

	write(engine, "<parameterList>\n");

	if (!contains(types, size)) {
		write(engine, "</parameterList>\n");
		return;
	}

	process(engine, (enum token_t[]){INT, CHAR, BOOL, IDENT}, 4);
	process_single(engine, IDENT);

	while (tok->t == COMMA) {
		process_single(engine, COMMA);
		process(engine, (enum token_t[]){INT, CHAR, BOOL, IDENT}, 4);
		process_single(engine, IDENT);
	}

	write(engine, "</parameterList>\n");
}

/* subroutineDec: ('constructor' | 'function' | 'method') ('void'|type)
 * identifier '(' parameterList ')' subroutineBody */
static void compile_subroutine_dec(struct compilation_engine *engine)
{
	enum token_t types[] = {CONSTR, FUNC, METHOD, IDENT};
	size_t size = sizeof(types) / sizeof(types[0]);

	if (!contains(types, size))
		return;

	write(engine, "<subroutineDec>\n");
	process(engine, (enum token_t[]){CONSTR, FUNC, METHOD}, 3);
	process(engine, (enum token_t[]){VOID, INT, CHAR, BOOL, IDENT}, 5);
	process_single(engine, IDENT);

	process_single(engine, O_ROUND);
	compile_parameter_list(engine);
	process_single(engine, C_ROUND);

	compile_subroutine_body(engine);

	write(engine, "</subroutineDec>\n");
}

/* classVarDec: ('static' | 'field') type identifier (',' identifier)* ';' */
static void compile_class_var_dec(struct compilation_engine *engine)
{
	enum token_t types[] = {STATIC, FIELD};
	size_t size = sizeof(types) / sizeof(types[0]);

	if (!contains(types, size))
		return;

	write(engine, "<classVarDec>\n");

	process(engine, (enum token_t[]){STATIC, FIELD}, 2);
	process(engine, (enum token_t[]){INT, CHAR, BOOL, IDENT}, 4);
	process_single(engine, IDENT);

	while (tok->t == COMMA) {
		process_single(engine, COMMA);
		process_single(engine, IDENT);
	}

	process_single(engine, SEMICOLON);

	write(engine, "</classVarDec>\n");
}

/* class: class identifier '{' classVarDec* subroutineDec* '}' */
static void compile_class(struct compilation_engine *engine)
{
	enum token_t types[] = {STATIC, FIELD};
	enum token_t s_types[] = {CONSTR, FUNC, METHOD};
	size_t size = sizeof(types) / sizeof(types[0]);
	size_t s_size = sizeof(s_types) / sizeof(s_types[0]);

	write(engine, "<class>\n");

	process_single(engine, CLASS);
	process_single(engine, IDENT);
	process_single(engine, O_CURLY);

	while (contains(types, size))
	       compile_class_var_dec(engine);

	while (contains(s_types, s_size))
		compile_subroutine_dec(engine);

	process_single(engine, C_CURLY);

	write(engine, "</class>\n");
}

int compile(struct compilation_engine *engine)
{
	if (!engine)
		return -EINVAL;

	compile_class(engine);

	return 0;
}
