# (Unofficial) report template for HCMUS

This repository stores the source code for these templates:

- `report`: [Report Template on Overleaf](https://www.overleaf.com/latex/templates/hcmus-report-template/zyrhmsxynwqs)
- `book`: (updating)

Main files: `main.tex` (i.e. compile this file in Overleaf or TexStudio to render the full document).

## Additional note

### Compiling

These templates would work (best) in TexStudio or Overleaf. However, `textlive` on Ubuntu does **not** install full LaTeX packages. In order to render some packages (e.g. `algorithm`) offline, you **must** install the `texlive-full` package (which is around 5GB!). Therefore we would recommend you using Overleaf for the best experience.

### Vietnamese Code Listing

To use Vietnamese code listing:

```tex
\vietnameselst
\lstinputlisting[language=Language]{filepath}
```

The `\vietnameselst` command can be found in `.sty` files.

## Acknowledgement

Huge appreciate to

- [thiminhnhut/latex](https://github.com/thiminhnhut/latex) for Vietnamese listings

## License

This work is licensed under [The GNU GPL v3.0](LICENSE)
