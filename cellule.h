#ifndef CELLULE_CHAR_H
#define CELLULE_CHAR_H

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

typedef struct cellule_char{
	char mot[27];
	int valeur;
	struct cellule_char * pred;
	struct cellule_char * succ;
}cellule_char;

int initialiser_cellule_char(cellule_char * c, char * mot, int valeur);
int supprimer_cellule_char(cellule_char * c);

#endif /* CELLULE_CHAR_H */
