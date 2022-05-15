
%{


float a;

%}

CHIFFRE  [0-9]
NOMBRE   {CHIFFRE}+

%%
[(-9.999999999999)-9.999999999999]+ {a=a+atof(yytext);}

\n      {return 0 ;}

%%
int yywrap(){}
int main( ) {
        yylex() ;
        printf("la somme est %f\n",a);
        return 0;
       }



%{
float a;
%}

%%
[0.000000000000000000000000-9.9999999999999999999999]+ {a=atof(yytext);}
[(-9.9999999999999999999999)-0.0000000000000000000000]+ {a=-atof(yytext);}
\n   {return 0; }

%%
int yywrap(){}
int main( ) {
        yylex() ;
        printf("la valeur absolue est  %f\n",a);
        return 0;
       }