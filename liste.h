#ifndef LISTE_CHAR_H
#define LISTE_CHAR_H

#include "cellule.c"

typedef struct liste_char{
	struct cellule_char * tete;
}liste_char;

int initialiser_liste_char(liste_char * l);
int initialiser_liste_char_fichier(liste_char * l, char * nomFichier);
int detruire_liste_char(liste_char * l);
int inserer_cellule_char(liste_char * l, cellule_char * c);
int afficher_liste_char(liste_char * l);
cellule_char * rechercher_mot(liste_char * l, char * mot);
int supprimer(liste_char * l, cellule_char * c);
int compter_liste_char(liste_char * l);

#endif /* LISTE_CHAR_H */
