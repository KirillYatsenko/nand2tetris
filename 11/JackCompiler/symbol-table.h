#ifndef SYMBOL_TABLE_H
#define SYMBOL_TABLE_H

#include "tokenizer.h"

#define NOT_FOUND -1

enum kind {
	K_NONE = 0,
	K_STATIC,
	K_FIELD,
	K_ARG,
	K_VAR,
	K_COUNT
};

struct symbol {
	const char *name;
	enum token_t type;
	enum kind kind;
	int indx;
	struct symbol *next;

};

struct symbols {
	int indexes[K_COUNT];
	struct symbol *head;
	struct symbol *tail;
};

struct symbols *symbols_init();

void symbols_reset(struct symbols *symbols);

void symbols_deinit(struct symbols *symbols);

int symbols_define(struct symbols *symbols, const char *name, enum token_t type,
		   enum kind kind);

int symbols_var_count(struct symbols *symbols, enum kind kind);

enum kind symbols_kind_of(struct symbols *symbols, const char *name);

enum token_t symbols_type_of(struct symbols *symbols, const char *name);

int symbols_index_of(struct symbols *symbols, const char *name);

#endif /* SYMBOL_TABLE_H */
