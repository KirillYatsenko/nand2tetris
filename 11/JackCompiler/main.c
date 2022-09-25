#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <dirent.h>
#include <libgen.h>

#include "compiler.h"

#define MAX_FILES	100

static void print_usage(const char *exec)
{
	printf("Usage: %s <file_name>.jack\n", exec);
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
			if (strncmp("jack", get_file_ext(dir->d_name), 3))
				continue;

			// only .jack files are needed
			files[i] = calloc(1, strlen(path) +
					     strlen(dir->d_name) + 4);

			sprintf(files[i++], "%s/%s", path, dir->d_name);
		}

		closedir(d);
	} else {
		printf("Unable to open dir: '%s'\n", path);
	}

	*size = i;

	return files;
}

int main(int argc, char *argv[])
{
	int rc;
	char **files;
	size_t files_size, i;
	struct compiler *engine;
	int while_indx = 0, if_indx = 0;

	if (argc == 1) {
		print_usage(argv[0]);
		return -EINVAL;
	}

	files = files_to_translate(argv[1], &files_size);
	if (!files) {
		printf("Unable to determine what files to translate\n");
		return -EFAULT;
	}

	for (i = 0; i < files_size; i++) {
		engine = compiler_init(files[i], while_indx, if_indx);
		if (!engine) {
			printf("Unable to init compilation engine\n");
			return -EFAULT;
		}

		rc = compile(engine);
		if (rc) {
			printf("Unable to compile: '%s'\n", files[i]);
			compiler_deinit(engine);
			break;
		}

		while_indx = engine->while_indx;
		if_indx = engine->if_indx;

		compiler_deinit(engine);
	}

	return rc;
}
