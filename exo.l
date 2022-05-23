
%{
    #include<stdio.h>
    #include<stdlib.h>
    #include"parser.tab.h"
    #include <math.h>
%}

DIGIT    [0-9]
ID       [a-z][a-z0-9]*

%%

{DIGIT}+    { yylval.ent = atoi( yytext ) ; return ENTIER;
            }

{DIGIT}+"."{DIGIT}*        {yylval.num =atof( yytext ) ; return NUMBER;
            }

"Si Saint Sulpice est pour"|"Suplice"|"Passeport"|"Luxembourg"|"fais voir"|"au revoir"|"boucle d or "|"au clavier chef "|"Pret a envahir les ecrans"|"please collect all your belongings "|"soulmate"       {yylval.mot= yytext;return( KEYWORD);
        }

{ID}        printf( "An identifier: %s\n", yytext );

"+"   {return GAGNE ;}
"-"   {return PERD ;}
"*"   { return DUPLICATION ;}
"/"   { return ENFRACTIONNANT ;}
"="   {return SOULMATE;}

"(" | ")"   {return PARENTHESE; }

"$$$"[^}\n]*"$$$"     {}

\n              {return EOL ;}
[ \t]+          {}

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