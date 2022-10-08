#ifndef CODE_WRITER_H
#define CODE_WRITER_H

#include <stdio.h>
#include "parser.h"

struct writer {
	FILE *fp;
	const char *file;
	const char *func;
	int ret;
	int eq_count;
	int gt_count;
	int lt_count;
};

struct writer *writer_init(const char *file);
void set_file_name(struct writer *writer, const char *file);
void writer_deinit(struct writer *writer);

int write_bootstrap(struct writer *writer);
int write_comment(struct writer *writer, const char *comment);
int write_arithmetic(struct writer *writer, enum arithmetic_t type);
int write_push_pop(struct writer *writer, enum cmd_t type,
		   struct push_pop *push_pop);
int write_label(struct writer *writer, char *label);
int write_goto(struct writer *writer, char *label);
int write_if_goto(struct writer *writer, char *label);
int write_function(struct writer *writer, struct function *func);
int write_call(struct writer *writer, struct call *call);
int write_return(struct writer *writer);

int write_end(struct writer *writer);

#endif /* CODE_WRITER_H */
