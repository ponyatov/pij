
#MPICH2 = C:\MinGW\MPICH2

.PHONY: exec
exec: Fi.txt
Fi.txt: ./pij2d$(EXE)
	./pij2d$(EXE)

C = cpp.cpp
H = hpp.hpp
CXXFLAGS += -I. -std=gnu++11
#-I$(MPICH2)/include -L$(MPICH2)/lib
./pij2d$(EXE): $(C) $(H) Makefile
	$(CXX) $(CXXFLAGS) -o $@ $(C)
#	-lmpi

NOW = $(shell date +%Y%m%d%H%M)
.PHONY: rar
rar: $(NOW).rar
$(NOW).rar: test.files Fi.txt
	rar a -m5 -o- -r $@ @test.files
