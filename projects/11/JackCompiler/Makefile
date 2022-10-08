SRCS := main.c tokenizer.c compiler.c symbol-table.c vm-writer.c
OUT := compiler

.PHONY: all clean
all:
	gcc -g -Wall $(SRCS) -o $(OUT) -lm

clean:
	rm -f $(OUT)
