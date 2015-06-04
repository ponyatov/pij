% read potential field from Piyakov's .dat file

function [n_rows,m_cols,Fi] = Fi_dat(DatFile)
	
%% open file
fhDatFile = fopen(DatFile,'rb') ; assert(fhDatFile != 0);

%% read header: data sizes
[tmp,readed] = fread(fhDatFile,2,'float64') ; assert(readed==2);
a=tmp(1) ; n_rows=round(a)+1;
b=tmp(2) ; m_cols=round(b)+1;

% read Fi[]
Fi=[];
for i = 1:n_rows
	[Fi_line,readed]=fread(fhDatFile,m_cols,'float64') ; assert(readed==m_cols);
	Fi = [ Fi ; rot90(Fi_line) ];
end
%% close Fi.dat
fclose(fhDatFile);

end;	
