#include "table_hachage.h"

int initialiser_table_hachage(table_hachage * t, int m){
	int i;
	
	if(t != NULL){
		t->m = m;
		t->tab = (liste_char*)malloc(sizeof(liste_char)*(m+1));
		
		for(i=0 ; i<m+1 ; i++){
			initialiser_liste_char(t->tab+i);
		}
		
		return 1;
	}
	
	return 0;
}

int initialiser_table_hachage_fichier(table_hachage * t, int m, char * nomFichier){
	int i;
	FILE * fichier;
	char ch_tmp[30];
	cellule_char * c;
	
	if(t != NULL && nomFichier != NULL){
		t->m = m;
		t->tab = (liste_char*)malloc(sizeof(liste_char)*(m+1));
		
		for(i=0 ; i<m+1 ; i++){
			initialiser_liste_char(t->tab+i);
		}
		
		fichier = fopen(nomFichier, "r");
		
		while(fscanf(fichier, "%s", ch_tmp) != EOF){
			
			if(strlen(ch_tmp) > 0 && strlen(ch_tmp) <= 26){
				if(rechercher_hachage(t, ch_tmp) == NULL){
				
					c = (cellule_char*)malloc(sizeof(cellule_char));
			
					initialiser_cellule_char(c, ch_tmp);
		
					inserer_hachage(t, c);
				}
			}
		}
		
		return 1;
	}
	
	return 0;
}

int detruire_table_hachage(table_hachage * t){
	int i;
	
	if(t != NULL){
		if(t->tab != NULL){
			for(i=0 ; i<t->m+1 ; i++){
				detruire_liste_char(t->tab+i);
			}
			free(t->tab);
			t->tab = NULL;
		}
		
		free(t);
		t = NULL;
		
		return 1;
	}
	
	return 0;
}

int afficher_table_hachage(table_hachage * t){
	int i;
	
	if(t != NULL && t->tab != NULL){
		for(i=0 ; i<t->m+1 ; i++){
			printf("tab[%d] : \n", i);
			afficher_liste_char(t->tab+i);
		}
		
		return 1;
	}
	
	return 0;
}

unsigned long long convertir_ch_entier(char * mot){
	int i, j;
	unsigned long long n = 0;
	
	for(j=0 ; mot[j] != '\0' ; j++){	
	}
	j--;
	 
	for(i=0 ; mot[i] != '\0' ; i++){
		n += mot[i]*pow(128, j--);	
	}
	
	return n;
}

int hachage(table_hachage * t, unsigned long long n){
	if(t != NULL){
		return n%t->m;
	}
	
	return -1;
}

int hachage_char(table_hachage * t, char * mot){
	if(t != NULL){
		return hachage(t, convertir_ch_entier(mot));
	}
	
	return -1;
}

int inserer_hachage(table_hachage * t, cellule_char * c){
	if(t != NULL && t->tab != NULL && c != NULL && c->mot != NULL){
		
		inserer_cellule_char(t->tab+hachage(t, convertir_ch_entier(c->mot)), c);
		
		return 1;
	}
	
	return 0;
}

cellule_char * rechercher_hachage(table_hachage * t, char * mot){
	if(t != NULL && t->tab != NULL && mot != NULL){
		
		return rechercher_mot(t->tab+hachage(t, convertir_ch_entier(mot)), mot);
		
	}
	
	return NULL;
}

int supprimer_hachage(table_hachage * t, cellule_char * c){
	if(t != NULL && t->tab != NULL && c != NULL && c->mot != NULL){
		supprimer(t->tab+hachage(t, convertir_ch_entier(c->mot)), c);
		
		return 1;
	}
	
	return 0;
}

int compter_table_hachage(table_hachage * t){
	int i, n = 0;
	if(t != NULL && t->tab != NULL){
		for(i=0 ; i<t->m+1 ; i++){
			n += compter_liste_char(t->tab+i);
		}
	}
	
	return n;
}


