#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <dirent.h>
#include <libgen.h>

#include "parser.h"
#include "code-writer.h"

#define MAX_FILES	100

static void print_usage(const char *exec)
{
	printf("Usage: %s <file_name>.vm\n", exec);
}

static char *out_file_name(char *path)
{
	struct stat path_stat;
	char *dir_tmp = calloc(1, strlen(path));
	char *out_file = calloc(1, strlen(path) * 2);

	if (!dir_tmp || !out_file)
		return NULL;

	stat(path, &path_stat);
	if(S_ISDIR(path_stat.st_mode)) {
		strcpy(dir_tmp, path);
		sprintf(out_file, "%s/%s", path, basename(dir_tmp));

	} else {
		char *delim = strrchr(path, '.');
		strncpy(out_file, path, delim - path);
	}

	free(dir_tmp);
	// printf("path: '%s', out_file: '%s'\n", path, out_file);

	return out_file;
}

static const char *get_file_ext(const char *filename)
{
    const char *dot = strrchr(filename, '.');

    if (!dot || dot == filename)
	    return "";

    return dot + 1;
}

static char **files_to_translate(const char *path, size_t *size)
{
	size_t i = 0;
	DIR *d;
	struct dirent *dir;
	struct stat path_stat;
	char **files = calloc(1, MAX_FILES * sizeof(*files));

	if (!files)
		return NULL;

	stat(path, &path_stat);
	if(S_ISREG(path_stat.st_mode)) { // is regular file
		files[i] = calloc(1, strlen(path) + 1);
		strcpy(files[i++], path);
		*size = i;
		return files;
	}

	d = opendir(path);
	if (d) {
		while ((dir = readdir(d)) != NULL) {
			if (strncmp("vm", get_file_ext(dir->d_name), 3))
				continue;

			// only .vm files are needed
			files[i] = calloc(1, strlen(path) +
					     strlen(dir->d_name) + 2);

			sprintf(files[i++], "%s/%s", path, dir->d_name);
		}

		closedir(d);
	} else {
		printf("Unable to open dir: '%s'\n", path);
	}

	*size = i;

	return files;
}

static int translate_file(char *file, struct writer *writer, bool first)
{
	int rc = 0;
	struct cmd *cmd;
	struct parser *parser = parser_init(file);

	if (!parser)
		return -ENOMEM;

	file = out_file_name(file);
	set_file_name(writer, basename(file));

	// comment below if for SimpleFunction test
	if (first) {
		rc = write_bootstrap(writer);
		if (rc) {
			printf("Unable to write bootstrap code\n");
			goto exit;
		}
	}

	while(parser_advance(parser)) {
		cmd = parser_cmd(parser);
		if (!cmd)
			goto exit;

		rc = write_comment(writer, parser->line);
		if (rc) {
			printf("Unable to write comment\n");
			goto exit;
		}

		if (cmd->type == C_ARITHMETIC)
			rc = write_arithmetic(writer, cmd->a_type);
		else if (cmd->type == C_PUSH || cmd->type == C_POP)
			rc = write_push_pop(writer, cmd->type, cmd->push_pop);
		else if (cmd->type == C_LABEL)
			rc= write_label(writer, cmd->label);
		else if (cmd->type == C_GOTO)
			rc = write_goto(writer, cmd->goto_label);
		else if (cmd->type == C_IF)
			rc = write_if_goto(writer, cmd->if_goto_label);
		else if (cmd->type == C_FUNCTION)
			rc = write_function(writer, cmd->func);
		else if (cmd->type == C_CALL)
			rc = write_call(writer, cmd->call);
		else if (cmd->type == C_RETURN)
			rc = write_return(writer);

		if (rc) {
			printf("Unable to translate line: '%s\n", parser->line);
			goto exit;
		}
	}

exit:
	parser_deinit(parser);

	return rc;
}

int main(int argc, char *argv[])
{
	int rc = 0;
	char *out_file;
	struct writer *writer;
	char **files;
	size_t files_size, i;
	bool first = true;

	if (argc != 2) {
		print_usage(argv[0]);
		return -EINVAL;
	}

	out_file = out_file_name(argv[1]);
	if (!out_file)
		return -ENOMEM;

	files = files_to_translate(argv[1], &files_size);
	if (!files) {
		printf("Unable to determine what files to translate\n");
		free(out_file);
		return -EFAULT;
	}

	writer = writer_init(out_file);
	if (!writer) {
		free(out_file);
		return -ENOMEM;
	}

	for (i = 0; i < files_size; i++) {
		rc = translate_file(files[i], writer, first);
		if (rc)
			goto exit;

		first = false;
	}

	write_end(writer);

exit:
	writer_deinit(writer);
	free(out_file);

	return rc;
}
