#ifndef COMPILATION_ENGINE_H
#define COMPILATION_ENGINE_H

#include "symbol-table.h"
#include "vm-writer.h"
#include "tokenizer.h"

struct compilation_engine {
	const char *file;
	struct symbols *class_symbols;
	struct symbols *sub_symbols;
	struct vm_writer *writer;
	struct tokenizer *tokenizer;
};

struct compilation_engine *compilation_engine_init(const char *file);
void compilation_engine_deinit(struct compilation_engine *engine);

int compile(struct compilation_engine *engine);

#endif /* COMPILATION_ENGINE_H */
