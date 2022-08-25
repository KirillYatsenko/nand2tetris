SRCS := main.c tokenizer.c compilation-engine.c
OUT := compiler

.PHONY: all clean
all:
	gcc -g -Wall $(SRCS) -o $(OUT) -lm

clean:
	rm -f $(OUT)
