%{
#include "y.tab.h" 
void yyerror(const char *erreurMsg);
%}

%%



%%

void yyerror(const char *erreurMsg) {
  fprintf(stderr, "\n Erreur '%s' sur '%s'.\n", erreurMsg, yytext);
  exit(EXIT_FAILURE);
}
