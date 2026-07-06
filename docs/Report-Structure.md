# 📄 Report Template Structure

The report template is highly modular, separating different components (code, images, math, tables) into standalone files under the `content/` folder for ease of maintenance.

## 🗂️ File Organization

*   `main.tex`: Entry point containing page layout resets and modular inputs.
*   `hcmus-report-template.sty`: Custom package handling package imports, headers, and footer layouts.
*   `img/`: Holds graphic assets (such as university logos and figures).
*   `ref/ref.bib`: BibTeX file containing citation references.
*   `appendix/appendix.tex`: Appendices.

---

## 📝 Document Body Modules (`content/`)

*   `content/title.tex`: The cover page format (reads metadata from `main.tex`).
*   `content/section.tex`: General text structure, sections, and subsections.
*   `content/hinhanh.tex`: Guidelines on inserting figures, adjusting scaling, and adding captions.
*   `content/bangbieu.tex`: Guidelines on generating tables.
*   `content/congthuctoan.tex`: LaTeX math equations, matrices, and symbols.
*   `content/thuattoan.tex`: Writing algorithms and pseudocode using the `algorithm` package.
*   `content/code.tex`: Inserting code listings (such as C++ or Python) with custom colors and line numbering.
*   `content/ngonngu.tex`: Vietnamese language setup.
*   `content/cite.tex`: Demonstrates how to cite references using `\cite`.

---
*Back to [Home](Home)*
