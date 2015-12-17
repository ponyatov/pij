#include "hpp.hpp"

FILE *f;				// f : file of Real;

#define Fi_X 21
#define Fi_Y 90
float Fi[Fi_X+1][Fi_Y+1];	// Fi : Array [0..21,0..90] of real;

// MPI using http://mpitutorial.com/tutorials/mpi-hello-world/

int main(int argc, char *argv[]) {
//	// start MPI
//	assert ( MPI_Init(&argc,&argv) == MPI_SUCCESS );
	// read Fi as billshit Delphi binary data (i386/x32)
	assert ( f = fopen("Fi.dat","rb") );
	assert ( fread(Fi,1,sizeof(Fi),f) == sizeof(Fi));
	fclose(f);
	// dump Fi as .txt
	ofstream FiTXT("Fi.txt");
	FiTXT << setprecision(LDBL_DIG);
	FiTXT << "x\ty\tFi\n\n";
	for (auto fx=0; fx <= Fi_X; fx++)
		for (auto fy=0; fy<= Fi_Y; fy++)
			FiTXT << fx << "\t" << fy << "\t" << Fi[fx][fy] << "\n";
	// normal exit with MPI stop
//	return MPI_Finalize();
	return 0;
}
