Generalife:
	bison -d parser.y
	flex lexer.l
	gcc -o $@ generalife.tab.c lex.yy.c -lfl
	./generalife test.txt