%{
#define FALSE 0
#define TRUE 1
#include <stdio.h>
#include <stdlib.h>
#include "fichier.h"

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
Fonctions : 	fonction variable parentheseOuverte ContenuParenthesesFonction parentheseFermee Retour ContenuFontion Fonctions | procedure variable parentheseOuverte ContenuParenthesesFonction parentheseFermee ContenuProcedure Fonctions | ; 

//Liste des arguments, ou rien
ContenuParenthesesFonction : Type Argument Arguments | ;

//La fonction a un retour, ou non. Si on ne séparait pas les procédures des fonctions : | ;
Retour : double_point Type ;

Type : TypeReel | TypeEntier

//... , int b
Arguments : virgule Type Argument Arguments  | ; 
Argument : variable

//On pourrait faire une simplification avec Declarations debut ListeInstructions
ContenuFonction : Declarations debut ListeInstructions Retourner fin
ContenuProcedure : Declarations debut ListeInstructions fin
Main : Declarations debut ListeInstructions fin

//RETOURNE a ou RETOURNER 0
Retourner : retourne Variable_ou_nombre

Declarations : Declaration Declarations | ;
Declaration : variable double_point Type

ListeInstructions : Ensemble ListeInstructions | ;


Ensemble : Complexe | Instruction | ;

//On gère les "complexes" génériquement avant de les renvoyer vers chaque. En gros, une boucler peut contenir un comple if, qui peut à son tour contenir un switch, etc.
Complexe : debut_si Operation_logique debut_alors Complexe_Si fin_si
| debut_switch variable debut_parmi Complexe_Switch fin_switch
| debut_pour variable debut_pour_allant_de Variable_ou_nombre debut_pour_a POUR_PAS faire Ensemble fin_pour
| debut_tant_que Opération_logique faire Ensemble fin_tant_que
| faire Ensemble debut_tant_que Opération_logique fin_tant_que

POUR_PAS : debut_pour_pas Variable_ou_nombre | ; 
Variable_ou_nombre : variable | ENTIER
 
Complexe_Si : Ensemble Complexe_Sinon fin_si

Complexe_Sinon : sinon Ensemble | ;

//On n'a pas de booleen ou de caractere. On utilise donc un entier pour le switch (reel = pas supporté dans les langages de toute façon)
Complexe_Switch : ENTIER double_point Ensemble fin Complexe_Switch | defaut double_point Ensemble fin


Opération_logique : 

//On peut avoir un simple appel de fonction de type lire() ou mafonction(args) en AppelFonction. Calcul correspond à z = x + y ou z = x * lire() + y * mafonction() ou z = mafonction()
Instruction : Calcul | AppelFonction

AppelFonctionSeule : lire parentheseOuverte variable parentheseFermee | ecrire parentheseOuverte variable parentheseFermee | variable parentheseOuverte ListeArgumentsAppel parentheseFermee

//On a pas le type lors d'un appel, on a donc une légère redondance
ListeArgumentsAppel : ArgumentAppel ArgumentsAppel | ;
ArgumentsAppel : virgule ArgumentAppel | ;
ArgumentAppel : variable

Calcul : variable egal Operation

Operation : parentheseOuverte Expression Operateur Expression parentheseFermee | Expression Operateur Expression | Expression
Expression : Operation | Variable_ou_nombre | variable parentheseOuverte ListeArgumentsAppel parentheseFermee




lprogramme : programme | lprogramme programme;






Operation_logique: 
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


int main(int argc, char** argv) {

	FILE* entree, * sortie;
	char nomSortie[256];
	
	if (argv[1]) == NULL) {
		fprintf(stderr, "Erreur : Merci de préciser un fichier à analyser (avec l'extension).\nExemple : ./algorithmie exemple1.txt sortie.txt\nLe nom du fichier de sortie est optionnel (sortie.txt par défaut)\n");
		exit(EXIT_FAILURE);
	}
	if (argv[2]) == NULL) {
		nomSortie = "sortie.txt";
	}
	else{
		strcpy(nomSortie, argv[2]);
	}
	
	//ouverture du fichier de sortie
	sortie = createFichier(nomSortie);
	
	//ouverture du fichier d'entrée
	entree = readFichier(argv[1]);
	
	//parse
	yyin = entree;
	yyparse();
	
	//fclose
	fclose(entree);
	fclose(sortie);
	
	
	return EXIT_SUCCESS;
}
