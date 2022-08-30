#include <stdlib.h>
#include <string.h>
#include <errno.h>

#include "vm-writer.h"

static char *out_file_name(const char *path)
{
	char *_path, *delim = strrchr(path, '.');
	if (!delim)
		return NULL;

	_path = calloc(1, strlen(path) + 3);
	if (!_path)
		return NULL;

	strncpy(_path, path, delim - path + 1);
	strcat(_path, "vm");

	return _path;
}

struct vm_writer *vm_writer_init(const char *file)
{
	struct vm_writer *writer;
	if (!file)
		return NULL;

	writer = calloc(1, sizeof(*writer));
	if (!writer)
		return NULL;

	writer->file = out_file_name(file);
	if (!writer->file) {
		printf("Invalid file name: '%s'\n", file);
		free(writer);
		return NULL;
	}

	writer->fp = fopen(writer->file, "w");
	if (!writer->fp) {
		printf("Unable to open file: '%s'\n", file);
		free(writer->file);
		free(writer);
		return NULL;
	}

	return writer;
}

void vm_writer_deinit(struct vm_writer *writer)
{
	if (!writer)
		return;

	fclose(writer->fp);
	free(writer->file);
	free(writer);
}

int write_push(struct vm_writer *writer, enum segment segment, int indx);
int write_pop(struct vm_writer *writer, enum segment segment, int indx);
int write_arithmetic(struct vm_writer *writer, enum token_t command);
int write_label(struct vm_writer *writer, const char *name);
int write_goto(struct vm_writer *writer, const char *name);
int write_if(struct vm_writer *writer, const char *name);
int write_call(struct vm_writer *writer, const char *name, int nargs);
int write_function(struct vm_writer *writer, const char *name, int nvars);
int write_return(struct vm_writer *writer);
