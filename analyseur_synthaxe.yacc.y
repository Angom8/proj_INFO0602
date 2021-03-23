%{
#include <stdio.h>
#include <stdlib.h>
%}

%token ENTIER

%%


%%

int main(void) {
  yyparse();
  return EXIT_SUCCESS;
}
