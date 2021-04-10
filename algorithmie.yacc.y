%{
#define FALSE 0
#define TRUE 1
#include <stdio.h>
#include <stdlib.h>
int div_zero = FALSE;
%}

%token ENTIER
%nonassoc '+'
%left '*'
%nonassoc '-'
%right '/'

%%





lprogramme : programme | lprogramme programme;

programme: 
	  operateur_logique '\n' {
		if(div_zero != TRUE){
			if($1 == TRUE){
				printf("= VRAI\n");
			}
			else{
				printf("= FAUX\n");
			}
		}else{
			printf("Impossible division par 0\n");
			div_zero = FALSE;
		}
	}
	| operateur_relationnel '\n' {
		if(div_zero != TRUE){
			if($1 == TRUE){
				printf("= VRAI\n");
			}
			else{
				printf("= FAUX\n");
			}
		}else{
			printf("Impossible division par 0\n");
			div_zero = FALSE;
		}
	};
	
operateur_logique:
	  operateur_relationnel 'ET' operateur_relationnel{
		$$ = $1 && $3;
	}
	| operateur_relationnel 'OU' operateur_relationnel{
		$$ = $1 || $3;
	}
	| 'NON' operateur_relationnel{
		$$ = !$2;
	};

operateur_relationnel: 
	  expression '==' expression {
		$$ = $1 == $3;
	}
	| expression '<=' expression {
		$$ = $1 <= $3;
	}
	| expression '>=' expression {
		$$ = $1 >= $3;
	}
	| expression '<' expression {
		$$ = $1 < $3;
	}
	| expression '>' expression {
		$$ = $1 > $3;
	}
	| expression '!=' expression {
		$$ = $1 != $3;
	};

expression: ENTIER
      | expression '+' expression {
		$$ = $1 + $3;
      }
      | expression '-' expression {
		$$ = $1 - $3;
      }
      | expression '*' expression {
      	$$ = $1 * $3;
      }
      | expression '/' expression {
      	if($3 != 0){
			$$ = $1 / $3;
		}else{
			$$ = $1;
			div_zero = TRUE;
		}
      };

%%

int main(void) {
	yyparse();
	return EXIT_SUCCESS;
}
