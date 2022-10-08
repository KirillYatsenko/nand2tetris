#ifndef COMPILATION_ENGINE_H
#define COMPILATION_ENGINE_H

#include "tokenizer.h"

struct compilation_engine {
	char *file;
	FILE *fp;
	struct tokenizer *tokenizer;
};

struct compilation_engine *compilation_engine_init(const char *file);
void compilation_engine_deinit(struct compilation_engine *engine);

int compile(struct compilation_engine *engine);

#endif /* COMPILATION_ENGINE_H */
