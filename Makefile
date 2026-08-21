.PHONY: all resume security world clean

all: resume security world

# ── build helper ─────────────────────────────────────────────────────────────
# Usage: $(call build,input.tex,output-stem)
define build
	@if command -v pdflatex >/dev/null 2>&1; then \
		echo "Building $(1) with pdflatex"; \
		pdflatex -interaction=nonstopmode -halt-on-error -jobname=$(2) $(1); \
		if grep -q '\\bibliography{' $(1) 2>/dev/null; then \
			bibtex $(2) || true; \
			pdflatex -interaction=nonstopmode -halt-on-error -jobname=$(2) $(1); \
		fi; \
		pdflatex -interaction=nonstopmode -halt-on-error -jobname=$(2) $(1); \
	elif command -v tectonic >/dev/null 2>&1; then \
		echo "Building $(1) with tectonic"; \
		tectonic --outdir . $(1); \
	else \
		echo "Error: no TeX engine found. Install MacTeX or tectonic." >&2; \
		exit 1; \
	fi
endef

# ── individual targets ────────────────────────────────────────────────────────
resume:
	$(call build,resume.tex,resume)

security:
	$(call build,security.tex,security)

world:
	$(call build,world_model_paper.tex,world_model_paper)

# ── clean ─────────────────────────────────────────────────────────────────────
clean:
	rm -f *.aux *.log *.out *.bbl *.blg *.xdv \
	      resume.pdf security.pdf world_model_paper.pdf
