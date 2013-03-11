CC = gcc
YACC = bison
LEX = flex

FLAGS = -O2 -Wall
LINK_LIB = 
OBJS = main.o json.o MyString.o parser.tab.o lex.yy.o
GENERAT_SRC = parser.tab.c parser.tab.h lex.yy.c

json.exe : $(OBJS)
	$(CC) $(FLAGS) -o $@ $^ $(LINK_LIB)

.c.o :
	$(CC) $(FLAGS) -c $<

parser.tab.c: parser.y
	$(YACC) -d -b parser $^

lex.yy.c: lex.l
	$(LEX) $^

clean :
	-rm -f *.exe  $(OBJS) $(GENERAT_SRC) *.stackdump *~ \#*
