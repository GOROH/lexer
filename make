CC=gcc
CFLAGS=-lfl
LEX=flex
LEXFLAGS=
LEX_FILE=lexer.l
LEX_COMP=lexer.c
TARGET=lexer

all: code binary

binary:
	$(CC) -o ${TARGET} $(LEX_COMP) $(CFLAGS)

code:
	$(LEX) $(LEXFLAGS) -o $(LEX_COMP) $(LEX_FILE)

clean:
	rm -f $(LEX_COMP) $(TARGET)
