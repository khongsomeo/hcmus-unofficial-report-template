# ⚙️ Book Template Quick Setup

Open the book's [main.tex](https://github.com/khongsomeo/hcmus-unofficial-report-template/blob/main/book/main.tex) file and customize the metadata fields:

```tex
% Define course name, report name, and report title.
\newcommand{\coursename}{Tên môn học}
\newcommand{\reportname}{Tên đề tài báo cáo}
\newcommand{\reporttitle}{Tiêu đề báo cáo}

% Define students participating (use \\ for line breaks between names)
\newcommand{\studentname}{Hoang-Quan Tran (19120338) \\ meadoge (19126969) \\ Hwang S. Wan (19120000)}

% Define supervisor/teacher names
\newcommand{\teachername}{GS. TS. Nguyễn Văn Hướng Dẫn \\ PGS. TS. Trần Lùi Xuống}
```

## 🛠️ Options & Configuration
The template preamble supports these optional configurations:

*   **Line Spacing**: Set to `1.5` by default. Can be adjusted by modifying `\renewcommand{\baselinestretch}{1.5}`.
*   **Indentation**: Paragraph indentation is disabled by default. You can uncomment `\setlength{\parindent}{0pt}` to disable indentation globally.
*   **Times Font**: Uncomment `\usepackage{mathptmx}` to use the Times New Roman font family.
*   **Roman Section Headings**: Uncomment these rows to use Roman numerals for sections and subsections:
    ```tex
    % \renewcommand{\thesection}{\Roman{section}}
    % \renewcommand{\thesubsection}{\thesection.\Roman{subsection}}
    ```

---
*Back to [Home](Home)*
