SRCS := main.c parser.c code.c symbols.c
OUT := assembler

.PHONY: all clean
all:
	gcc -g -Wall $(SRCS) -o $(OUT) -lm

clean:
	rm -f $(OUT)
