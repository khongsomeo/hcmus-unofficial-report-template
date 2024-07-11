# (Unofficial) report template for HCMUS

This repository stores the source code for these templates:

- `report`: [Report Template on Overleaf](https://www.overleaf.com/latex/templates/hcmus-report-template/zyrhmsxynwqs)
- `book`: (updating)

Main files (applied to all templates): `main.tex` (i.e. compile this file in Overleaf or TexStudio to render the full document).

## Additional note

### Compiling on local machine

1. Install TeXStudio `sudo apt-get install texstudio`
2. Install TeXLive: `sudo apt-get install texlive-full`

**Important:** `textlive` package does **not** include all LaTeX packages. In order to render some components (e.g. `algorithm`), you **must** install the `texlive-full` package (which is around 5GB!). Therefore we would recommend you using Overleaf for the best experience.

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
