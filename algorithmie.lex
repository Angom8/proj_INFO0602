%{
#include "y.tab.h" 
void yyerror(const char *erreurMsg);
%}

ESPACE  [\t ]+
NOMBRE [0-9]+

/* Gestion des commentaires */
%option yylineno
%x BLOCK_COMMENT
%x LINE_COMMENT
%%
"/*" 			{BEGIN BLOCK_COMMENT;}
<BLOCK_COMMENT>"*/" 	{BEGIN INITIAL;}
<BLOCK_COMMENT>.	{}                // consume all characters 
<BLOCK_COMMENT>\n     	{}                // consume all lines
"//"         			{BEGIN LINE_COMMENT;}
<LINE_COMMENT>\n 		{BEGIN INITIAL;}
<LINE_COMMENT>.         {}                // consume all characters


/* Nombres */


[0-9]+				{
					yylval = atoi(yytext);
					return ENTIER;
				}
^-[0-9]+			{
					yylval = atoi(yytext);
					return ENTIER;
				}

/* Opérations

[-+\/\*\n]			{ return *yytext; }


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

\n 	    ;

/* Conditionnelles * /

[SI|si] {return debut_si ;}
[ALORS|alors] {return debut_alors ;}
{SINON|Sinon} {return sinon;}
[FinSi|FINSI|FinSI|finsi] {return fin_si ;}

[CAS|cas] {return debut_switch ;}
[parmi|PARMI] {return debut_parmi};
[FinCas|FINCAS|FinCAS|fincas] {return fin_switch ;}

==|<=|>=|<|>|!=		{ return *yytext; }
ET|OU|NON			{ return *yytext; }

/* Boucles */

[POUR|pour|Pour]	 {return debut_pour; }

[allant de|ALLANT DE]   {return debut_pour_allant_de;}
[par pas de|PAR PAS DE] {return debut_pour_pas;}
{faire|FAIRE]			{return faire;}
[finpour|FINPOUR|FinPour]	{return fin_pour;}
[TantQue|tantque|TANTQUE]	{return debut_tant_que;}
[fintantque|FINTANTQUE|FinTantQue] {return fin_tant_que;}

/* Types *}

[réél|reel|Reel|Réel] {return typeReel;}
[entier|Entier] {return typeEntier;}
{[a-zA-Z][a-zA-Z0-9_]*} [return variable ;}


{ESPACE}			; 

.				yyerror("Caractère non valide");

%%

void yyerror(const char *erreurMsg) {
	fprintf(stderr, "\n Erreur '%s' sur '%s'.\n", erreurMsg, yytext);
	exit(EXIT_FAILURE);
}
