%{
#include "y.tab.h" 
void yyerror(const char *erreurMsg);
%}

%%

[0-9]+			{
					yylval = atoi(yytext);
					return ENTIER;
				}
^-[0-9]+			{
					yylval = atoi(yytext);
					return ENTIER;
				}
[-+\/\*\n]			{ return *yytext; }
==|<=|>=|<|>|!=		{ return *yytext; }
ET|OU|NON			{ return *yytext; }
[ \t]				; 
.				yyerror("Caractère non valide");

%%

void yyerror(const char *erreurMsg) {
	fprintf(stderr, "\n Erreur '%s' sur '%s'.\n", erreurMsg, yytext);
	exit(EXIT_FAILURE);
}
