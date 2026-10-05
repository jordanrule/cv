# CV / TeX Source

This directory contains LaTeX source files for a resume, a security-focused CV,
an academic paper on dependently typed world models, and a Beamer pitch deck
for the diffusion processing unit market opportunity.

## Files

| File | Description |
|---|---|
| `resume.tex` | Standard two-page resume |
| `security.tex` | Security-focused CV variant |
| `world_model_paper.tex` | Academic paper: *Dependently Typed World Models* |
| `world_model_paper.bib` | BibTeX bibliography for the paper |
| `pitch.tex` | Beamer pitch deck: diffusion processing unit market opportunity |
| `Makefile` | Convenience targets for building and cleaning |

## Build targets

Use `make <target>` from this directory. Each target falls back to `tectonic`
if `pdflatex` is not available.

| Target | Output | Notes |
|---|---|---|
| `make resume` | `resume.pdf` | Standard resume |
| `make security` | `security.pdf` | Security-focused CV |
| `make world` | `world_model_paper.pdf` | Academic paper; runs `bibtex` automatically |
| `make pitch` | `pitch.pdf` | 5–10 minute Beamer pitch on the DPU market opportunity |
| `make all` | all four PDFs | Builds everything in sequence |
| `make clean` | — | Removes all build artifacts and PDFs |

### Examples

```sh
# Build only the resume
make resume

# Build the academic paper (handles bibtex automatically)
make world

# Build the Beamer pitch deck
make pitch

# Build everything at once
make all

# Remove all generated files
make clean
```

## TeX engine requirements

The Makefile uses `pdflatex` when available and falls back to `tectonic`.
Install one of:

- **MacTeX** (`pdflatex` + `bibtex`): <https://tug.org/mactex/>
- **Tectonic** (single-binary, auto-downloads packages): <https://tectonic-typesetting.github.io/>

Beamer output such as `pitch.tex` may generate additional auxiliary files
(`.nav`, `.snm`, `.toc`, `.vrb`), which are also removed by `make clean`.

