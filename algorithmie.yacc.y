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

%token  parentheseOuverte parentheseFermee
%token virgule, double_point
%token fonction, procedure, algorithme
%token declaration
%token debut, fin, retourne
%token debut_si, debut_alors, sinon, fin_si
%token debut_switch,debut_parmi, fin_switch
%token debut_pour, debut_pour_allant_de, debut_pour_pas, faire, fin_pour
%token debut_tant_que, fin_tant_que
%token typeReel, typeEntier, variable

%start Input

%%

 /* On peut déclarer des variables globales, mais ensuite, il faut passer à l'execution du main. 
    La déclaration/définition de fonctions peut se faire avant ou après le main  */ 
Input:		Fonctions Main 

//Fonction x(int a, int b) : entier
Fonctions : 	fonction variable parentheseOuverte ContenuParenthesesFonction parentheseFermee Retour ContenuFontion Fonctions | procedure variable parentheseOuverte ContenuParenthesesFonction parentheseFermee ContenuFontion Fonctions | ; 

//Liste des arguments, ou rien
ContenuParenthesesFonction : Type Argument Arguments | ;

//La fonction a un retour, ou non. Si on ne séparait pas les procédures des fonctions : | ;
Retour : double_point Type ;

Type : TypeReel | TypeEntier

//... , int b
Arguments : virgule Type Argument





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
