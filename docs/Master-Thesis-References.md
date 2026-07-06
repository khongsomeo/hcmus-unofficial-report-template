# 📚 References System (Biber & Split Bibliographies)

The Master's Thesis template uses `biblatex` with the `biber` backend. This setup automates the separation of Vietnamese and English citations while maintaining continuous sequential numbering (e.g., Vietnamese entries start at `[1]`, and English entries continue from `[2]`, `[3]`, etc.).

## 1. How References are Split
The reference bibliography entries are stored in [Materials/References/references.bib](https://github.com/khongsomeo/hcmus-unofficial-report-template/blob/main/thesis/master/Materials/References/references.bib).
* **Vietnamese References**: Must include a `keywords = {Viet}` line in their BibTeX entries.
* **English/Foreign References**: Do **not** include the `keywords` line.

### Example Vietnamese Entry:
```bibtex
@article{nguyen2026sample,
  author   = {Nguyen, Van A and Tran, Thi B},
  title    = {A Sample Reference for Vietnamese},
  journal  = {Journal of Computer Science},
  year     = {2026},
  keywords = {Viet}
}
```

### Example English Entry:
```bibtex
@book{adams2026treatise,
  author    = {Adams, Albert},
  title     = {A Treatise on Computer Science},
  publisher = {Example Publishing},
  year      = {2026}
}
```

## 2. Compilation Command
To correctly compile references, use the Biber compiler instead of the legacy BibTeX compiler:
```bash
pdflatex main
biber main
pdflatex main
pdflatex main
```
Alternatively, just run the automated build script:
```bash
bash thesis-build.sh
```

---
*Back to [Home](Home)*
