
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

    si saint sulpice |supplice|luxembourg|def|boucle d'or        {
                printf( "Un mot-clé : %s\n", yytext );
                }

    {ID}        printf( "Un identificateur : %s\n", yytext );

    "+"|"-"|"*"|"/"   printf( "Un opérateur : %s\n", yytext );

    "{"[^}\n]*"}"     /* manger les commentaires d'une ligne */

    [ \t\n]+          /* manger les blancs */

    .           printf( "Caractère non reconnu : %s\n", yytext );

    %%

    int main(int argc, char* argv ) {

        {
        ++argv, --argc;  /* passer le nom du programme */
        if ( argc > 0 ){
                yyin = fopen( argv[0], "r" );
        }else{
                yyin = stdin;
        }
        yylex();
        }
        }