
.PHONY: exec
exec: Fi.txt
Fi.txt: ./pij2d$(EXE)
	./pij2d$(EXE)

C = cpp.cpp
H = hpp.hpp
CXXFLAGS += -I. -std=gnu++11
./pij2d$(EXE): $(C) $(H)
	$(CXX) $(CXXFLAGS) -o $@ $(C)

NOW = $(shell date +%Y%m%d%H%M)
.PHONY: rar
rar: $(NOW).rar
$(NOW).rar: test.files Fi.txt
	rar a -m5 -o- -r $@ @test.files
#	"./mailsend1.18.exe" \
#		-smtp smtp.gmail.com -f dponyatov@gmail.com \
#		-t dponyatov@gmail.com -sub pij2d_$(NOW) \
#		-attach $(NOW).rar,mime64,a
