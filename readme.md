# 🎓 Unofficial LaTeX Templates for HCMUS

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](LICENSE)
[![Wiki](https://img.shields.io/badge/Documentation-Wiki-brightgreen.svg)](https://github.com/khongsomeo/hcmus-unofficial-report-template/wiki)

This repository provides LaTeX templates designed for students and researchers at the Ho Chi Minh City University of Science (HCMUS). All detailed user guides, configuration steps, layout previews, and compilation instructions are unified in the project Wiki.

👉 **[Go to Project Wiki Documentation](https://github.com/khongsomeo/hcmus-unofficial-report-template/wiki)**

> [!CAUTION]
> **These templates are unofficial, entirely community-run, and not endorsed by HCMUS.**
> 
> It is provided 100% free of charge via this official repository and the listed Overleaf links. If you paid money for this, you have been scammed. 
> We make no guarantees that your department's formatting committee won't reject this layout (along with your graduation timeline). Please consult your academic office or advisor before use to save your own sanity. We also take zero responsibility for sketchy copies downloaded from random third-party forums.
> 
> If it compiles and breaks, you get to keep both pieces. To report bugs or offer therapy to the maintainers, please open an issue or write to `thquan (at) fit.hcmus.edu.vn`.

---

## 🗂️ Available Templates

| Template | Folder Position | Launch on Overleaf | Documentation |
| :--- | :--- | :---: | :--- |
| **Course Report** | [report/](report) | [![Overleaf](https://img.shields.io/badge/Overleaf-Template-35713B?style=flat&logo=Overleaf&logoColor=white)](https://www.overleaf.com/latex/templates/hcmus-report-template/zyrhmsxynwqs) | [Report Guide](https://github.com/khongsomeo/hcmus-unofficial-report-template/wiki/Report) |
| **Master's Thesis** | [thesis/master/](thesis/master) | — | [Thesis Guide](https://github.com/khongsomeo/hcmus-unofficial-report-template/wiki/Master-Thesis) |

---

## 🛠️ General Prerequisites

To compile any template locally on your machine, you must install the following:

1. **Install TeXStudio**: `sudo apt-get install texstudio`
2. **Install TeXLive**: `sudo apt-get install texlive-full` (highly recommended, approx. 5GB)

> [!TIP]
> The default `texlive` package does **not** include all LaTeX packages. In order to render some components (e.g. `algorithm`, `biblatex`), you **must** install the `texlive-full` package. We recommend using Overleaf if you prefer to avoid a large local installation.

---

## 🤝 Acknowledgements

- [thiminhnhut/latex](https://github.com/thiminhnhut/latex) for the Vietnamese code listings syntax highlighting presets.

## 📄 License

This project is licensed under [The GNU GPL v3.0](LICENSE).
