TEX = korolev.tex
TEX += ../../texheader/ebook.tex
TEX += ../../texheader/colors.tex
TEX += ../../texheader/cyr.tex
TEX += ../../texheader/comp.tex
TEX += ../../texheader/relsec.tex
TEX += ../../texheader/misc.tex

FIG = korolev.png

LST = pij2d.mk ../pij2d/lpp.lpp ../pij2d/hpp.hpp ../pij2d/cpp.cpp

LATEX = pdflatex -halt-on-error
korolov.pdf: $(TEX) $(FIG) $(LST)
	$(LATEX) $< && $(LATEX) $<

korolev.png: algoritm.dot
	dot -Tpng -o $@ $<

pij2d.mk: ../pij2d/Makefile
	cp $< $@


