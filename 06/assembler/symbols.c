#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <stdio.h>

#include "symbols.h"

static struct symbol_entry prefill[] = {
	{.name = "R0",      .addr = 0},
	{.name = "R1",      .addr = 1},
	{.name = "R2",      .addr = 2},
	{.name = "R3",      .addr = 3},
	{.name = "R4",      .addr = 4},
	{.name = "R5",      .addr = 5},
	{.name = "R6",      .addr = 6},
	{.name = "R7",      .addr = 7},
	{.name = "R8",      .addr = 8},
	{.name = "R9",      .addr = 9},
	{.name = "R10",     .addr = 10},
	{.name = "R11",     .addr = 11},
	{.name = "R12",     .addr = 12},
	{.name = "R13",     .addr = 13},
	{.name = "R14",     .addr = 14},
	{.name = "R15",     .addr = 15},
	{.name = "SP",      .addr = 0},
	{.name = "LCL",     .addr = 1},
	{.name = "ARG",     .addr = 2},
	{.name = "THIS",    .addr = 3},
	{.name = "THAT",    .addr = 4},
	{.name = "SCREEN",  .addr = 16384},
	{.name = "KBD",     .addr = 24576}
};

static void add(struct symbols *symbols, struct symbol_entry *entry)
{
	if (!symbols->head) {
		symbols->head = entry;
		symbols->tail = entry;
	} else {
		symbols->tail->next = entry;
		symbols->tail = entry;
	}
}

struct symbols *symbols_init()
{
	int i, n;
	struct symbols *symbols = calloc(1, sizeof(struct symbols));

	if (!symbols)
		return NULL;

	n = sizeof(prefill) / sizeof(prefill[0]);
	for (i = 0; i < n; i++) {
		prefill[i].prefill = true;
		add(symbols, &prefill[i]);
	}

	return symbols;
}

void symbols_deinit(struct symbols *symbols)
{
	struct symbol_entry *next;
	struct symbol_entry *entry = symbols->head;

	if (!symbols)
		return;

	while (entry) {
		next = entry->next;

		if (!entry->prefill) {
			free((void *)entry->name);
			free(entry);
		}

		entry = next;
	}

	free(symbols);
}

int symbols_add(struct symbols *symbols, const char *name, int addr)
{
	struct symbol_entry *entry;

	if (!symbols || !name || addr < 0)
		return -EINVAL;

	entry = calloc(1, sizeof(*entry));
	if (!entry)
		return -ENOMEM;

	entry->name = name;
	entry->addr = addr;

	add(symbols, entry);

	return 0;
}

static struct symbol_entry *find(struct symbols *symbols, const char *name)
{
	struct symbol_entry *entry;

	if (!symbols || !symbols->head || !name)
		return NULL;

	entry = symbols->head;

	while (entry) {
		if (!strncmp(name, entry->name, strlen(name) + 1))
			return entry;

		entry = entry->next;
	}

	return NULL;
}

bool symbols_exist(struct symbols *symbols, const char *name)
{
	return find(symbols, name) != NULL;
}

int symbols_get_addr(struct symbols *symbols, const char *name)
{
	struct symbol_entry *entry = find(symbols, name);

	if (!entry) {
		printf("Unable to find symbol: '%s'\n", name);
		return -EINVAL;
	}

	return entry->addr;
}
