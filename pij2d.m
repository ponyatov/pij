#!/usr/bin/octave -qf
% 2D version of old Alex Pijakov calc

StartTime=time();

% starting conditions:

%% Q/m, 1..300 K/kg
Qm=10 % input("Qm")

%% input angle, 0.00..0.01 deg
Alpha=0 % input("alpha")
Amin=0.00
Amax=0.01

%% input radius, (0..9)e-3 m (0..9mm)
R=0e-3 % input("r,mm")/1000
Rmin=0e-3
Rmax=9e-3

%% Z coordinate, m
Z=0;
Zmax=2.54;

%% linear speed, m/s
V=1000
%%% speed vector parts
Vr=V*sin(Alpha)
Vz=V*cos(Alpha)

%% acceleration potential
Uacc=8000;

%% current time, s
T=0;
%%% calc time step, s
dT=5e-8;
%   4e-8 4.7s
%   5e-8 3.5s
% 10e-8 2.1s

% Fi[] step, m
RZstep=1e-3

% %%%%%%%%%%%%%%%



% arguments from cmdline
arg = argv();

% DatFile = arg{1}
% override for run pij2d.m from qtoctave manually
DatFile = 'Trajectory2D_pas/Fi.dat'

% reading Fi[] from Fi.dat file
[n_rows,m_cols,Fi]=Fi_dat(DatFile);
n_rows
m_cols

%% create 3.txt
%te=fopen("3.txt",'wb'); assert(te!=0); fclose(te);

% plot series
clf;

subplot(2,1,1); hold on; grid on;

% Fi[]
x = 1:m_cols;
%title(sprintf('Tube field distribution Fi[%ix%i]',n,m));
xlabel("Z,mm"); ylabel("nanopopugaev");
for i = 1:n_rows
	plot(x,Fi(i,:),'b');
end
%save Fi.mat Fi

% calc section

Pz=Pr=[];
do
	% Fi[] indexes
	Fr=1+10-int32(R*1000);
	Fz=1+mod( int32(Z*1000) , m-1);
	% electric field
	Er=-1*(Fi(Fr,Fz)-Fi(Fr+1,Fz))*Uacc/RZstep;
	Ez=(Fi(Fr,Fz)-Fi(Fr,Fz+1))*Uacc/RZstep;
	% coords
	R+=Vr*dT+Er*Qm*dT^2/2;
	Z+=Vz*dT+Ez*Qm*dT^2/2;
	% velocity
	Vr+=Er*Qm*dT;
	Vz+=Ez*Qm*dT;
	% next time tick
	T+=dT;
	% plot Z/r
	Pz = [Pz Z*1000];
	Pr = [Pr R*1000];
until R>=Rmax | Z>Zmax

subplot(2,1,2); hold on; grid on;
xlabel("Z,mm"); ylabel("R,mm");
plot(Pz,Pr,'r');
%print -dpng -r300 Fi.png

%T=[Pz Pr] ; save PzPr.mat T;

EndTime=time();
ExecTime=EndTime-StartTime;
printf("ExecTime=%.1f sec\n",ExecTime);
