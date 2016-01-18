#ifndef _H_PIJ2D
#define _H_PIJ2D
											// log file name
#define TE "te.log"

//#include <mpi.h>
											// std. includes
#include <iostream>
#include <fstream>
#include <iomanip>
#include <cmath>
#include <cfloat>
#include <cstdlib>
#include <cstdio>
#include <cassert>
using namespace std;

extern int doit();							// calculation procedure

extern int yylex();							// lexer for phield file load
#define Rmax 20+1
#define Xmax 90+1
extern double Fi[Rmax][Xmax];				// phield data

#endif // _H_PIJ2D
