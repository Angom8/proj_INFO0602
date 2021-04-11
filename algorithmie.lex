%{
#include "y.tab.h" 
#include <stdio.h>
#include <math.h>
void yyerror(const char *erreurMsg);
%}

%option yylineno
%x BLOCK_COMMENT
%x LINE_COMMENT
%%
"/*" 			{BEGIN BLOCK_COMMENT;};
<BLOCK_COMMENT>"*/" 	{BEGIN INITIAL;};
<BLOCK_COMMENT>.	{};                // consume all characters 
<BLOCK_COMMENT>\n     	{};                // consume all lines
"//"         			{BEGIN LINE_COMMENT;};
<LINE_COMMENT>\n 		{BEGIN INITIAL;};
<LINE_COMMENT>.         {} ;               // consume all characters




[\t ]+ ;
[0-9]+				{
					yylval = atoi(yytext);
					return ENTIER;
				};
				
^-[0-9]+			{
					yylval = atoi(yytext);
					return ENTIER;
				};
	
Fonction      { return fonction  ; };
Procedure 	{return procedure;};
Déclaration|Declaration|Déclarations|Declarations     { return declaration; };
Début|Debut   { return debut; }
Fin|fin|FIN   { return fin; }
Algorithme { return algorithme; };
retourner | RETOURNER {return retourne; };

\(     { return parentheseOuverte; } ;
\)         { return parentheseFermee; } ;
\,	   { return virgule; };
\:	   { return double_point ;};
\=	   { return egal ;};

\+		{return operateur_plus;}
\/		{return operateur_diviser;}
\-		{return operateur_moins;}
\%		{return operateur_modulo;}
\*		{return operateur_multiplier;}

ET		{return operateur_et;}
OU		{return operateur_ou;}
NON		{return operateur_non;}

\=\=		{return operateur_egal_egal;}
\<\=		{return operateur_inferieur_egal;}
\>\=		{return operateur_superieur_egal;}
\!\=		{return operateur_non_egal;}
\<		{return operateur_inferieur;}
\>		{return operateur_superieur;}

SI|si {return debut_si ;};
ALORS|alors {return debut_alors ;};
SINON|Sinon {return sinon;};
FinSi|FINSI|FinSI|finsi {return fin_si ;};

CAS|cas {return debut_switch ;}
parmi|PARMI {return debut_parmi;};
FinCas|FINCAS|FinCAS|fincas {return fin_switch ;};


POUR|pour|Pour	 {return debut_pour; };

"allant de"|"ALLANT DE"   {return debut_pour_allant_de;};
à		 {return debut_pour_a;};		
"par pas de"|"PAR PAS DE" {return debut_pour_pas;};
faire|FAIRE			{return faire;};
finpour|FINPOUR|FinPour	{return fin_pour;};
TantQue|tantque|TANTQUE	{return debut_tant_que;};
fintantque|FINTANTQUE|FinTantQue {return fin_tant_que;};
defaut|DEFAUT {return defaut;};

réél|reel|Reel|Réel {return typeReel;};
entier|Entier {return typeEntier;};


lire		{return fonction_lire;};
ecrire {return fonction_ecrire;};


[a-zA-Z][a-zA-Z0-9_]* {return variable ;};

<<EOF>> { printf("Fin du fichier\n");
		yyterminate();};
\n 	 {}   ;


.				yyerror("Caractère non valide");

%%

void yyerror(const char *erreurMsg) {
	fprintf(stderr, "\n Erreur '%s' sur '%s'.\n", erreurMsg, yytext);
	exit(EXIT_FAILURE);
}
