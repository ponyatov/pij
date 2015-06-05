#!/usr/bin/octave -qf
% 2D version of old Alex Pijakov calc
printf("\n");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

DatFile = 'Trajectory2D_pas/Fi.dat'	% data file

Qmmin=1; Qmmax=300;	Qm=10	% Q/m, K/kg
Amin=0.00; Amax=0.01; Alpha=0	% input angle, deg
Rmin=0e-3; Rmax=9e-3; R=0e-3	% input radius, mm
Zmax=2.54			% max Z coordinate, m
Uacc=8e3			% acceleration potential, kV
RZstep=1e-3		% Fi[] grid step, mm
V=1000			% starting linear speed, m/s
dT=1e-7			% calc time step, s
% 1e-6 = 0.2s ; 1e-7 = 2.1s ;  2e-7 = 0.9s

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% read Fi[] from Fi.dat file
Fi = Fi_dat(DatFile);

p=pj2(Fi,Qm,Alpha,R,Rmax,Zmax,Uacc,RZstep,V,dT);
printf("ExecTime = %.1f\n",p.ExecTime);

clf; MaxPlot=3;

subplot(MaxPlot,1,1); hold on; grid on;
xlabel("Z.mm"); ylabel("nanoPopugaev");
plot(p.PlotZ,p.PlotF,'b');
%X=1:p.m_cols;
%for i = 1:p.n_rows
%	plot(X,Fi(i,:),'b');
%end

subplot(MaxPlot,1,2); hold on; grid on;
xlabel("Z.mm"); ylabel("R,mm");
plot(p.PlotZ,p.PlotR,'r');

subplot(MaxPlot,1,3); hold on; grid on;
xlabel("Z.mm"); ylabel("V,m/s");
plot(p.PlotZ,p.PlotV,'g');

print -dpng -r300 test.png
