# 🛠️ Report Local Compilation Guide

The report template utilizes standard BibTeX for references. Unlike the thesis template (which uses Biber), this template compiles using the traditional BibTeX workflow.

## 1. Compilation Command Sequence
To compile the report template locally, execute the following sequence of commands in the `report/` directory:

```bash
pdflatex main
bibtex main
pdflatex main
pdflatex main
```

## 2. Preamble Clean Up
Ensure that your graphics path and fonts are resolved. If you are using custom images, make sure they are placed in `img/` or set a custom path using:
```tex
\graphicspath{{img/}}
```

---
*Back to [Home](Home)*
