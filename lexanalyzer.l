/* analyseur pour un langage de type Pascal */

    %{
    /* besoin de ceci pour l'appel à atof() plus bas */
    #include <math.h>
    %}

    CHIFFRE  [0-9]
    ID       [a-z][a-z0-9]*
    CHAINE
    %%

    {CHIFFRE}+  {
                printf( "Un entier : %s (%d)\n", yytext, atoi(yytext));
                }

    {CHIFFRE}+"."{CHIFFRE}* {
                printf( "Un nombre flottant : %s (%g)\n", yytext,
                atof(yytext));
                }

    "si Saint Sulpice est pour"|"Supplice"|"pret a envahir les ecrans"|"au clavier chef"|"Passeport"|"luxembourg"|"boucle d or"|"please collect all your belongings"|"fais voir"|"au revoir" {
                printf( "Un mot-clé : %s\n", yytext );
                }

    {ID}        printf( "Un identificateur : %s\n", yytext );

    "+"|"-"|"*"|"/"|"="   {printf( "Un opérateur : %s\n", yytext );}
    "(" | ")"         {printf("parenthèses : %s\n",yytext );}


    "{"[^}\n]*"}"     /* manger les commentaires d'une ligne */

    [ \t\n]+          /* manger les blancs */

    .           printf( "Caractère non reconnu : %s\n", yytext );

    %%

    main( argc, argv )
    int argc;
    char **argv;
        {
        ++argv, --argc;  /* passer le nom du programme */
        if ( argc > 0 )
                yyin = fopen( argv[0], "r" );
        else
                yyin = stdin;

        yylex();
        }
