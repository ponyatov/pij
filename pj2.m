% 2D Piyakov's function

function p = pj2(Fi,Qm,Alpha,R,Rmax,Zmax,Uacc,RZstep,V,dT)
% numerical calc noise filler config
epsilon_dR=5.6e-6;
	p.epsilon=epsilon_dR;

	% main parameters
	p.Qm=Qm;
	p.Alpha=Alpha; p.R=R; p.Rmax=Rmax; p.RZstep=RZstep;
	Z=0; p.Zmax=Zmax;
	p.Uacc=Uacc;
	%% speed vector parts
	p.V=V; Vr=V*sin(Alpha); Vz=V*cos(Alpha);
	% current time, s
	T=0; p.dT=dT;
	% dat file
	[p.n_rows,p.m_cols]=size(Fi);

% calc section

p.PlotT=p.PlotV=p.PlotZ=p.PlotR=p.PlotF=[];
StartTime=time();
do
	% Fi[] indexes
	Fr=1+10-int32(abs(R)*1000);
	Fz=1+mod( int32(abs(Z)*1000) , p.m_cols-1);
	% electric field
	dFr=( Fi(Fr,Fz) - Fi(Fr+1,Fz) ); 
	Er=-1*dFr*Uacc/RZstep;
	dFz=( Fi(Fr,Fz) - Fi(Fr,Fz+1) );
	Ez=dFz*Uacc/RZstep;
	% coords
	dR=Vr*dT+Er*Qm*dT^2/2; if abs(dR)<epsilon_dR dR=0; end
	R+=dR;
	dZ=Vz*dT+Ez*Qm*dT^2/2;
	Z+=dZ;
	% velocity
	Vr+=Er*Qm*dT;
	Vz+=Ez*Qm*dT;
	% next time tick
	T+=dT;
	% add to plot data r(z)
	p.PlotZ = [p.PlotZ Z*1000];
	p.PlotR = [p.PlotR R*1000];
	p.PlotV = [p.PlotV dZ/dT];
	p.PlotT = [p.PlotT T];
	p.PlotF = [p.PlotF Fi(Fr,Fz)];
until R>=Rmax | Z>Zmax
EndTime=time();
p.ExecTime=EndTime-StartTime;

end;
