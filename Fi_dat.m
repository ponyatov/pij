% read potential field from Piyakov's .dat file

function [rows,cols,dat] = Fi_dat(DatFile)
	
%% open file
fhDatFile = fopen(DatFile,'rb') ; assert(fhDatFile != 0);

%% read header: data sizes
[tmp,readed] = fread(fhDatFile,2,'float64') ; assert(readed==2);
a=tmp(1) ; rows=round(a)+1;
b=tmp(2) ; cols=round(b)+1;

dat=[];

% read Fi[]
for i = 1:n
	[Fi_line,readed]=fread(fhDatFile,m,'float64') ; assert(readed==m);
	Fi = [ Fi ; rot90(Fi_line) ];
end
%% close Fi.dat
fclose(fhDatFile);


end;	
