SRCS := main.c parser.c code-writer.c
OUT := translator

.PHONY: all clean
all:
	gcc -g -Wall $(SRCS) -o $(OUT) -lm

clean:
	rm -f $(OUT)
