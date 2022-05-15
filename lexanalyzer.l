%{
 /* besoin de ceci pour l'appel à atof() plus bas */
#include <math.h>
%}

CHIFFRE  [0-9]
ID       [a-z][a-z0-9]*
%%
{CHIFFRE}+  {
                printf( "Un entier : %s (%d)\n", yytext, atoi(yytext));
                }
{CHIFFRE}+"."{CHIFFRE}* {
                printf( "Un nombre flottant : %s (%g)\n", yytext,
                atof(yytext));
                }
si saint sulpice|supplice|luxembourg|def|boucle d'or()|pret à envahir les écrans|au clavier chef|please collect all your belongings ()|soulmate {printf( "Un mot-clé : %s\n", yytext );}

{ID}       { printf( "Un identificateur : %s\n", yytext );}

"+"|"-"|"*"|"/"   {printf( "Un opérateur : %s\n", yytext );}
"{"[^}\n]*"}"     /* manger les commentaires d'une ligne */

 /* manger les blancs */

.           {printf( "Caractère non reconnu : %s\n", yytext );}
\n    {return 0;}


%%

int main(int argc, char* argv[}] ){


   if ( argc > 1 ){
                yyin = fopen( argv[1], "r" );
   }else{
                yyin = stdin;
   }
   yylex();
}
