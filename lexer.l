
%{
    #include<stdio.h>
    #include<stdlib.h>
    #include"parser.tab.h"
    #include <math.h>
%}

DIGIT    [0-9]
ID       [a-z][a-zA-Z0-9]*

%%

{DIGIT}+    { yylval.ent = atoi( yytext ) ;printf("Enitier : %d\n", atoi(yytext); return ENTIER;
            }

{DIGIT}+"."{DIGIT}*        {yylval.num =atof( yytext ) ;printf("Nombre : %f\n",atof(yytext)); return NUMBER;
            }

"Si Saint Sulpice est pour"|"Suplice"|"Passeport"|"Luxembourg"|"fais voir"|"au revoir"|"boucle d or "|"au clavier chef "|"Pret a envahir les ecrans"|"please collect all your belongings "|"soulmate"       {yylval.mot= yytext;printf("Keyword : %s\n",yytext); return( KEYWORD);
        }

{ID}        printf( "An identifier: %s\n", yytext );

"+"   {printf("Opérateur :  GAGNE\n"); return GAGNE ;}
"-"   {printf("Opérateur :  PERD\n"); return PERD ;}
"*"   {printf("Opérateur :  DUPLICATION\n"); return DUPLICATION ;}
"/"   {printf("Opérateur :  ENFRACTIONNANT\n"); return ENFRACTIONNANT ;}
"="   {printf("Opérateur :  SOULMATE\n"); return SOULMATE;}

"(" | ")"   {printf("Parenthèses : %s\n", yytext ); return PARENTHESE; }

"$$$"[^}\n]*"$$$"     {}

\n              {printf("EOL\n"); return EOL ;}
[\t]+          {printf(" Whitespace\n"); return WHITESPACE;}
[ ]+           {}

.               {}

%%
int yywrap(){}
int main(int argc,char **argv )
{

    if ( argc > 0 )
            yyin = fopen( argv[1], "r" );
    else
            yyin = stdin;

    yylex();
}