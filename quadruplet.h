

typedef struct{
	char premier[256];
	int deuxieme;
	int troisieme;
	int quatrieme;
}quad_t;

/**
* Crée un quadruplet
* @param les différents composants
*/

void createQuad(quad_t quad, char * s, int a, int b, int c);

/**
* Crée un quadruplet sans valeurs
* @param les différents composants
*/

void createQuadDefault(quadruplet quad*);

