#!/usr/bin/octave -qf
% 2D version of old Alex Pijakov calc
printf("\n");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

DatFile = 'Trajectory2D_pas/Fi.dat'	% data file

Qmin=1; Qmax=300; Qm=10	% Q/m, K/kg
Amin=0.00; Amax=0.01; Alpha=0	% input angle, deg
Rmin=0e-3; Rmax=9e-3; R=0e-3	% input radius, mm
Zmax=2.54			% max Z coordinate, m
Uacc=8e3			% acceleration potential, kV
RZstep=1e-3		% Fi[] grid step, mm
V=1000			% starting linear speed, m/s
dT=1e-6			% calc time step, s
% 1e-6 = 0.2s ; 1e-7 = 2.1s ;  2e-7 = 0.9s

epsilon_dR=1e-1		% filtering epsilon

% steps for variations
Atimes=Rtimes=Qtimes=3;
Astep=abs(Amin-Amax)/Atimes
Rstep=abs(Rmin-Rmax)/Rtimes
Qstep=abs(Qmin-Qmax)/Qtimes/1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clf; MaxPlot=3;

% read Fi[] from Fi.dat file
Fi = Fi_dat(DatFile);

% F[] multiplied plot

%p=pj2(Fi,10,Amin,Rmin,Rmax,Zmax,Uacc,RZstep,V,dT);
%subplot(MaxPlot,1,1); hold on; grid on;
%xlabel("Z.mm"); ylabel("nanoPopugaev");
%plot(p.PlotZ,p.PlotF,'b');

% R(A,Z) mupltiplot

title(sprintf(
	"A=%.3f:%.3f:%.3f R=%.1f:%.1f:%.1f Q=%.1f:%.1f:%.1f e=%.1e",
	Amin,Astep,Amax,
	Rmin*1e3,Rstep*1e3,Rmax*1e3,
	Qmin,Qstep,Qmax,
	epsilon_dR
	));
%subplot(MaxPlot,1,2); 
hold on; grid on;
xlabel("Z.mm"); ylabel("R,mm");
%subplot(MaxPlot,1,3); hold on; grid on;
%xlabel("Z.mm"); ylabel("V,m/s");

for Q = Qmin:Qstep:Qmax
for R = Rmin:Rstep:Rmax
for A = Amin:Astep:Amax
	p=pj2(Fi,Q,A,R,Rmax,Zmax,Uacc,RZstep,V,dT,epsilon_dR);
	printf("A=%f R=%f Q=%f ExecTime = %.1f\n",A,R,Q,p.ExecTime);
%	subplot(MaxPlot,1,2); 
	hold on; grid on; plot(p.PlotZ,p.PlotR,'r');
%	subplot(MaxPlot,1,3); hold on; grid on; plot(p.PlotZ,p.PlotV,'g');
end end end

% dump page to .png

print -dpng -r300 pij2d.png
