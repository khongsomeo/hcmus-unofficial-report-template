# 🛠️ Master's Thesis Local Compilation Guide

This guide explains how to compile the Master's Thesis template locally on your machine.

## 1. Automated Compilation (Recommended)
Navigate to the `thesis/master/` directory and execute the provided build script:
```bash
bash thesis-build.sh
```
This script automates the full compilation pipeline (PDFLaTeX -> Biber -> PDFLaTeX -> PDFLaTeX) to resolve all cross-references, glossary terms, and split bibliographies.

## 2. Manual Compilation
If you prefer to compile manually, run the following sequence of commands in the `thesis/master/` directory:
```bash
pdflatex main
biber main
pdflatex main
pdflatex main
```

> [!IMPORTANT]
> **Biber Backend Required**
> This template uses the `biber` backend for `biblatex` to handle continuous split reference numbering. Running legacy `bibtex` will result in missing bibliography lists or citations showing as `[0]`.

---
*Back to [Home](Home)*
