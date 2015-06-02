#!/usr/bin/octave -qf
% 2D version of old Alex Pijakov calc

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
a=tmp(1) ; n=round(a)
b=tmp(2) ; m=round(b)
% read Fi[]
[Fi,readed] = fread(fhDatFile,n*m,'float64') ; assert(readed==n*m); readed
%% close Fi.dat
fclose(fhDatFile);


