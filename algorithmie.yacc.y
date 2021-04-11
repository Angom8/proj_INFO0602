%{
#define FALSE 0
#define TRUE 1
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "fichier.h"



FILE* entree;
int div_zero = FALSE;
%}


%token  parentheseOuverte parentheseFermee
%token virgule double_point egal
%token fonction procedure algorithme
%token fonction_lire fonction_ecrire
%token declaration
%token debut fin retourne
%token debut_si debut_alors sinon fin_si
%token debut_switch debut_parmi fin_switch defaut
%token debut_pour debut_pour_allant_de debut_pour_pas faire fin_pour debut_pour_a
%token debut_tant_que fin_tant_que
%token typeReel typeEntier variable
%token operateur_plus operateur_diviser operateur_moins operateur_modulo operateur_multiplier
%token operateur_et operateur_ou operateur_non
%token operateur_egal_egal operateur_inferieur_egal operateur_superieur_egal operateur_non_egal operateur_inferieur operateur_superieur


%token ENTIER
%nonassoc operateur_plus
%left operateur_mult
%nonassoc operateur_moins
%right operateur_diviser
%nonassoc operateur_modulo

%start DebutGlobal

%%

 /* On peut déclarer des variables globales, mais ensuite, il faut passer à l'execution du main. 
    La déclaration/définition de fonctions peut se faire avant ou après le main  */ 
DebutGlobal:		Fonctions Contenu 

//Fonction x(int a, int b) : entier
Fonctions : 	fonction variable parentheseOuverte ContenuParenthesesFonction parentheseFermee Retour ContenuFonction Fonctions | procedure variable parentheseOuverte ContenuParenthesesFonction parentheseFermee Contenu Fonctions | ; 

//Liste des arguments, ou rien
ContenuParenthesesFonction : Type Argument Arguments | ;

//La fonction a un retour, ou non. Si on ne séparait pas les procédures des fonctions : | ;
Retour : double_point Type ;

Type : typeReel | typeEntier

//... , int b
Arguments : virgule Type Argument Arguments  | ; 
Argument : variable

//On pourrait faire une simplification avec Declarations debut ListeInstructions
ContenuFonction : declaration Declarations debut ListeInstructions Retourner fin
Contenu : declaration Declarations debut ListeInstructions fin

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
| debut_tant_que Operation_logique faire Ensemble fin_tant_que
| faire Ensemble debut_tant_que Operation_logique fin_tant_que

POUR_PAS : debut_pour_pas Variable_ou_nombre | ; 
Variable_ou_nombre : variable | ENTIER
 
Complexe_Si : Ensemble Complexe_Sinon fin_si

Complexe_Sinon : sinon Ensemble | ;

//On n'a pas de booleen ou de caractere. On utilise donc un entier pour le switch (reel = pas supporté dans les langages de toute façon)
Complexe_Switch : ENTIER double_point Ensemble fin Complexe_Switch | defaut double_point Ensemble fin


Operation_logique : 

//On peut avoir un simple appel de fonction de type lire() ou mafonction(args) en AppelFonction. Calcul correspond à z = x + y ou z = x * lire() + y * mafonction() ou z = mafonction()
Instruction : Calcul | AppelFonctionSeule

AppelFonctionSeule : fonction_lire parentheseOuverte variable parentheseFermee | fonction_ecrire parentheseOuverte variable parentheseFermee | variable parentheseOuverte ListeArgumentsAppel parentheseFermee

//On a pas le type lors d'un appel, on a donc une légère redondance
ListeArgumentsAppel : ArgumentAppel ArgumentsAppel | ;
ArgumentsAppel : virgule ArgumentAppel | ;
ArgumentAppel : variable

Calcul : variable egal Operation

Operation : parentheseOuverte Expression parentheseFermee | Expression


Operation_logique: 
;/*
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
	  operateur_relationnel operateur_et operateur_relationnel{
		$$ = $1 && $3;
	}
	| operateur_relationnel operateur_ou operateur_relationnel{
		$$ = $1 || $3;
	}
	| operateur_non operateur_relationnel{
		$$ = !$2;
	};

operateur_relationnel: 
	  Expression operateur_egal_egal Expression {
		$$ = $1 == $3;
	}
	| Expression operateur_inferieur_egal Expression {
		$$ = $1 <= $3;
	}
	| Expression operateur_superieur_egal Expression {
		$$ = $1 >= $3;
	}
	| Expression operateur_inferieur Expression {
		$$ = $1 < $3;
	}
	| Expression operateur_superieur Expression {
		$$ = $1 > $3;
	}
	| Expression operateur_non_egal Expression {
		$$ = $1 != $3;
	};
*/
Expression: ENTIER
	| Operation
	| variable parentheseOuverte ListeArgumentsAppel parentheseFermee
      | Expression operateur_plus Expression {
		$$ = $1 + $3;
      }
      | Expression operateur_moins Expression {
		$$ = $1 - $3;
      }
      | Expression operateur_multiplier Expression {
      	$$ = $1 * $3;
      }
      | Expression operateur_diviser Expression {
      	if($3 != 0){
			$$ = $1 / $3;
		}else{
			$$ = $1;
			div_zero = TRUE;
		}
      }
      | Expression operateur_modulo Expression {
      		$$ = $1%$3;
      };

%%


int main(int argc, char** argv) {

	FILE * sortie;
	char * nomSortie;
	
	if (argv[1]  == NULL) {
		fprintf(stderr, "Erreur : Merci de préciser un fichier à analyser (avec l'extension).\nExemple : ./algorithmie exemple1.txt sortie.txt\nLe nom du fichier de sortie est optionnel (sortie.txt par défaut)\n");
		exit(EXIT_FAILURE);
	}
	if (argv[2] == NULL) {
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
       yyrestart(entree);
       yyparse();
	
	//fclose
	fclose(entree);
	fclose(sortie);
	
	
	return EXIT_SUCCESS;
}
