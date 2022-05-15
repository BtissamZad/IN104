//palindrome
%{
    /* Definition section */
    #include <stdio.h>
    #include <stdlib.h>
    #include "y.tab.h"
%}

/* %option noyywrap */

/* Rule Section */
%%

[a-zA-Z]+   {yylval.f = yytext; return STR;}
[-+()*/]    {return yytext[0];}
[ \t\n]      {;}

%%

 int yywrap()
 {
  return -1;
 }



/// count the frequency of a word
 %{
 #include<stdio.h>
 #include<string.h>

 char word [] = "geeks";
 int count = 0;


 %}

 /* Rule Section */
 /* Rule 1 compares the matched token with the
    word to count and increments the count variable
    on successful match  */
 /* Rule 2 matches everything other than string
    (consists of alphabets only ) and do nothing */

 %%
 [a-zA-Z]+    { if(strcmp(yytext, word)==0)
                    count++; }
 .  ;
 %%


 int yywrap()
 {
     return 1;
 }

 /* code section */
 int main()
 {
         extern FILE *yyin, *yyout;

         /* open the input file
            in read mode */
         yyin=fopen("input.txt", "r");
         yylex();

         printf("%d", count);

 }






 // copy teh content of a file to another file
 %{
 #include<stdio.h>
 #include<string.h>
 char line[100];

 %}

 /* Rule Section */
 /* Rule 1 writes the string stored in line
    character array to file output.txt */
 /* Rule 2 copies the matched token
    i.e every character except newline character
     to line character array  */

 %%
 ['\n']    { fprintf(yyout,"%s\n",line);}
 (.*)      { strcpy(line,yytext); line[0] = '\0'; }
 <<EOF>> { fprintf(yyout,"%s",line); return 0;}
 %%


 int yywrap()
 {
     return 1;
 }

 /* code section */
 int main()
 {
         extern FILE *yyin, *yyout;
         /* open the source file
            in read mode */
     yyin=fopen("input.txt","r");


         /* open the output file
            in write mode */
     yyout=fopen("output.txt","w");
     yylex();
 }


 //valid arithmetic expression
%{
   /* Definition section */
  #include<stdio.h>
  #include "y.tab.h"
  extern int yylval;
%}

/* Rule Section */
%%
[0-9]+ {
          yylval=atoi(yytext);
          return NUMBER;

       }
[\t] ;

[\n] return 0;

. return yytext[0];

%%

int yywrap()
{
 return 1;
}


//
%{
    /* Definition section*/
    #include "y.tab.h"
    extern yylval;
}%

%%
[0-9]+    {
              yylval = atoi(yytext);
              return NUMBER;
            }

[a-zA-Z]+    { return ID; }
[ \t]+         ;  /*For skipping whitespaces*/

\n            { return 0; }
.            { return yytext[0]; }

%%



/*lex code to count words that are less than 10
	- and greater than 5 */

	%{
	int len=0, counter=0;
	%}

	%%
	[a-zA-Z]+ { len=strlen(yytext);
				if(len<10 && len>5)
				{counter++;} }
	%%

	int yywrap (void )
	{
		return 1;
	}

	int main()
	{
	printf("Enter the string:");
	yylex();
	printf("\n %d", counter);
	return 0;
	}



/* Lex program to print the total characters,
white spaces, tabs in the given input file.
*/

%
{
	int n, w, c;
	%
}
% %
\n { n++; }
[^ \n\t] +
{
	w++;
	c = c + yyleng;
}
.c++;
% % int yywrap(void)
{
	return 1;
}


main()
{
	extern FILE* yyin;
	yyin = fopen("input.txt", "r");
	yylex();
	printf("Line= %d word=%d total char=%d \n", n, w, c);
}



