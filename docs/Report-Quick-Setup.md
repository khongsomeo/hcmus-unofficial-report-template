# ⚙️ Report Template Quick Setup

Open the report's [main.tex](https://github.com/khongsomeo/hcmus-unofficial-report-template/blob/main/report/main.tex) file and customize the metadata fields:

```tex
% Define course name, report name, and report title.
\newcommand{\coursename}{Môn Học Gì Đấy}
\newcommand{\reportname}{Tên Báo Cáo Gì Đấy}
\newcommand{\reporttitle}{Báo cáo Bài Tập Gì Đấy}

% Define students participating (use \\ for line breaks between names)
\newcommand{\studentname}{Quan, Tran Hoang (19120338)\\meadoge(19120000)\\Hwang S. Wan (19120000)}

% Define supervisor/teacher name
\newcommand{\teachername}{GS.\ TS.\ Nguyễn Văn Hướng Dẫn}
```

## 🛠️ Options & Configuration
The template preamble supports these optional configurations:

*   **Line Spacing**: Set to `1.5` by default. Can be adjusted by modifying `\renewcommand{\baselinestretch}{1.5}`.
*   **Indentation**: Paragraph indentation is disabled by default via `\setlength{\parindent}{0pt}`.
*   **Times Font**: Uncomment `\usepackage{mathptmx}` to use the Times New Roman font family.
*   **Roman Section Headings**: Uncomment these rows to use Roman numerals for sections and subsections:
    ```tex
    % \renewcommand{\thesection}{\Roman{section}}
    % \renewcommand{\thesubsection}{\thesection.\Roman{subsection}}
    ```

---
*Back to [Home](Home)*
