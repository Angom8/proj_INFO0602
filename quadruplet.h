#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct{
	char premier[256];
	int deuxieme;
	int troisieme;
	int quatrieme;
}quadruplet_t;

/**
* Crée un quadruplet
* @param les différents composants
*/

void createQuad(quadruplet_t quad, char * s, int a, int b, int c);

/**
* Crée un quadruplet sans valeurs
* @param les différents composants
*/

void createQuadDefault(quadruplet_t quad);

