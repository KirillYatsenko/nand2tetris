#ifndef SYMBOLS_H
#define SYMBOLS_H

#include <stdbool.h>

struct symbol_entry {
	const char *name;
	int addr;
	bool prefill;
	struct symbol_entry *next;
};

struct symbols {
	struct symbol_entry *head;
	struct symbol_entry *tail;
};

struct symbols *symbols_init();
void symbols_deinit(struct symbols *symbols);

int symbols_add(struct symbols *symbols, const char *name, int addr);
bool symbols_exist(struct symbols *symbols, const char *name);
int symbols_get_addr(struct symbols *symbols, const char *name);

#endif /* SYMBOLS_H */
