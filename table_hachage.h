#ifndef TABLE_HACHAGE_H
#define TABLE_HACHAGE_H

#include <math.h>
#include "liste.c"

typedef struct table_hachage{
	int m;
	struct liste_char * tab;
}table_hachage;

int initialiser_table_hachage(table_hachage * t, int m);
int initialiser_table_hachage_fichier(table_hachage * t, int m, char * nomFichier);
int detruire_table_hachage(table_hachage * t);
int afficher_table_hachage(table_hachage * t);
unsigned long long convertir_ch_entier(char * mot);
int hachage(table_hachage * t, unsigned long long n);
int hachage_char(table_hachage * t, char * mot);
int inserer_hachage(table_hachage * t, cellule_char * c);
cellule_char * rechercher_hachage(table_hachage * t, char * mot);
int supprimer_hachage(table_hachage * t, cellule_char * c);
int compter_table_hachage(table_hachage * t);

#endif /* TABLE_HACHAGE_H */
