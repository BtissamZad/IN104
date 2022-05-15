%{
float a;
%}

%%
[0.000000000000000000000000-9.9999999999999999999999]+ {a=atof(yytext);}
[(-9.9999999999999999999999)-0.0000000000000000000000]+ {a=-atof(yytext);}

. {return 0; }

%%
int yywrap(){}
int main( ) {
        yylex() ;
        printf("la valeur absolue est  %f\n",a);
        return 0;
       }













       %{
       float s=0;
       float a;
       %}

       %%
       [(-9.99999999999999999)-9.9999999999999999999999]+ {a=atof(yytext);
                                                           s=max(a,s);
       }

       [ ] {s=a;}
       . {return 0; }

       %%
       int yywrap(){}
       int main( ) {
               yylex() ;
               printf("le max est  %f\n",s);
               return 0; }