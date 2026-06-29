TEX=resume.tex
PDF=resume.pdf

.PHONY: pdf clean

pdf:
	@if command -v pdflatex >/dev/null 2>&1; then \
		echo "Building with pdflatex"; \
		pdflatex -interaction=nonstopmode -halt-on-error $(TEX); \
		pdflatex -interaction=nonstopmode -halt-on-error $(TEX); \
	elif command -v tectonic >/dev/null 2>&1; then \
		echo "Building with tectonic"; \
		tectonic $(TEX); \
	else \
		echo "Error: no TeX engine found. Install MacTeX (pdflatex) or tectonic, then rerun 'make pdf'." >&2; \
		exit 1; \
	fi

clean:
	rm -f resume.aux resume.log resume.out resume.pdf resume.xdv

