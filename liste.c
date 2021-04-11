#include "liste.h"

int initialiser_liste_char(liste_char * l){
	if(l != NULL){
		l->tete = NULL;
		
		return 1;
	}
	
	return 0;
}

int initialiser_liste_char_fichier(liste_char * l, char * nomFichier){
	FILE * fichier;
	char ch_tmp[30];
	cellule_char * c;
	
	if(l != NULL){
		l->tete = NULL;
		
		fichier = fopen(nomFichier, "r");
		
		while(fscanf(fichier, "%s", ch_tmp) != EOF){
			
			if(strlen(ch_tmp) > 0 && strlen(ch_tmp) <= 26){
				if(rechercher_mot(l, ch_tmp) == NULL){
				
					c = (cellule_char*)malloc(sizeof(cellule_char));
			
					initialiser_cellule_char(c, ch_tmp);
		
					inserer_cellule_char(l, c);
				}
			}
		}
		
		return 1;
	}
	
	return 0;
}

int detruire_liste_char(liste_char * l){

	if(l != NULL){
		while(l->tete != NULL){
			supprimer(l, l->tete);
		}
		
		return 1;
	}
	
	return 0;
}

int inserer_cellule_char(liste_char * l, cellule_char * c){
	if(l != NULL){
		c->succ = l->tete;
		if(l->tete != NULL){
			l->tete->pred = c;
		}
		l->tete = c;
		c->pred = NULL;
		
		return 1;
	}
	
	return 0;
}

int afficher_liste_char(liste_char * l){
	cellule_char * c;
	
	if(l != NULL){
		c = l->tete;
		
		printf("liste de mots : \n");
		while(c != NULL){
			printf(" %s", c->mot);
			c = c->succ;
		}
		printf("\n");
		
		return 1;
	}
	
	return 0;
}

cellule_char * rechercher_mot(liste_char * l, char * mot){
	cellule_char * c = l->tete;
	
	while(c != NULL && strcmp(c->mot, mot)){
		c = c->succ;
	}
	
	return c;
}

int supprimer(liste_char * l, cellule_char * c){
	if(l != NULL && c != NULL){
		if(c->pred != NULL){
			c->pred->succ = c->succ;
		}
		else{
			l->tete = c->succ;
		}
	
		if(c->succ != NULL){
			c->succ->pred = c->pred;
		}
		
		supprimer_cellule_char(c);
		
		return 1;
	}
	
	return 0;
}

int compter_liste_char(liste_char * l){
	int n = 0;
	cellule_char * c;
	
	if(l != NULL){
		c = l->tete;
		
		while(c != NULL){
			n++;
			c = c->succ;
		}
	}
	
	return n;
}
