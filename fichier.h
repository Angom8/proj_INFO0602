#include "quadruplet.h"

/**
 * Ouvrir un fichier 
 * @param nom_fichier Le nom du fichier
 * @return Le fichier si réussite
 */
FILE* readFichier(char * nom_fichier);

/**
 * Ouvrir un fichier en le créant
 * @param nom_fichier Le nom du fichier
 * @return Le fichier si réussite
 */
FILE* createFichier(char * nom_fichier);

/**
 * Retourner la taille d'un fichier
 * @param fichier Le fichier
 * @return La taille du fichier si réussite
 */
off_t getSizeFichier(FILE* fichier);


/**
 * Retourner la ligne du fichier
 * @param fichier Le fichier et la chaine à remplir
 */
void lectureLigne(FILE* fichier, char *s);

/**
 * Fermer le fichier ouvert
 * @param fichier Le fichier
 * @return /
 */
int closeFichier(FILE* fichier);

/**
 * Ecrit dans le fichier
 * @param fichier Le fichier et la chaine à remplir
 */
void ecritureFichier(FILE* fichier, char * s);

/**
 * Retourner la ligne du fichier
 * @param fichier Le fichier et la chaine à remplir
 */
int compterLignes(FILE* fichier);
