%{
	/* Definition section */
#include <stdio.h>
%}

%union { int ent;
         double ree;
         char* mot ;
}

%tokrn EOL
%token<num> NUMBER
%type<num> expr
%token GAGNE PERD DUPLICATION ENFRACTIONNANT

%left GAGNE PERD
%left DUPLICATION ENFRACTIONNANT

/* Rule Section */
%%

input :
      | line input
      ;

line : expr EOL {printf("%d\n",$1);}
      | EOL ;
expr : NUMBER {$$=$1;}
     | expr GAGNE expr {$$=$1 +$3;}
     | expr PERD expr {$$=$1-$3;}
     | expr DUPLICATION expr {$$=$1 * $3;}
     | ENFRACTIONNANT expr expr {$$= $2 / $3 ;}
     ;




AFFICHAGE: "prêt à envahir les écrans" "(" EXPR ")" {
                             printf("%s\n",$3);
                             return 0;
            };
EXPR :


% %

int main() {
	printf("Enter the expression\n");
	yyparse();

	return 0;
}

/* For printing error messages */
int yyerror(char* s) {
	printf("\nExpression is invalid\n");
	return 0;
}
