# 🔤 Acronyms & Abbreviations (`acronyms.tex`)

Acronyms and abbreviations are managed using the `glossaries` package inside [Thesis/Appendix/acronyms.tex](https://github.com/khongsomeo/hcmus-unofficial-report-template/blob/main/thesis/master/Thesis/Appendix/acronyms.tex).

### How to Define an Acronym
Define your acronyms in `acronyms.tex` using the `\newacronym` command:
```tex
\newacronym{label}{Abbreviation}{Full Description}
% Example:
\newacronym{ai}{AI}{Artificial Intelligence}
```

### How to Reference Acronyms in Text
Reference your defined acronyms in chapters using:
- `\gls{label}`: Standard reference (outputs full text on first use, e.g., *Artificial Intelligence (AI)*, and just abbreviation subsequently, e.g., *AI*).
- `\Gls{label}`: Capitalized first letter (for starting sentences).
- `\glspl{label}`: Plural form.

---
*Back to [Home](Home)*
