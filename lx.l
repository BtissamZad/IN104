/* scanner for a toy Pascal-like language */

%{
/* need this for the call to atof() below */
#include <math.h>
%}

DIGIT    [0-9]
ID       [a-z][a-z0-9]*

%%

{DIGIT}+    {
            printf( "An integer: %s (%d)\n", yytext,
                    atoi( yytext ) );
            }

{DIGIT}+"."{DIGIT}*        {
            printf( "A float: %s (%g)\n", yytext,
                    atof( yytext ) );
            }

"Si Saint Sulpice est d'accord"|Supplice|"pret à envahir les écrans"|"au clavier chef"|def|luxembourg|"boucle d'or"|"please collect all your belongings"       {
            printf( "A keyword: %s\n", yytext );
            }

{ID}        {printf( "An identifier: %s\n", yytext );}

"+"|"-"|"*"|"/"|"="  { printf( "An operator: %s\n", yytext );}

"(" | ")"            {printf("parenthèses: %s\n",yytext );}
"$$$"[^}\n]*"$$$"     /* eat up one-line comments */

[ \t\n]+          /* eat up whitespace */

.           printf( "Unrecognized character: %s\n", yytext );

%%
int yywrap(){}
int main( int argc, char* argv[] ){
    if ( argc > 0 ){
            yyin = fopen( argv[1], "r" );
    }else{
            yyin = stdin;
    }
    yylex();
    }
    printf(