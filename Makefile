PAPER = paper
TEX = $(wildcard *.tex)
BIB = references.bib
EPS = $(wildcard figures/*.eps)
FIGS = $(wildcard figures/*.pdf figures/*.png graphs/*.pdf graphs/*.png)

.PHONY: all clean

$(PAPER).pdf: $(TEX) $(BIB) $(FIGS) eps
	echo $(FIGS)
	pdflatex $(PAPER)
	bibtex $(PAPER)
	pdflatex $(PAPER)
	pdflatex $(PAPER)

eps: $(EPS)
	epstopdf $(EPS)

clean:
	rm -f *.aux *.bbl *.blg *.log *.out $(PAPER).pdf *~

