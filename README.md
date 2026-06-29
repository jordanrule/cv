# Resume TeX Source

This directory contains a compact two-page resume in `resume.tex`.

## Files

- `resume.tex` - the resume source
- `Makefile` - convenience commands for building and cleaning

## Build a nicely formatted PDF

Use the included `Makefile`:

```sh
cd /Users/jrule/git/cv
make pdf
```

`make pdf` uses `pdflatex` when available and falls back to `tectonic`.

If you do not have a TeX engine installed:

- MacTeX (`pdflatex`): <https://tug.org/mactex/>
- pdfTeX overview: <https://tug.org/applications/pdftex/>
