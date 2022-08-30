#ifndef VM_WRITER_H
#define VM_WRITER_H

#include <stdio.h>

#include "tokenizer.h"

struct vm_writer {
	char *file;
	FILE *fp;
};

enum segment {
	S_CONSTANT = 0,
	S_ARGUMENT,
	S_LOCAL,
	S_STATIC,
	S_THIS,
	S_THAT,
	S_POINTER,
	S_TEMP
};

struct vm_writer *vm_writer_init(const char *file);

void vm_writer_deinit(struct vm_writer *writer);

int write_push(struct vm_writer *writer, enum segment segment, int indx);
int write_pop(struct vm_writer *writer, enum segment segment, int indx);
int write_arithmetic(struct vm_writer *writer, enum token_t command);
int write_label(struct vm_writer *writer, const char *name);
int write_goto(struct vm_writer *writer, const char *name);
int write_if(struct vm_writer *writer, const char *name);
int write_call(struct vm_writer *writer, const char *name, int nargs);
int write_function(struct vm_writer *writer, const char *name, int nvars);
int write_return(struct vm_writer *writer);

#endif /* VM_WRITER_H */
