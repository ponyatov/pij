CFLAGS =

.PHONY: pij
pij: pij2d.m Trajectory2D_pas/Fi.dat
	./$< Trajectory2D_pas/Fi.dat

.PHONY: oct
oct: cpp_Fi_dat.m
	octave $< 

cpp_Fi_dat.m: Trajectory2D_pas/Fi.dat Fidat2txt
	./Fidat2txt $< > $@

Fidat2txt: Fidat2txt.cpp
	$(CXX) $(CFLAGS) -o $@ $<
