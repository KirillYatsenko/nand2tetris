#include <stdlib.h>
#include <errno.h>
#include <string.h>

#include "code-writer.h"
#include "parser.h"
#include "translations.h"

#define FILE_EXT	".asm"
#define COMMENT_PREFIX	"// "

struct writer *writer_init(const char *file)
{
	char *asm_file;
	struct writer *writer;

	if (!file)
		return NULL;

	writer = calloc(1, sizeof(*writer));
	if (!writer)
		return NULL;

	asm_file = calloc(1, strlen(file) + sizeof(FILE_EXT));
	if (!asm_file) {
		free(writer);
		return NULL;
	}

	strcpy(asm_file, file);
	strcat(asm_file, FILE_EXT);

	writer->fp = fopen(asm_file, "w");
	if (!writer->fp) {
		printf("Unable to open file: '%s'\n", asm_file);

		free(asm_file);
		free(writer);
		return NULL;
	}

	free(asm_file);

	return writer;
}

void set_file_name(struct writer *writer, const char *file)
{
	writer->file = file;
}

void writer_deinit(struct writer *writer)
{
	if (!writer)
		return;

	fclose(writer->fp);
	free(writer);
}

int write_bootstrap(struct writer *writer)
{
	char line[512];

	sprintf(line, BOOT, "boot", 0, 0, "Sys.init", "boot", 0);

	if(fputs(line, writer->fp) == EOF)
		return errno;

	return 0;
}

int write_comment(struct writer *writer, const char *comment)
{
	char *line;

	if (!writer || !comment)
		return -EINVAL;

	line = calloc(1, strlen(comment) + sizeof(COMMENT_PREFIX));
	if (!line)
		return -ENOMEM;

	strcat(line, COMMENT_PREFIX);
	strcat(line, comment);

	if(fputs(line, writer->fp) == EOF) {
		free(line);
		return errno;
	}

	free(line);
	return 0;
}

// c = count, f = file
static char *write_cond(const char *fmt, int *c, const char *f, bool *free)
{
	char *line = calloc(1, strlen(fmt) + 128);

	if (!line)
		return NULL;

	sprintf(line, fmt, f, *c, f, *c, f, *c, f, *c);

	*c = *c + 1;

	*free = true;

	return line;
}

int write_arithmetic(struct writer *writer, enum arithmetic_t type)
{
	char *line;
	bool fl; // free line?

	if (!writer)
		return -EINVAL;

	if (type == A_ADD)
		line = ADD;
	else if (type == A_SUB)
		line = SUB;
	else if (type == A_NEG)
		line = NEG;
	else if (type == A_AND)
		line = AND;
	else if (type == A_OR)
		line = OR;
	else if (type == A_NOT)
		line = NOT;

	if (type == A_EQ)
		line = write_cond(EQ, &writer->eq_count, writer->file, &fl);
	else if (type == A_GT)
		line = write_cond(GT, &writer->gt_count, writer->file, &fl);
	else if (type == A_LT)
		line = write_cond(LT, &writer->lt_count, writer->file, &fl);

	if(fputs(line, writer->fp) == EOF)
		return errno;

	if (fl)
		free(line);

	return 0;
}

static const char *convert_segment(enum segment_t segment)
{
	if (segment == S_LOCAL)
		return "LCL";
	else if (segment == S_ARGUMENT)
		return "ARG";
	else if (segment == S_THIS)
		return "THIS";
	else if (segment == S_THAT)
		return "THAT";

	return NULL;
}

int write_push_pop(struct writer *writer, enum cmd_t type,
		   struct push_pop *pp)
{
	char line[512] = "";

	if (!writer || !pp)
		return -EINVAL;

	if (type == C_PUSH && pp->segment == S_CONSTANT) {
		sprintf(line, PUSH_CONST, pp->indx);
	} else if (pp->segment == S_STATIC) {
		const char *fmt = PUSH_STATIC;
		if (type == C_POP)
			fmt = POP_STATIC;

		sprintf(line, fmt, writer->file, pp->indx);
	} else if (pp->segment == S_TEMP) {
		const char *fmt = PUSH_TEMP;
		if (type == C_POP)
			fmt = POP_TEMP;

		sprintf(line, fmt, pp->indx);
	} else if (pp->segment == S_POINTER) {
		const char *this_that = "THIS", *fmt = PUSH_POINTER;
		if (type == C_POP)
			fmt = POP_POINTER;

		if (pp->indx)
			this_that = "THAT";

		sprintf(line, fmt, this_that);
	} else if (pp->segment == S_LOCAL || pp->segment == S_ARGUMENT ||
		   pp->segment == S_THIS || pp->segment == S_THAT) {
		const char *segment, *fmt = PUSH_BASE;
		if (type == C_POP)
			fmt = POP_BASE;

		segment = convert_segment(pp->segment);
		if (!segment) {
			printf("Unable to convert segment to str\n");
			return -EINVAL;
		}

		sprintf(line, fmt, segment, pp->indx);
	}

	if(fputs(line, writer->fp) == EOF)
		return errno;

	return 0;
}

static int write_str(struct writer *writer, const char *fmt, char *str)
{
	char line[128];

	if (!writer || !fmt || !str)
		return -EINVAL;

	sprintf(line, fmt, writer->func, str);

	if(fputs(line, writer->fp) == EOF)
		return errno;

	return 0;
}

int write_label(struct writer *writer, char *label)
{
	return write_str(writer, LABEL, label);
}

int write_goto(struct writer *writer, char *label)
{
	return write_str(writer, GOTO, label);
}

int write_if_goto(struct writer *writer, char *label)
{
	return write_str(writer, IF, label);
}

int write_function(struct writer *writer, struct function *func)
{
	int i;
	char line[512];
	char set_lcl[128];

	if (!writer || !func)
		return -EINVAL;

	sprintf(line, FUNC, func->name);

	for (i = 0; i < func->nvars; i++) {
		sprintf(set_lcl, PUSH_ZERO, i);
		strcat(line, set_lcl);
	}

	if(fputs(line, writer->fp) == EOF)
		return errno;

	writer->ret = 0;
	writer->func = func->name;

	return 0;
}

int write_call(struct writer *writer, struct call *call)
{
	char line[1024];

	sprintf(line, CALL, writer->func, writer->ret, call->nargs, call->func,
		writer->func, writer->ret);

	writer->ret++;

	if(fputs(line, writer->fp) == EOF)
		return errno;

	return 0;
}

int write_return(struct writer *writer)
{
	if(fputs(RETURN, writer->fp) == EOF)
		return errno;

	return 0;
}

int write_end(struct writer *writer)
{
	if(fputs(END, writer->fp) == EOF)
		return errno;

	return 0;
}
