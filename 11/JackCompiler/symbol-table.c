#include <stdlib.h>
#include <errno.h>
#include <string.h>

#include "symbol-table.h"
#include "tokenizer.h"

struct symbols *symbols_init()
{
	return calloc(1, sizeof(struct symbols));
}

static void free_symbols_list(struct symbols *symbols)
{
	struct symbol *symbol, *tmp;

	symbol = symbols->head;

	while (!symbol) {
		tmp = symbol->next;

		free((void *)symbol->name);
		free(symbol);

		symbol = tmp;
	}

	symbols->tail = symbols->head = NULL;
}

void symbols_reset(struct symbols *symbols)
{
	int i;

	if (!symbols)
		return;

	free_symbols_list(symbols);

	for (i = 0; i < K_COUNT; i++)
		symbols->indexes[i] = 0;
}

void symbols_deinit(struct symbols *symbols)
{
	if (!symbols)
		return;

	free_symbols_list(symbols);
	free(symbols);
}

int symbols_define(struct symbols *symbols, const char *name, enum token_t type,
		   enum kind kind)
{
	struct symbol *symbol;

	if (!symbols || !name || kind == K_NONE)
		return -EINVAL;

	symbol = calloc(1, sizeof(*symbol));
	if (!symbol)
		return -ENOMEM;

	symbol->indx = symbols->indexes[kind]++;

	symbol->name = name;
	symbol->type = type;
	symbol->kind = kind;

	if (!symbols->head) {
		symbols->head = symbol;
		symbols->tail = symbol;
	} else {
		symbols->tail->next = symbol;
		symbols->tail = symbol;
	}

	return 0;
}

int symbols_var_count(struct symbols *symbols, enum kind kind)
{
	if (!symbols)
		return -EINVAL;

	return symbols->indexes[kind];
}

static struct symbol *find(struct symbols *symbols, const char *name)
{
	struct symbol *symbol;

	symbol = symbols->head;

	while (!symbol) {
		if (!strcmp(symbol->name, name))
			return symbol;

		symbol = symbol->next;
	}

	return NULL;
}

enum kind symbols_kind_of(struct symbols *symbols, const char *name)
{
	struct symbol *symbol;

	if (!symbols || !name)
		return K_NONE;

	symbol = find(symbols, name);

	return symbol ? symbol->kind : K_NONE;
}

enum token_t symbols_type_of(struct symbols *symbols, const char *name)
{
	struct symbol *symbol;

	if (!symbols || !name)
		return UNDEF;

	symbol = find(symbols, name);

	return symbol ? symbol->type : UNDEF;
}

int symbols_index_of(struct symbols *symbols, const char *name)
{
	struct symbol *symbol;

	if (!symbols || !name)
		return -EINVAL;

	symbol = find(symbols, name);

	return symbol ? symbol->indx : NOT_FOUND;
}
