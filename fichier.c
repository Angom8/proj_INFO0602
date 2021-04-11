#include <stdio.h>
#include <stdlib.h>
#include "fichier.h"

/**
 * Ouvrir un fichier 
 * @param fichier Le nom du fichier
 * @return Le fichier si réussite
 */
FILE* readFichier(char * fichier){

	FILE * source;
	
	if(fichier != NULL){
		if((source = fopen(fichier, "r+")) == NULL){
		
			perror("Erreur lors de l'ouverture du fichier "); 
			exit(EXIT_FAILURE);
			
		}
		
		return source;
	}
	
	fprintf(stderr, "Erreur : Le fichier n'existe pas\n");
	exit(EXIT_FAILURE);
}

/**
 * Ouvrir un fichier en le créant
 * @param fichier Le nom du fichier
 * @return Le fichier si réussite
 */
FILE* createFichier(char * fichier){

	FILE * source;
	
	if(fichier != NULL){
		if((source = fopen(fichier, "w")) == NULL){
		
			perror("Erreur lors de l'ouverture du fichier "); 
			exit(EXIT_FAILURE);
			
		}
		
		return source;
	}
	
	fprintf(stderr, "Erreur : Le fichier n'existe pas\n");
	exit(EXIT_FAILURE);
}

/**
 * Retourner la taille d'un fichier
 * @param fichier Le fichier
 * @return La taille du fichier si réussite
 */
off_t getSizeFichier(FILE* fichier){

	off_t size;
	
	if(fichier != NULL){
		
		if(fseek(fichier, 0, SEEK_SET) == -1){
			perror("Erreur de parcours");
			exit(EXIT_FAILURE);
		}
		
		if((size = fseek(fichier, 0, SEEK_END)) == -1){
			perror("Erreur de parcours");
			exit(EXIT_FAILURE);
		}
		
		if(fseek(fichier, 0, SEEK_SET) == -1){
			perror("Erreur de parcours");
			exit(EXIT_FAILURE);
		}
		
		return size;
	}
	
	fprintf(stderr, "Erreur : Le fichier est nul\n");
	exit(EXIT_FAILURE);
	
}

/**
 * Retourner la ligne du fichier
 * @param fichier Le fichier et la chaine à remplir
 */
int lectureLigne(FILE* fichier, char * s){
	if(fichier != NULL){
		if(fscanf(fichier, "%s",s) == -1){
			perror("Erreur lecture du fichier");
			exit(EXIT_FAILURE);
		}
		
		return EXIT_SUCCESS;
	}
	
	fprintf(stderr, "Erreur : Le fichier est nul\n");
	exit(EXIT_FAILURE);
}

/**
 * Ecrit dans le fichier
 * @param fichier Le fichier et la chaine à remplir
 */
int ecritureFichier(FILE* fichier, char * s){
	if(fichier != NULL){
		if(fprintf(fichier, "%s\n", s) == -1){
			perror("Erreur lecture du fichier");
			exit(EXIT_FAILURE);
		}
		
		return EXIT_SUCCESS;
	}
	
	fprintf(stderr, "Erreur : Le fichier est nul\n");
	exit(EXIT_FAILURE);
}


/**
* Déroule le quadruplet sous forme ;;;; dans le fichier
* @param les différents composants
*/

int derouleQuad(FILE* fichier, quadruplet_t quad){
	if(fichier != NULL){
		if(fprintf(fichier, "%s;", quad.premier) == -1){
			perror("Erreur lecture du fichier");
			exit(EXIT_FAILURE);
		}
		if(quad.deuxieme == -1){
			if(fprintf(fichier, ";") == -1){
				perror("Erreur lecture du fichier");
				exit(EXIT_FAILURE);
			}
		}
		else{
			if(fprintf(fichier, "%d;", quad.deuxieme) == -1){
				perror("Erreur lecture du fichier");
				exit(EXIT_FAILURE);
			}
		}
		if(quad.troisieme == -1){
			if(fprintf(fichier, ";") == -1){
				perror("Erreur lecture du fichier");
				exit(EXIT_FAILURE);
			}
		}
		else{
			if(fprintf(fichier, "%d;", quad.troisieme) == -1){
				perror("Erreur lecture du fichier");
				exit(EXIT_FAILURE);
			}
		}
	
		if(quad.quatrieme== -1){
		}
		else{
			if(fprintf(fichier, "%d", quad.quatrieme) == -1){
				perror("Erreur lecture du fichier");
				exit(EXIT_FAILURE);
			}
		}
		if(fprintf(fichier, "\n") == -1){
			perror("Erreur lecture du fichier");
			exit(EXIT_FAILURE);
		}
		
		return EXIT_SUCCESS;
	}
	
	fprintf(stderr, "Erreur : Le fichier est nul\n");
	exit(EXIT_FAILURE);
}

/**
 * Retourner la ligne du fichier
 * @param fichier Le fichier et la chaine à remplir
 */
int compterLignes(FILE* fichier){

	int compteur = 0;
	char *s;
	
	if(fichier != NULL){
	
		long current = ftell(fichier);
		
		if(fseek(fichier, 0, SEEK_SET) == -1){
			perror("Erreur de parcours");
			exit(EXIT_FAILURE);
		}
		
		while(fscanf(fichier, "%s\n",s) != 0){
			compteur++;
		}
	
		if(fseek(fichier,current, SEEK_SET) == -1){
			perror("Erreur lecture du fichier");
			exit(EXIT_FAILURE);
		}
		
		return compteur;
	}
	
	fprintf(stderr, "Erreur : Le fichier est nul\n");
	exit(EXIT_FAILURE);
}

/**
 * Ferme le fichier ouvert
 * @param fichier Le fichier
 * @return OK si réussite
 */
int closeFichier(FILE* fichier){
	if(fichier != NULL){
		if(fclose(fichier) == -1){
			perror("Erreur fermeture du fichier");
			exit(EXIT_FAILURE);
		}
		
		return EXIT_SUCCESS;
	}
	
	fprintf(stderr, "Erreur : Le fichier est nul\n");
	exit(EXIT_FAILURE);
}

