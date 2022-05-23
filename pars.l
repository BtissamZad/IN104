/* Definition section */
#include <stdio.h>
%}

%token NUMBER ID
// setting the precedence
// and associativity of operators
%left '+' '-'
%left '*' '/'

/* Rule Section */
%%
E : T	 {
				printf("Result = %d\n", $$);
				return 0;
			}
T :
	T '+' T { $$ = $1 + $3; }
	| T '-' T { $$ = $1 - $3; }
	| T '*' T { $$ = $1 * $3; }
	| T '/' T { $$ = $1 / $3; }
	| '-' NUMBER { $$ = -$2; }
	| '-' ID { $$ = -$2; }
	| '(' T ')' { $$ = $2; }
	| NUMBER { $$ = $1; }
	| ID { $$ = $1; };


Affichage :"pret à envahir les écrans" "(" EXP ")"{
                                                    printf("%s",$$);
                                                    return 0;
                                                    }
EXP :
        ID {$$=$3}
        ESPACE
        ID ESPACE ID {$$=$1 $2 $3; }




}
% %

int main() {
	printf("Enter the expression\n");
	yyparse();
}

/* For printing error messages */
int yyerror(char* s) {
	printf("\nExpression is invalid\n");
}