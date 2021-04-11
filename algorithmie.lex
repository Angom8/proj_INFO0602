%{
#include "y.tab.h" 
void yyerror(const char *erreurMsg);
%}

ESPACE  [\t ]+
NOMBRE [0-9]+

/* Nombres */


NOMBRE 			{
					yylval = atoi(yytext);
					return ENTIER;
				}
^-NOMBRE			{
					yylval = atoi(yytext);
					return ENTIER;
				}
				
NOMBRE.NOMBRE			{
					yylval = atoi(yytext);
					return REEL;
				}
^-NOMBRE.NOMBRE		{
					yylval = atoi(yytext);
					return REEL;
				}
			

/* Langage courant */

Fonction      { return fonction  ; }
Procedure 	{return procedure;}
[Déclaration|Declaration|Déclarations|Declarations]     { return declaration  ; }
[Début|Debut]      { return debut  ; }
Fin    { return fin ; }
Algorithme { return algorithme ; }
[retourner|RETOURNER] {return retourne; }

/* Symboles */

\(         { return parentheseOuverte ; } 
\)         { return parentheseFermee; } 
,	   { return virgule; }
:	   { return double_point ;}
=	   { return egal ;}

\n 	    ;


/* Operateurs */

+		{return operateur_plus;}
/		{return operateur_diviser;}
-		{return operateur_moins;}
%		{return operateur_modulo;}
*		{return operateur_multiplier;}

ET		{return operateur_et;}
OU		{return operateur_ou;}
NON		{return operateur_non;}

==		{return operateur_egal_egal;}
<=		{return operateur_inferieur_egal;}
>=		{return operateur_superieur_egal;}
!=		{return operateur_non_egal;}
<		{return operateur_inferieur;}
>		{return operateur_superieur;}

/* Conditionnelles */

[SI|si] {return debut_si ;}
[ALORS|alors] {return debut_alors ;}
{SINON|Sinon} {return sinon;}
[FinSi|FINSI|FinSI|finsi] {return fin_si ;}

[CAS|cas] {return debut_switch ;}
[parmi|PARMI] {return debut_parmi};
[FinCas|FINCAS|FinCAS|fincas] {return fin_switch ;}

/* Boucles */

[POUR|pour|Pour]	 {return debut_pour; }

[allant de|ALLANT DE]   {return debut_pour_allant_de;}
[à|A|a]		 {return debut_pour_a;}		
[par pas de|PAR PAS DE] {return debut_pour_pas;}
{faire|FAIRE]			{return faire;}
[finpour|FINPOUR|FinPour]	{return fin_pour;}
[TantQue|tantque|TANTQUE]	{return debut_tant_que;}
[fintantque|FINTANTQUE|FinTantQue] {return fin_tant_que;}
[defaut|DEFAUT] {return defaut;}

/* Types */

[réél|reel|Reel|Réel] {return typeReel;}
[entier|Entier] {return typeEntier;}
{[a-zA-Z][a-zA-Z0-9_]*} [return variable ;}

/* I/O */
[lire]		{return lire;}
[ecrire] {return ecrire;}

{ESPACE}			; 

.				yyerror("Caractère non valide");

%%

void yyerror(const char *erreurMsg) {
	fprintf(stderr, "\n Erreur '%s' sur '%s'.\n", erreurMsg, yytext);
	exit(EXIT_FAILURE);
}
