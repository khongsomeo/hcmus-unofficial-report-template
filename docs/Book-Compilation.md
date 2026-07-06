# 🛠️ Book Local Compilation Guide

The book template compiles using standard BibTeX, similar to the report template.

## 1. Compilation Command Sequence
To compile the book template locally, execute the following sequence of commands in the `book/` directory:

```bash
pdflatex main
bibtex main
pdflatex main
pdflatex main
```

## 2. Bibliographies
References are styled using `ieeetr` and read from `ref/ref.bib`. Ensure that you compile using `bibtex main` after the initial `pdflatex` run to generate the references page.

---
*Back to [Home](Home)*
