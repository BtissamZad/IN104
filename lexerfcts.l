/*lex program to find the length of a string*/

%{
#include<stdio.h>
int length;
%}

/* Rules Section*/
%%
[a-z A-Z 0-9]+ {length=yyleng; }
%%

int main()
{
yylex();
printf("length of given string is : %d", length);
return 0;
}

%{
int len=0;
%}

// Rules to identify if a character apart from alphabets
// occurs in a string

%%
[a-zA-Z]+ {printf("No character other than alphabets");}

/* here . will match any other character than alphabets
because alphabets are already matched above
* will matches 0 or more characters in front of it.
*/

.* {printf("character other than alphabets present"); }
%%

// code section
int yywrap() { }

int main()
{
yylex();
return 0;
}

%{
/* Definition section */
#include<stdio.h>
#include<stdlib.h>
#include"y.tab.h"
extern int yylval;
%}

/* Rule Section */
%%
0 {yylval=0;return ZERO;}
1 {yylval=1;return ONE;}

[ \t] {;}
\n return 0;
. return yytext[0];
%%


int yywrap()
{
return 1;
}

%{
/* Definition section */
#include "y.tab.h"
%}

/* Rule Section */
%%
[aA] {return A;}
[bB] {return B;}
\n {return NL;}
. {return yytext[0];}
%%

int yywrap()
{
return 1;
}

%{
/* Definition section */
#include "y.tab.h"
%}

/* Rule Section */
%%
[aA] {return A;}
[bB] {return B;}
\n {return NL;}
. {return yytext[0];}
%%

int yywrap()
{
return 1;
}

/% Lex Program to remove comments from C program
and save it in a file %/
/*Definition Section*/
%{
%}

/*Starting character sequence for multiline comment*/
start \/\*
/*Ending character sequence for multiline comment*/
end \*\/

/*Rule Section*/
%%

/*Regular expression for single line comment*/
\/\/(.*) ;
/*Regular expression for multi line comment*/
{start}.*{end} ;

%%

/*Driver function*/
int main(int k,char **argcv)
{
yyin=fopen(argcv[1],"r");
yyout=fopen("out.c","w");
/*call the yylex function.*/
yylex();
return 0;
}

/*lex code to find the length of the longest word*/

% {
int counter = 0; %
}

%
% [a - zA - Z] + {
if (yyleng > counter) {
	counter = yyleng;
}
} %
%

main() {
yylex();
printf("largest: %d", counter);
printf("\n");
}

/*Lex code to count total number of tokens */

%{
int n = 0 ;
%}

// rule section
%%

//count number of keywords
"while"|"if"|"else" {n++;printf("\t keywords : %s", yytext);}

// count number of keywords
"int"|"float" {n++;printf("\t keywords : %s", yytext);}

// count number of identifiers
[a-zA-Z_][a-zA-Z0-9_]* {n++;printf("\t identifier : %s", yytext);}

// count number of operators
"<="|"=="|"="|"++"|"-"|"*"|"+" {n++;printf("\t operator : %s", yytext);}

// count number of separators
[(){}|, ;] {n++;printf("\t separator : %s", yytext);}

// count number of floats
[0-9]*"."[0-9]+ {n++;printf("\t float : %s", yytext);}

// count number of integers
[0-9]+ {n++;printf("\t integer : %s", yytext);}

. ;
%%


int main()

{

	yylex();

	printf("\n total no. of token = %d\n", n);

}

/*lex code to count the number of lines,
	tabs and spaces used in the input*/

%{
#include<stdio.h>
int lc=0, sc=0, tc=0, ch=0; /*Global variables*/
%}

/*Rule Section*/
%%
\n lc++; //line counter
([ ])+ sc++; //space counter
\t tc++; //tab counter
. ch++;	 //characters counter
%%

int main()
{
	// The function that starts the analysis
	yylex();

	printf("\nNo. of lines=%d", lc);
	printf("\nNo. of spaces=%d", sc);
	printf("\nNo. of tabs=%d", tc);
	printf("\nNo. of other characters=%d", ch);

}

/*Lex program to take input from file and
remove multiple spaces, newline and tab
and write output in a separate file*/

% {
	/*Definition section */
	%
}

/* Rule: whenever space, tab or
newline is encounterd, remove it*/
% %
[ \n\t]+ {fprintf(yyout, "");}
.	 { fprintf(yyout, "%s", yytext); }
% %

int yywrap(){}

// driver code
int main()
{

	/* yyin and yyout as pointer
	of File type */
	extern FILE *yyin, *yyout;

	/* yyin points to the file input.txt
	and opens it in read mode*/
	yyin = fopen("Input.txt", "r");

	/* yyout points to the file output.txt
	and opens it in write mode*/
	yyout = fopen("Output.txt", "w");

	yylex();
	return 0;
}

/*lex program to count number of words*/
%{
#include<stdio.h>
#include<string.h>
int i = 0;
%}

/* Rules Section*/
%%
([a-zA-Z0-9])* {i++;} /* Rule for counting
						number of words*/

"\n" {printf("%d\n", i); i = 0;}
%%

int yywrap(void){}

int main()
{
	// The function that starts the analysis
	yylex();

	return 0;
}

/*easy */

/* Program to add line numbers
to a given file*/
%{
int line_number = 1; // initializing line number to 1
%}

/* simple name definitions to simplify
the scanner specification name
definition of line*/
line .*\n

%%
{line} { printf("%10d %s", line_number++, yytext); }

/* whenever a line is encountered increment count*/

/* 10 specifies the padding from left side to
					present the line numbers*/

/* yytext The text of the matched pattern is stored
						in this variable (char*)*/
%%

int yywrap(){}

int main(int argc, char*argv[])
{
extern FILE *yyin; // yyin as pointer of File type

yyin = fopen("testtest.c","r"); /* yyin points to the file
								testtest.c and opens it
								in read mode.*/

yylex(); // The function that starts the analysis.

return 0;
}

/*** Definition Section has one variable
which can be accessed inside yylex()
and main() ***/
%{
int count = 0;
%}

/*** Rule Section has three rules, first rule
matches with capital letters, second rule
matches with any character except newline and
third rule does not take input after the enter***/
%%
[A-Z] {printf("%s capital letter\n", yytext);
	count++;}
.	 {printf("%s not a capital letter\n", yytext);}
\n {return 0;}
%%

/*** Code Section prints the number of
capital letter present in the given input***/
int yywrap(){}
int main(){

// Explanation:
// yywrap() - wraps the above rule section
/* yyin - takes the file pointer
		which contains the input*/
/* yylex() - this is the main flex function
		which runs the Rule Section*/
// yytext is the text in the buffer

// Uncomment the lines below
// to take input from file
// FILE *fp;
// char filename[50];
// printf("Enter the filename: \n");
// scanf("%s",filename);
// fp = fopen(filename,"r");
// yyin = fp;

yylex();
printf("\nNumber of Capital letters "
	"in the given input - %d\n", count);

return 0;
}
