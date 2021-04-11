#include "cellule.h"

int initialiser_cellule_char(cellule_char * c, char * mot, int valeur){
	
	if(c != NULL){
		strcpy(c->mot, mot);
		c->valeur = valeur;
		c->pred = NULL;
		c->succ = NULL;
	
		return EXIT_SUCCESS;
	}
	
	fprintf(stderr, "Erreur : la cellule est nulle\n");
	exit(EXIT_FAILURE);
}

int supprimer_cellule_char(cellule_char * c){
	if(c != NULL){
		
		free(c);
		c = NULL;
		
		return EXIT_SUCCESS;
	}
	
	fprintf(stderr, "Erreur : la cellule est nulle\n");
	exit(EXIT_FAILURE);
}
