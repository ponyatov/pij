
#MPICH2 = C:\MinGW\MPICH2

MODULE = pij2d

.PHONY: exec
exec: Fi.txt
Fi.txt: ./$(MODULE)$(EXE)
	./$(MODULE)$(EXE) < Fi_original > 

C = lex.yy.c # cpp.cpp
H = hpp.hpp
CXXFLAGS += -I. -std=gnu++11
#-I$(MPICH2)/include -L$(MPICH2)/lib
./$(MODULE)$(EXE): $(C) $(H)
	$(CXX) $(CXXFLAGS) -o $@ $(C)
#	-lmpi
lex.yy.c: lpp.lpp
	flex $<

NOW = $(shell date +%Y%m%d%H%M)
.PHONY: rar
rar: $(NOW).rar
$(NOW).rar: test.files Fi.txt
	rar a -m5 -o- -r $@ @test.files
