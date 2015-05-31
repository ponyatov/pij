#include <iostream>

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <math.h>

using namespace std;

int main(int argc, char *argv[]) {

	cerr << "File:" << argv[1] << endl;

	cout << "% Fi[] field data converted from " << argv[1] << "\n\n";
//	cout << "format long\n\n";

	FILE *img = fopen(argv[1], "rb");
	assert(img != NULL);

	double a;
	assert(fread(&a, 1, sizeof(a), img) == sizeof(a));
	printf("a=%f ; n=round(a) ;\n",a);
	int n=round(a);

	double b;
	assert(fread(&b, 1, sizeof(b), img) == sizeof(b));
	printf("b=%f ; m=round(b) ;\n",b);
	int m=round(b);

	cout << "\nFi=[\n";

	double f;
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			assert(fread(&f, 1, sizeof(f), img) == sizeof(f));
			printf("\t%+.7e", f);
		}
		printf(";\n");
	}

	cout << "];\n\nsave Fi.mat Fi";

	fclose(img);

	return 0;
}
