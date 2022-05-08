%{
int c=0;
float s=0;

%}

%%
[0.0000001-9.9999999]+   {s=s+atof(yytext);}


\n  {return 0;}

%%
int yywrap(){}
int main (){
    yylex();
    printf("La somme est : %f \n", s);
    return(0);
}