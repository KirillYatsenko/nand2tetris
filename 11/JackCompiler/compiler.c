#include <stdlib.h>
#include <errno.h>
#include <string.h>

#include "symbol-table.h"
#include "tokenizer.h"
#include "compiler.h"
#include "vm-writer.h"

static void compile_statements(struct compiler *com);
static void compile_expression(struct compiler *com);

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

struct compiler *compiler_init(const char *file, int while_indx, int if_indx)
{
	struct compiler *com;

	if (!file)
		return NULL;

	com = calloc(1, sizeof(*com));
	if (!com)
		return NULL;

	com->file = file;

	com->writer = vm_writer_init(file);
	if (!com->writer) {
		free(com);
		return NULL;
	}

	com->tokenizer = tokenizer_init(file);
	if (!com->tokenizer) {
		vm_writer_deinit(com->writer);
		free(com);
		return NULL;
	}

	com->class_symbols = symbols_init();
	if (!com->class_symbols) {
		vm_writer_deinit(com->writer);
		tokenizer_deinit(com->tokenizer);
		free(com);
		return NULL;
	}

	com->sub_symbols = symbols_init();
	if (!com->sub_symbols) {
		vm_writer_deinit(com->writer);
		tokenizer_deinit(com->tokenizer);
		symbols_deinit(com->class_symbols);
		free(com);
		return NULL;
	}

	com->while_indx = while_indx;
	com->if_indx = if_indx;

	return com;
}

void compiler_deinit(struct compiler *com)
{
	if (!com)
		return;

	tokenizer_deinit(com->tokenizer);
	free(com);
}

static struct token *next_token(struct compiler *com)
{
	if (!tokenizer_advance(com->tokenizer))
		return NULL;

	return get_token(com->tokenizer);
}

static void print_xml(struct compiler *com, struct token *token)
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
			token->ident);
	} else {
		printf("unhandled token type: %d\n", token->t);
	}
}

static void syntax_error(struct compiler *com)
{
	printf("Syntax error in file: '%s' on line: #%d\n", com->file,
	       com->tokenizer->line_num);
	exit(-EINVAL);
}

static const char *get_type(struct token *token)
{
	if (token->t == INT)
		return "int";
	else if (token->t == CHAR)
		return "char";
	else if (token->t == BOOL)
		return "bool";
	else if (token->t == IDENT)
		return token->ident;

	return "invalid";
}

/* returns prev token */
static struct token *process(struct compiler *com, enum token_t types[],
			     size_t size)
{
	size_t i;
	struct token *prev;

	if (!tok) {
		tok = next_token(com);
		if (!tok)
			goto error;
	}

	for (i = 0; i < size; i++) {
		if (tok->t != types[i])
			continue;

		print_xml(com, tok);

		prev = tok;
		tok = next_token(com);

		return prev;
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

	syntax_error(com);

	return NULL;
}

static struct token *process_single(struct compiler *com, enum token_t type)
{
	return process(com, (enum token_t[]){type}, 1);
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
static int compile_expression_list(struct compiler *com)
{
	int nargs = 0;

	if (tok->t == C_ROUND)
		return 0;

	compile_expression(com);
	nargs++;

	while (tok->t == COMMA) {
		process_single(com, COMMA);
		compile_expression(com);
		nargs++;
	}

	return nargs;
}

static void push_const(struct compiler *com, struct token *constant)
{
	if (constant->t == NLL || constant->t == FLS) {
		write_push(com->writer, S_CONST, 0);
	} else if (constant->t == TR) {
		write_push(com->writer, S_CONST, 1);
		write_arithmetic(com->writer, NEG);
	} else if (constant->t == THIS) {
		write_push(com->writer, S_POINTER, 0);
	} else if (constant->t == CINT) {
		write_push(com->writer, S_CONST, constant->integer);
	} else if (constant->t == CSTR) {
		size_t i, len = strlen(constant->str);
		write_push(com->writer, S_CONST, len);
		write_call(com->writer, "String.new", 1);

		for (i = 0; i < len; i++) {
			write_push(com->writer, S_CONST, constant->str[i]);
			write_call(com->writer, "String.appendChar", 2);
		}
	} else {
		printf("Unrecognized constant: %d\n", constant->t);
	}
}

static void push_call(struct compiler *com, struct token *var_class,
		      struct token *func, int nargs)
{
	bool is_method = true;
	const char *type = var_class->ident;
	const char *call_fmt = "%s.%s";
	char call[128] = "";

	if (symbols_exist(com->sub_symbols, var_class->ident))
		type = symbols_type_of(com->sub_symbols, var_class->ident);
	else if (symbols_exist(com->class_symbols, var_class->ident))
		type = symbols_type_of(com->class_symbols, var_class->ident);
	else
		is_method = false;

	(void)is_method;

	sprintf(call, call_fmt, type, func->ident);

	write_call(com->writer, call, nargs);
}

static enum segment convert_kind(enum kind kind)
{
	if (kind == K_STATIC)
		return S_STATIC;
	else if (kind == K_VAR)
		return S_LOCAL;
	else if (kind == K_ARG)
		return S_ARG;
	else if (kind == K_FIELD)
		return S_THIS;
	else
		printf("Unrecognized kind: %d\n", kind);

	return 0;
}

/* term: integerConstant | stringConstant | keywordConstant | identifier |
 *	 identifier '[' expression ']' | '(' expression ')' |
 *	 (unaryOp term) | subroutineCall */
static void compile_term(struct compiler *com)
{
	enum token_t types[] = {CINT, CSTR, TR, FLS, NLL, THIS};
	size_t size = sizeof(types) / sizeof(types[0]);

	enum token_t u_types[] = {MINUS, NOT};
	size_t u_size = sizeof(u_types) / sizeof(u_types[0]);

	if (contains(types, size)) {
		push_const(com, process(com, types, size));
		return;
	}

	if (tok->t == O_ROUND) {
		process_single(com, O_ROUND);
		compile_expression(com);
		process_single(com, C_ROUND);
		return;
	}

	if (contains(u_types, u_size)) {
		struct token *u_tok = process(com, u_types, u_size);
		compile_term(com);

		if (u_tok->t == MINUS)
			u_tok->t = NEG;

		write_arithmetic(com->writer, u_tok->t);
		return;
	}

	if (tok->t == IDENT) {
		int indx;
		enum kind kind;
		enum segment segment;
		struct symbols *symbols = NULL;

		struct token *ident = process_single(com, IDENT);

		if (tok->t == O_SQUARE) {
			if (symbols_exist(com->sub_symbols, ident->ident)) {
				symbols = com->sub_symbols;
			} else if (symbols_exist(com->class_symbols,
						 ident->ident)) {
				symbols = com->class_symbols;
			} else {
				printf("Error: array: '%s' is undefined\n",
				       ident->ident);
				exit(-EINVAL);
			}

			indx = symbols_index_of(symbols, ident->ident);
			kind = symbols_kind_of(symbols, ident->ident);
			segment = convert_kind(kind);
			write_push(com->writer, segment, indx);

			process_single(com, O_SQUARE);
			compile_expression(com);
			process_single(com, C_SQUARE);

			write_arithmetic(com->writer, ADD);
			write_pop(com->writer, S_POINTER, 1);
			write_push(com->writer, S_THAT, 0);
		} else if (tok->t == O_ROUND) {
			struct token func;
			int nargs = 1;

			write_push(com->writer, S_POINTER, 0);

			process_single(com, O_ROUND);
			nargs += compile_expression_list(com);
			process_single(com, C_ROUND);

			func.ident = (char *)com->class_name;
			push_call(com, &func, ident, nargs);
		} else if (tok->t == DOT) {
			struct token *func;
			int nargs = 0;

			process_single(com, DOT);
			func = process_single(com, IDENT);
			process_single(com, O_ROUND);

			if (symbols_exist(com->sub_symbols, ident->ident))
				symbols = com->sub_symbols;
			else if (symbols_exist(com->class_symbols, ident->ident))
				symbols = com->class_symbols;

			if (symbols) {
				indx = symbols_index_of(symbols, ident->ident);
				kind = symbols_kind_of(symbols, ident->ident);
				segment = convert_kind(kind);
				nargs++;
				write_push(com->writer, segment, indx);
			}

			nargs += compile_expression_list(com);
			process_single(com, C_ROUND);

			push_call(com, ident, func, nargs);
		} else {
			if (symbols_exist(com->sub_symbols, ident->ident)) {
				symbols = com->sub_symbols;
			} else if (symbols_exist(com->class_symbols,
						 ident->ident)) {
				symbols = com->class_symbols;
			} else {
				printf("Error: variable: '%s' is undefined\n",
				       ident->ident);
				exit(-EINVAL);
			}

			indx = symbols_index_of(symbols, ident->ident);
			kind = symbols_kind_of(symbols, ident->ident);
			segment = convert_kind(kind);

			write_push(com->writer, segment, indx);
		}

		return;
	}

	syntax_error(com);
}

/* expression: term (op term) */
static void compile_expression(struct compiler *com)
{
	struct token *op;
	enum token_t types[] = {ADD, MINUS, MULT, DIV, AND, OR, LT, GT, EQL};
	size_t size = sizeof(types) / sizeof(types[0]);

	compile_term(com);

	while (contains(types, size)) {
		op = process(com, types, size);
		compile_term(com);
		write_arithmetic(com->writer, op->t);
	}
}

/* returnStatement: 'return' expression? ';'  */
static void compile_return_statement(struct compiler *com)
{
	process_single(com, RET);

	if (tok->t != SEMICOLON)
		compile_expression(com);
	else
		write_push(com->writer, S_CONST, 0);

	write_return(com->writer);

	process_single(com, SEMICOLON);
}

/* doStatement: 'do' expression ';' */
static void compile_do_statement(struct compiler *com)
{
	process_single(com, DO);
	compile_expression(com);
	process_single(com, SEMICOLON);

	write_pop(com->writer, S_TEMP, 0);
}

/* whileStatement: 'while' '(' expression ')' '{' statements '}' */
static void compile_while_statement(struct compiler *com)
{
	int while_indx;

	process_single(com, WHILE);

	write_label(com->writer, "WHILE", com->while_indx);
	while_indx = com->while_indx++;

	process_single(com, O_ROUND);
	compile_expression(com);
	process_single(com, C_ROUND);

	write_arithmetic(com->writer, NOT);
	write_if(com->writer, "WHILE_EXIT", while_indx);

	process_single(com, O_CURLY);
	compile_statements(com);
	process_single(com, C_CURLY);

	write_goto(com->writer, "WHILE", while_indx);
	write_label(com->writer, "WHILE_EXIT", while_indx);
}

/* ifStatement: 'if' '(' expression ')' '{' statements '}'
 * ('else' '{' statements '}')? */
static void compile_if_statement(struct compiler *com)
{
	int if_indx;

	process_single(com, IF);

	process_single(com, O_ROUND);
	compile_expression(com);
	process_single(com, C_ROUND);

	write_arithmetic(com->writer, NOT);
	write_if(com->writer, "ELSE", com->if_indx);
	if_indx = com->if_indx++;

	process_single(com, O_CURLY);
	compile_statements(com);
	process_single(com, C_CURLY);

	write_goto(com->writer, "IF_EXIT", if_indx);
	write_label(com->writer, "ELSE", if_indx);

	if (tok->t == ELSE) {
		process_single(com, ELSE);
		process_single(com, O_CURLY);
		compile_statements(com);
		process_single(com, C_CURLY);
	}

	write_label(com->writer, "IF_EXIT", if_indx);
}

/* letStatement: 'let' identifier('[' expression ']')? '=' expression ';' */
static void compile_let_statement(struct compiler *com)
{
	int indx;
	struct token *var;
	enum kind kind;
	enum segment segment;
	struct symbols *symbols;
	bool is_arr = false;

	process_single(com, LET);
	var = process_single(com, IDENT);

	if (symbols_exist(com->sub_symbols, var->ident)) {
		symbols = com->sub_symbols;
	} else if (symbols_exist(com->class_symbols, var->ident)) {
		symbols = com->class_symbols;
	} else {
		printf("Error: variable: '%s' is undefined\n", var->ident);
		exit(-EINVAL);
	}

	indx = symbols_index_of(symbols, var->ident);
	kind = symbols_kind_of(symbols, var->ident);
	segment = convert_kind(kind);

	if (tok->t == O_SQUARE) {
		is_arr = true;
		write_push(com->writer, segment, indx);
		process_single(com, O_SQUARE);
		compile_expression(com);
		process_single(com, C_SQUARE);
		write_arithmetic(com->writer, ADD);
	}

	process_single(com, EQL);
	compile_expression(com);
	process_single(com, SEMICOLON);

	if (is_arr) {
		write_pop(com->writer, S_TEMP, 0);
		write_pop(com->writer, S_POINTER, 1);
		write_push(com->writer, S_TEMP, 0);
		write_pop(com->writer, S_THAT, 0);
	} else {
		write_pop(com->writer, segment, indx);
	}
}

/* statement: letStatement | ifStatement | whileStatement | doStatement |
 *	      returnStatement */
static void compile_statement(struct compiler *com)
{
	if (tok->t == LET)
		compile_let_statement(com);
	else if (tok->t == IF)
		compile_if_statement(com);
	else if (tok->t == WHILE)
		compile_while_statement(com);
	else if (tok->t == DO)
		compile_do_statement(com);
	else if (tok->t == RET)
		compile_return_statement(com);
}

/* statements: statement* */
static void compile_statements(struct compiler *com)
{
	enum token_t types[] = {LET, IF, WHILE, DO, RET};
	size_t size = sizeof(types) / sizeof(types[0]);

	while (contains(types, size))
		compile_statement(com);
}

/* varDec: 'var' type identifier (',' varName)* ';' */
static void compile_var_dec(struct compiler *com)
{
	const char *type;
	struct token *prev;

	process_single(com, VAR);
	prev = process(com, (enum token_t[]){INT, CHAR, BOOL, IDENT}, 4);
	type = get_type(prev);
	prev = process_single(com, IDENT);

	symbols_define(com->sub_symbols, prev->ident, type, K_VAR);
	com->nvar++;

	while (tok->t == COMMA) {
		process_single(com, COMMA);
		prev = process_single(com, IDENT);
		symbols_define(com->sub_symbols, prev->ident, type, K_VAR);
		com->nvar++;
	}

	process_single(com, SEMICOLON);
}

/* subroutineBody: '{' varDec* statements '}' */
static void compile_subroutine_body(struct compiler *com)
{
	compile_statements(com);

	process_single(com, C_CURLY);
}

/* parameterList: ((type identifier) (',' type identifier)*)? */
static void compile_parameter_list(struct compiler *com)
{
	struct token *prev;
	const char *arg_t;
	const char *arg_name;
	enum token_t types[] = {INT, CHAR, BOOL, IDENT};
	size_t size = sizeof(types) / sizeof(types[0]);

	if (!contains(types, size))
		return;

	prev = process(com, (enum token_t[]){INT, CHAR, BOOL, IDENT}, 4);
	arg_t = get_type(prev);

	arg_name = process_single(com, IDENT)->ident;

	symbols_define(com->sub_symbols, arg_name, arg_t, K_ARG);

	while (tok->t == COMMA) {
		process_single(com, COMMA);
		prev = process(com, (enum token_t[]){INT, CHAR, BOOL, IDENT},
			       4);
		arg_t = get_type(prev);
		arg_name = process_single(com, IDENT)->ident;

		symbols_define(com->sub_symbols, arg_name, arg_t, K_ARG);
	}
}

/* subroutineDec: ('constructor' | 'function' | 'method') ('void'|type)
 * identifier '(' parameterList ')' subroutineBody */
static void compile_subroutine_dec(struct compiler *com)
{
	struct token *prev;
	enum token_t types[] = {CONSTR, FUNC, METHOD};
	size_t size = sizeof(types) / sizeof(types[0]);

	if (!contains(types, size))
		return;

	symbols_reset(com->sub_symbols);

	prev = process(com, types, size);
	if (prev->t == METHOD) {
		char *name = calloc(1, sizeof("this"));
		strcpy(name, "this");
		symbols_define(com->sub_symbols, name, com->class_name, K_ARG);
	}

	process(com, (enum token_t[]){VOID, INT, CHAR, BOOL, IDENT}, 5);
	com->subroutine_name = process_single(com, IDENT)->ident;

	process_single(com, O_ROUND);
	compile_parameter_list(com);
	process_single(com, C_ROUND);

	process_single(com, O_CURLY);

	com->nvar = 0;
	while (tok->t == VAR)
		compile_var_dec(com);

	// only now we can write vm function
	write_function(com->writer, com->class_name,
		       com->subroutine_name, com->nvar);

	if (prev->t == METHOD) {
		write_push(com->writer, S_ARG, 0);
		write_pop(com->writer, S_POINTER, 0);
	} else if (prev->t == CONSTR) {
		int f_count = symbols_var_count(com->class_symbols, K_FIELD);
		write_push(com->writer, S_CONST, f_count);
		write_call(com->writer, "Memory.alloc", 1);
		write_pop(com->writer, S_POINTER, 0);
	}

	compile_subroutine_body(com);
}

/* classVarDec: ('static' | 'field') type identifier (',' identifier)* ';' */
static void compile_class_var_dec(struct compiler *com)
{
	struct token *prev;
	enum kind kind;
	const char *prop_t;
	enum token_t types[] = {STATIC, FIELD};
	size_t size = sizeof(types) / sizeof(types[0]);

	if (!contains(types, size))
		return;

	prev = process(com, types, size);
	if (prev->t == STATIC)
		kind = K_STATIC;
	else
		kind = K_FIELD;

	prev = process(com, (enum token_t[]){INT, CHAR, BOOL, IDENT}, 4);
	prop_t = get_type(prev);

	prev = process_single(com, IDENT);

	symbols_define(com->class_symbols, prev->ident, prop_t, kind);

	while (tok->t == COMMA) {
		process_single(com, COMMA);
		prev = process_single(com, IDENT);
		symbols_define(com->class_symbols, prev->ident, prop_t, kind);
	}

	process_single(com, SEMICOLON);
}

/* class: class identifier '{' classVarDec* subroutineDec* '}' */
static void compile_class(struct compiler *com)
{
	enum token_t types[] = {STATIC, FIELD};
	enum token_t s_types[] = {CONSTR, FUNC, METHOD};
	size_t size = sizeof(types) / sizeof(types[0]);
	size_t s_size = sizeof(s_types) / sizeof(s_types[0]);

	process_single(com, CLASS);
	com->class_name = get_type(process_single(com, IDENT));
	process_single(com, O_CURLY);

	while (contains(types, size))
	       compile_class_var_dec(com);

	while (contains(s_types, s_size))
		compile_subroutine_dec(com);

	process_single(com, C_CURLY);
}

int compile(struct compiler *com)
{
	if (!com)
		return -EINVAL;

	compile_class(com);

	return 0;
}
