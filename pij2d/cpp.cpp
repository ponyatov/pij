#include "hpp.hpp"

double V  ; // V:=1000;
double Qm ; // Qm:=StrToFloat(Form1.Edit1.Text);
double Alpha ; // Alpha:=0;
double r ; // r:=StrToFloat(Form1.Edit3.Text)/1000;

int doit() {

// append(te);
ofstream te(TE);

double Vz = V*cos(Alpha); // Vz:=V*Cos(Alpha);	
double Vr = V*sin(Alpha); // Vr:=V*Sin(Alpha);
/*

alpha:=StrToFloat(Form1.Edit2.Text);

*/
	
double dt = 1E-6; // dt:=1E-6;	
double t=0; // t:=0;
double z=0; // z:=0;
double R=0;
double Z0=0;

double Ez,Er;

int i,j,n,m,x,y;

do { // repeat

Z0=z; // Z0:=Z;

do {					// Repeat
	if (Z0*1000>90) 	// If Z0*1000>90 then
		Z0=Z0-0.090;	// Z0:=Z0-0.090;
} while (!(Z0<0.09));	// Until Z0<0.09;

y = trunc(Z0*1000);		// Y:=Trunc(Z0*1000);
x = 10-trunc(R*1000);	//  X:=10-Trunc(R*1000);//X:=11;
 //Ez:=0;

// Ez:=(Fi[x,y]-Fi[x,y+1])*8000/0.001;
Ez = (Fi[x][y]-Fi[x][y+1])*8000/0.001;
// Er:=-1*(Fi[x,y]-Fi[x+1,y])*8000/0.001;
Er = -1*(Fi[x][y]-Fi[x+1][y])*8000/0.001;

// Z:=Z+Vz*dt+Ez*qm*dt*dt/2;
z =z+Vz*dt+Ez*Qm*dt*dt/2;

// Vz:=Vz+Ez*qm*dt;
Vz =Vz+Ez*Qm*dt;

// R:=R+Vr*dt+Er*qm*dt*dt/2;
R =R+Vr*dt+Er*Qm*dt*dt/2;

// Vr:=Vr+Er*qm*dt;
Vr =Vr+Er*Qm*dt;

// t:=t+dt;
t =t+dt;

// write(te,z:8:6);
te << z;
// write(te,' ');
te << " ";
// writeln(te,r:8:6);
te << r;
// closefile(te);
te << "\n";

} while (!(							// until
			(z>2.54)||(R>=0.0099)	// (z>2.54)or(R>=0.0099);
			));  

return 0;
}

int main (int argc, char *argv[]) {
	// command line processing
	assert (argc==4+1);	// pij.exe [V] [Qm] [Alpha]
	V     = atof(argv[1]); assert(V    >0); cout << "V:\t\t\t" << V << "\n";
	Qm    = atof(argv[2]); assert(Qm   >0); cout << "Qm:\t\t\t" << Qm << "\n";
	Alpha = atof(argv[3]); assert(Alpha>0); cout << "Alpha:\t\t" << Alpha << "\n";
	r	  = atof(argv[4])/1000; assert(r    >0); cout << "r:\t\t\t" << r << "\n";
	// Fi.txt fielf data parsing
	while (yylex());	// Fi.txt parser loop from stdin
	// compute tracks
	return doit();
}

