#include <stdlib.h>
#include <string.h>

struct table_elem {
	char *key;
	char *val;
};

static struct table_elem dests[]  = {
	{ .key = NULL,	 .val = "000" },
	{ .key = "M",	 .val = "001" },
	{ .key = "D",	 .val = "010" },
	{ .key = "DM",	 .val = "011" },
	{ .key = "MD",	 .val = "011" },
	{ .key = "A",	 .val = "100" },
	{ .key = "AM",	 .val = "101" },
	{ .key = "MA",	 .val = "101" },
	{ .key = "AD",	 .val = "110" },
	{ .key = "DA",	 .val = "110" },
	{ .key = "ADM",	 .val = "111" }
};

static struct table_elem comps[]  = {
	{ .key = "0",	 .val = "0101010" },
	{ .key = "1",	 .val = "0111111" },
	{ .key = "-1",	 .val = "0111010" },
	{ .key = "D",	 .val = "0001100" },
	{ .key = "A",	 .val = "0110000" },
	{ .key = "M",	 .val = "1110000" },
	{ .key = "!D",	 .val = "0001101" },
	{ .key = "!A",	 .val = "0110001" },
	{ .key = "!M",	 .val = "1110001" },
	{ .key = "-D",	 .val = "0001111" },
	{ .key = "-A",	 .val = "0110011" },
	{ .key = "-M",	 .val = "1110011" },
	{ .key = "D+1",	 .val = "0011111" },
	{ .key = "A+1",	 .val = "0110111" },
	{ .key = "M+1",	 .val = "1110111" },
	{ .key = "D-1",	 .val = "0001110" },
	{ .key = "A-1",	 .val = "0110010" },
	{ .key = "M-1",	 .val = "1110010" },
	{ .key = "D+A",	 .val = "0000010" },
	{ .key = "D+M",	 .val = "1000010" },
	{ .key = "D-A",	 .val = "0010011" },
	{ .key = "D-M",	 .val = "1010011" },
	{ .key = "A-D",	 .val = "0000111" },
	{ .key = "M-D",	 .val = "1000111" },
	{ .key = "D&A",	 .val = "0000000" },
	{ .key = "D&M",	 .val = "1000000" },
	{ .key = "D|A",	 .val = "0010101" },
	{ .key = "D|M",	 .val = "1010101" }
};

static struct table_elem jmps[]  = {
	{ .key =  NULL,	 .val = "000" },
	{ .key = "JGT",	 .val = "001" },
	{ .key = "JEQ",	 .val = "010" },
	{ .key = "JGE",	 .val = "011" },
	{ .key = "JLT",	 .val = "100" },
	{ .key = "JNE",	 .val = "101" },
	{ .key = "JLE",	 .val = "110" },
	{ .key = "JMP",	 .val = "111" }
};

static const char *get_val(struct table_elem elems[], size_t size,
			   const char *key)
{
	size_t i;

	for (i = 0; i < size; i++) {
		if (!key && !elems[i].key)
			return elems[i].val;
		else if (elems[i].key &&
			 !strncmp(key, elems[i].key, strlen(key) + 1))
			return elems[i].val;
	}

	return NULL;
}

const char *code_dest(const char *dest)
{
	return get_val(dests, sizeof(dests)/sizeof(dests[0]), dest);
}

const char *code_comp(const char *comp)
{
	return get_val(comps, sizeof(comps)/sizeof(comps[0]), comp);
}

const char *code_jmp(const char *jmp)
{
	return get_val(jmps, sizeof(jmps)/sizeof(jmps[0]), jmp);
}
