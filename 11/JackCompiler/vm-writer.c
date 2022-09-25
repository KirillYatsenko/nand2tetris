#include <stdlib.h>
#include <string.h>
#include <errno.h>

#include "tokenizer.h"
#include "vm-writer.h"
#include "tralsations.h"

const char *segment_str[] = {"constant", "argument", "local",	"static",
			     "this",	 "that",     "pointer", "temp"};

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

static int write(struct vm_writer *writer, const char *line)
{
	if(fputs(line, writer->fp) == EOF)
		return errno;

	return 0;
}

int write_push(struct vm_writer *writer, enum segment segment, int indx)
{
	char line[512] = "";

	if (!writer)
		return -EINVAL;

	sprintf(line, T_PUSH, segment_str[segment], indx);

	return write(writer, line);
}

int write_pop(struct vm_writer *writer, enum segment segment, int indx)
{
	char line[512] = "";

	if (!writer)
		return -EINVAL;

	sprintf(line, T_POP, segment_str[segment], indx);

	return write(writer, line);
}

int write_arithmetic(struct vm_writer *writer, enum token_t command)
{
	if (!writer)
		return -EINVAL;

	if (command == ADD)
		return write(writer, T_ADD);
	else if (command == MINUS)
		return write(writer, T_SUB);
	else if (command == MULT)
		return write(writer, T_MULT);
	else if (command == DIV)
		return write(writer, T_DIV);
	else if (command == AND)
		return write(writer, T_AND);
	else if (command == OR)
		return write(writer, T_OR);
	else if (command == LT)
		return write(writer, T_LT);
	else if (command == GT)
		return write(writer, T_GT);
	else if (command == EQL)
		return write(writer, T_EQL);
	else if (command == NEG)
		return write(writer, T_NEG);
	else if (command == NOT)
		return write(writer, T_NOT);

	return 0;
}

int write_label(struct vm_writer *writer, const char *name, int indx)
{
	char line[512] = "";

	if (!writer || !name)
		return -EINVAL;

	sprintf(line, T_LABEL, name, indx);

	return write(writer, line);
}

int write_goto(struct vm_writer *writer, const char *label, int indx)
{
	char line[512] = "";

	if (!writer || !label)
		return -EINVAL;

	sprintf(line, T_GOTO, label, indx);

	return write(writer, line);
}

int write_if(struct vm_writer *writer, const char *label, int indx)
{
	char line[512] = "";

	if (!writer || !label)
		return -EINVAL;

	sprintf(line, T_IF, label, indx);

	return write(writer, line);
}

int write_call(struct vm_writer *writer, const char *name, int nargs)
{
	char line[512] = "";

	if (!writer || !name)
		return -EINVAL;

	sprintf(line, T_CALL, name, nargs);

	return write(writer, line);
}

int write_function(struct vm_writer *writer, const char *className,
		   const char *name, int nvars)
{
	char line[512] = "";

	if (!writer || !name)
		return -EINVAL;

	sprintf(line, T_FUNC, className, name, nvars);

	return write(writer, line);
}

int write_return(struct vm_writer *writer)
{
	char line[512] = "";

	if (!writer)
		return -EINVAL;

	sprintf(line, T_RET);

	return write(writer, line);
}
