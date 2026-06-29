PDFLATEX=pdflatex
TEX=resume.tex
PDF=resume.pdf

.PHONY: pdf clean

pdf:
	$(PDFLATEX) -interaction=nonstopmode -halt-on-error $(TEX)
	$(PDFLATEX) -interaction=nonstopmode -halt-on-error $(TEX)

clean:
	rm -f resume.aux resume.log resume.out resume.pdf

