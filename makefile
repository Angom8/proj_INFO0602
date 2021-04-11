EXECUTABLE = algorithmie

LEX_FILE = algorithmie.lex
YACC_FILE = algorithmie.yacc.y

LEX = flex
LEXFLAGS = 
LEXLIB = -lfl
YACC = yacc
YACCFLAGS = -vd
YACCLIB = 

$(EXECUTABLE): y.tab.o lex.yy.o fichier.o quadruplet.o
	gcc -o $(EXECUTABLE) lex.yy.o y.tab.o $(LEXLIB) $(YACCLIB) -W -Wall

lex.yy.o: lex.yy.c y.tab.h
	gcc -c lex.yy.c

lex.yy.c: $(LEX_FILE)
	$(LEX) $(LEXFLAGS) $(LEX_FILE) 

y.tab.o : y.tab.h y.tab.c
	gcc -c y.tab.c

y.tab.c y.tab.h : $(YACC_FILE)
	$(YACC) $(YACCFLAGS) $(YACC_FILE)
	
fichier.o : fichier.h fichier.c
	gcc -c fichier.h fichier.c -W -Wall
	
quadruplet.o : quadruplet.h quadruplet.c
	gcc -c quadruplet.h quadruplet.c -W -Wall

clean:
	rm -f *~ \#* *.o
	rm -f $(EXECUTABLE) $(EXECUTABLE:=.exe)
	rm -f *.core *.stackdump
	rm -f lex.yy.c lex.yy.o
	rm -f y.tab.* y.output
