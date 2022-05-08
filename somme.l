%{
float s=0;

%}

%%
[0.000000-9.999999]+   {s=s+atof(yytext);}


\n  {return 0;}

%%
int yywrap(){}
int main (){
    yylex();
    printf("La somme est : %f \n", s);
    return(0);
}