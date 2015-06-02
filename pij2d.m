#!/usr/bin/octave -qf
% 2D version of old Alex Pijakov calc

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

%% current time, s
T=0;
%%% calc time step, s
dT=1e-3;%1e-6;

% %%%%%%%%%%%%%%%



% arguments from cmdline
arg = argv()

% DatFile = arg{1}
% override for run pij2d.m from qtoctave manually
DatFile = 'Trajectory2D_pas/Fi.dat'

% reading Fi[] from Fi.dat file
%% open file
fhDatFile = fopen(DatFile,'rb') ; assert(fhDatFile != 0);
%% read header: data sizes
[tmp,readed] = fread(fhDatFile,2,'float64') ; assert(readed==2);
a=tmp(1) ; n=round(a)+1
b=tmp(2) ; m=round(b)+1
% read Fi[]
Fi=[];
for i = 1:n
	[Fi_line,readed]=fread(fhDatFile,m,'float64') ; assert(readed==m);
	Fi = [ Fi ; rot90(Fi_line) ];
end
%% close Fi.dat
fclose(fhDatFile);

% create 3.txt
te=fopen("3.txt",'wb'); assert(te!=0); fclose(te);

% plot series
clf;
subplot(2,1,1); hold on; grid on;

%% Fi[]
x = 1:length(Fi(1,:));
title(sprintf('Tube field distribution Fi[%ix%i]',n,m));
xlabel("Z, mm"); ylabel("kilo popugaev");
for i = 1:size(Fi)(1)
	plot(x,Fi(i,:),'b');
end

% calc section

do
	% Fi[] indexes
	X=1+10-int32(R*1000) % Fr
	Y=1+mod( int32(Z0*1000) , m) % Fz
	% electric field
	Er=-1*(Fi(X,Y)-Fi(X+1,Y))*8000/0.001
	Ez=(Fi(X,Y)-Fi(X,Y+1))*8000/0.001
	% coords
	R+=Vr*dT+Er*Qm*dT*dT/2;
	Z+=Vz*dT+Ez*Qm*dT*dT/2
	% velocity
	Vr+=Er*Qm*dT
	Vz+=Ez*Qm*dT	
	% next time tick
	T+=dT;
	NN+=1
until R>=Rmax | Z>Zmax

%print -dpng Fi.png
