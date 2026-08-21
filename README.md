# CV / TeX Source

This directory contains LaTeX source files for a resume, a security-focused CV,
and an academic paper on dependently typed world models.

## Files

| File | Description |
|---|---|
| `resume.tex` | Standard two-page resume |
| `security.tex` | Security-focused CV variant |
| `world_model_paper.tex` | Academic paper: *Dependently Typed World Models* |
| `world_model_paper.bib` | BibTeX bibliography for the paper |
| `Makefile` | Convenience targets for building and cleaning |

## Build targets

Use `make <target>` from this directory. Each target falls back to `tectonic`
if `pdflatex` is not available.

| Target | Output | Notes |
|---|---|---|
| `make resume` | `resume.pdf` | Standard resume |
| `make security` | `security.pdf` | Security-focused CV |
| `make world` | `world_model_paper.pdf` | Academic paper; runs `bibtex` automatically |
| `make all` | all three PDFs | Builds everything in sequence |
| `make clean` | — | Removes all build artifacts and PDFs |

### Examples

```sh
# Build only the resume
make resume

# Build the academic paper (handles bibtex automatically)
make world

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
