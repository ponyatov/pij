#include "hpp.hpp"

FILE *f;				// f : file of Real;

float Fi[21+1][90+1];	// Fi : Array [0..21,0..90] of real;

int main(int argc, char *argv[]) {
	// read Fi as billshit Delphi binary data (i386/x32)
	assert ( f = fopen("Fi.dat","rb") );
	assert ( fread(Fi,1,sizeof(Fi),f) == sizeof(Fi));
	fclose(f);

	// normal exit	
	return 0;
}
