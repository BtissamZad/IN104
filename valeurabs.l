%{
float s=0;

%}

%%
[0-9.999999]+   {s=s+atof(yytext);}
.               {s=s-atof(yytext);}

[\n \n]  {return 0;}

%%
int yywrap(){}
int main (){
    yylex();
    printf("La valeur absolue est : %f \n", s);
    return(0);
}