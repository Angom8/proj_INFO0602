#include "quadtruplet.h"

/**
* Crée un quadruplet
* @param les différents composants
*/

void createQuad(quadruplet quad, char * s, int a, int b, int c){

	strcpy(quad.premier, s);
	quad.deuxieme = a;
	quad.troisieme = b;
	quad.quatrieme = c;

}

/**
* Crée un quadruplet sans valeurs
* @param les différents composants
*/

void createQuadDefault(quadruplet quad*){

	quad.premier = "";
	quad.deuxieme = -1;
	quad.troisieme = -1;
	quad.quatrieme = -1;

}


