.PHONY: all resume security world clean

all: resume security world

# ── build helper ─────────────────────────────────────────────────────────────
# Usage: $(call build,input.tex,output-stem)
PDFLATEX = pdflatex -interaction=nonstopmode -halt-on-error

define build
	@if command -v pdflatex >/dev/null 2>&1; then \
		echo "Building $(1) with pdflatex"; \
		$(PDFLATEX) -jobname=$(2) $(1); \
		if grep -q 'bibliography{' $(1) 2>/dev/null; then \
			echo "Running bibtex for $(2)"; \
			bibtex $(2) || true; \
			$(PDFLATEX) -jobname=$(2) $(1); \
		fi; \
		$(PDFLATEX) -jobname=$(2) $(1); \
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
