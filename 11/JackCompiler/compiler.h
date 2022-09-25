#ifndef COMPILATION_ENGINE_H
#define COMPILATION_ENGINE_H

#include "symbol-table.h"
#include "vm-writer.h"
#include "tokenizer.h"

struct compiler {
	const char *file;
	const char *class_name;
	int nvar;
	const char *subroutine_name;
	struct symbols *class_symbols;
	struct symbols *sub_symbols;
	struct vm_writer *writer;
	struct tokenizer *tokenizer;
	int while_indx;
	int if_indx;
};

struct compiler *compiler_init(const char *file, int while_indx, int if_indx);
void compiler_deinit(struct compiler *engine);

int compile(struct compiler *engine);

#endif /* COMPILATION_ENGINE_H */
