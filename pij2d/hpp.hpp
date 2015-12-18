#ifndef _H_PIJ2D
#define _H_PIJ2D

#define TE "te.log"

#define Rmax 20+1
#define Xmax 90+1

//#include <mpi.h>

#include <iostream>
#include <fstream>
#include <iomanip>
#include <cmath>
#include <cfloat>
#include <cstdlib>
#include <cstdio>
#include <cassert>
using namespace std;

extern int doit();

extern int yylex();

extern double Fi[Rmax][Xmax];

#endif // _H_PIJ2D
