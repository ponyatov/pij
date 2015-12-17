exec: ./pij2d$(EXE)
	./pij2d$(EXE)
C = cpp.cpp
H = hpp.hpp
CXXFLAGS += -I. -std=gnu++11
./pij2d$(EXE): $(C) $(H)
	$(CXX) $(CXXFLAGS) -o $@ $(C)
