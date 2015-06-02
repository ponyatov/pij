CFLAGS =

.PHONY: pij
pij: pij2d.m Trajectory2D_pas/Fi.dat
	./$< Trajectory2D_pas/Fi.dat

.PHONY: oct
oct: Fi_dat.m
	octave $< 

Fi_dat.m: Trajectory2D_pas/Fi.dat Fidat2txt
	./Fidat2txt $< > $@

Fidat2txt: Fidat2txt.cpp
	$(CXX) $(CFLAGS) -o $@ $<
