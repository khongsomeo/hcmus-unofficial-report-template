# HCMUS Master Thesis Template

> [!CAUTION]
> **Unofficial Template & Ongoing Development**
> - This is **not** the official LaTeX thesis template of the Ho Chi Minh City University of Science (HCMUS), and is specifically designed for the **Master's thesis** only.
> - This template is still under active development and adjustments.
> - If you encounter any issues or wish to make contributions, please **open an issue** in this repository or contact **thquan (at) fit.hcmus.edu.vn**.

This is a professional Master's Thesis Template for the Ho Chi Minh City University of Science, refactored from previous works by Dr. Nghiem Quoc Minh and Mr. Bui Huy Thong. The layout, geometry, packages, and custom styles are encapsulated inside the custom class `hcmusthesis.cls`.

---

## 📌 Table of Contents

- [⚙️ Quick Setup in `main.tex`](#quick-setup-in-maintex)
- [📄 Structure of `main.tex`](#structure-of-maintex)
- [🗂️ Adding New Chapters](#adding-new-chapters)
- [📝 Writing Thesis Information (`thongtinluanvan.tex`)](#writing-thesis-information-thongtinluanvantex)
- [🛠️ Local Compilation Guide](#local-compilation-guide)
- [🔤 Acronyms & Abbreviations (`acronyms.tex`)](#acronyms--abbreviations-acronymstex)
- [💝 Acknowledgements (`thanks.tex`)](#acknowledgements-thankstex)
- [📄 Managing Publications (`publish.tex`)](#managing-publications-publishtex)
- [📎 Adding Appendices](#adding-appendices)
- [🐱 Diligent Graduate Student](#diligent-graduate-student)

---

## ⚙️ Quick Setup in `main.tex`

Open [main.tex](main.tex) and configure the student metadata block:

```tex
% Tên học viên: {Tiếng Việt}{Tiếng Anh} (Không dùng \\)
\setHoVaTen{Nguyễn~Văn~A}{Nguyen Van A}

% Mã số học viên (MSSV) (Không dùng \\)
\setMSSV{24C99001}

% Khóa đào tạo (Ví dụ: K24/2024) (Không dùng \\)
\setKhoaDaoTao{K24/2024}

% Tên đề tài luận văn: {Tiếng Việt}{Tiếng Anh}
% [!] Được phép chứa dấu xuống dòng (\\) để tự động căn chỉnh trang bìa
\setTenKL{Nghiên~cứu~phát~triển~hệ~thống\\trí~tuệ~nhân~tạo}{Research and Development of Artificial Intelligence Systems}

% Mã số ngành (Không dùng \\)
\setMaNganh{8.48.01.01}

% Tên ngành đào tạo: {Tiếng Việt}{Tiếng Anh} (Không dùng \\)
\setTenNganh{Khoa học Máy tính}{Computer Science}

% Cán bộ hướng dẫn: {Tiếng Việt}{Tiếng Anh} (Không dùng \\)
% [!] Nếu có từ 2 cán bộ hướng dẫn trở lên, gọi dòng \addTenGVHD nhiều lần liên tiếp
\addTenGVHD{PGS. TS. Nguyễn Văn B}{Assoc. Prof. Dr. Nguyen Van B}
\addTenGVHD{TS. Trần Thị C}{Dr. Tran Thi C}

% Tên bộ môn (Không dùng \\)
\setTenBM{Công nghệ Tri thức}

% Địa điểm và ngày tháng bảo vệ (Không dùng \\)
\setDiaChiNgayThang{Tp. Hồ Chí Minh -- Năm 2026}
```

> [!WARNING]
> **Line Breaks (`\\`) Warning**
> Line breaks (`\\`) are strictly forbidden in all metadata fields except for the thesis title (`\setTenKL`). Putting line breaks in fields like student names or supervisor names will break the metadata processing and result in compilation errors.

---

## 📄 Structure of `main.tex`

The body of [main.tex](main.tex) is clean and focuses entirely on the logical structure of your thesis, hiding complex LaTeX resets and styles under the hood:

```latex
\begin{document}

% 1. Trang bìa (không đánh số trang)
\makethesiscover

% Bắt đầu đánh số trang La Mã (i, ii, iii, ...) cho phần giới thiệu đầu
\pagenumbering{roman}

% 2. Lời cam đoan
\inputreassurances

% 3. Lời cảm ơn
\inputthanks

% 4. Các trang mục lục và danh mục
\maketableofcontents
\makelistoffigures
\makelistoftables
\makeglossaryofacronyms

% 5. Trang thông tin luận văn (Tiếng Việt & Tiếng Anh)
% [!] Tự động định dạng các đề mục của trang thông tin và khôi phục khi hoàn tất
\inputthesisinfo

% ========================================================================================= %
% CÁC CHƯƠNG NỘI DUNG
% ========================================================================================= %

% Bắt đầu đánh số trang Ả Rập (1, 2, 3, ...) từ Chương 1
\pagenumbering{arabic}

\input{Thesis/Chapter1-Introduction/chapter1}
\input{Thesis/Chapter2-RelatedWorks/chapter2}
\input{Thesis/Chapter3/chapter3}
\input{Thesis/Chapter4/chapter4}
\input{Thesis/Chapter5-Conclusion/chapter5}

% ========================================================================================= %
% CÔNG TRÌNH & TÀI LIỆU THAM KHẢO & PHỤ LỤC
% ========================================================================================= %

% Danh mục công trình của tác giả (nếu không có thì comment dòng này)
\inputpublications

% In tài liệu tham khảo (Tự động chia nhóm Tiếng Việt & Tiếng Anh với số thứ tự liên tục)
\printthesisbibliography

% Phần phụ lục (nếu có)
\appendix
\input{Thesis/Appendix/appendix-a}

\end{document}
```

---

## 🗂️ Adding New Chapters

Each chapter is stored as a separate `.tex` file inside its own dedicated folder in the `Thesis/` directory (e.g., `Thesis/Chapter1-Introduction/chapter1.tex`).

> [!TIP]
> **Co-locating Resources**
> The purpose of creating a dedicated folder for each chapter is to keep chapter-specific resources (such as figures, images, or raw data tables) self-contained within that directory. This makes managing complex documents much easier and prevents cluttering the global folders.

### How to Add a New Chapter
1. **Create the Folder & File**: Create a folder (e.g., `Thesis/Chapter6-MyNewChapter/`) and create a `.tex` file inside it (e.g., `chapter6.tex`).
2. **Start the Chapter**: Write the chapter header at the top of the file:
   ```tex
   \chapter{Tên Chương Mới}
   \label{Chapter6}
   
   Nội dung chương mới viết ở đây...
   ```
3. **Register in `main.tex`**: Import your chapter inside [main.tex](main.tex) under the `% Các chương nội dung` block (before the publication/bibliography imports):
   ```tex
   \input{Thesis/Chapter6-MyNewChapter/chapter6}
   ```

---

## 📝 Writing Thesis Information (`thongtinluanvan.tex`)

The thesis information page [thongtinluanvan.tex](Thesis/Appendix/thongtinluanvan.tex) uses logical environments. All the margins, signature tables, and page breaks are handled automatically.

```tex
\begin{trangthongtinluanvan}
    \begin{tomtatvi}
        % Viết tóm tắt nội dung luận văn Tiếng Việt tại đây...
    \end{tomtatvi}

    \begin{ketquamoivi}
        % Viết kết quả mới đạt được tại đây...
    \end{ketquamoivi}

    \begin{ungdungvi}
        % Viết khả năng ứng dụng thực tiễn tại đây...
    \end{ungdungvi}
\end{trangthongtinluanvan}

\begin{trangthesisinformation}
    \begin{summaryen}
        % Write English summary here...
    \end{summaryen}

    \begin{noveltyen}
        % Write English novelty here...
    \end{noveltyen}

    \begin{applicationsen}
        % Write English applications here...
    \end{applicationsen}
\end{trangthesisinformation}
```

> [!IMPORTANT]
> **Dynamic Supervisor Lists**
> You can print the formatted, comma-separated list of supervisors anywhere in your chapters by using:
> - `\listSupervisors` (Vietnamese, e.g., *PGS. TS. Nguyễn Văn B và TS. Trần Thị C*)
> - `\listSupervisorsEnglish` (English, e.g., *Assoc. Prof. Dr. Nguyen Van B and Dr. Tran Thi C*)

---

## 🛠️ Local Compilation Guide

Compile the thesis from the command line in `thesis/master`:
```bash
bash thesis-build.sh
```
Or run compilation manually:
```bash
pdflatex main
biber main
pdflatex main
pdflatex main
```

> [!NOTE]
> **Splitting Bibliographies**
> The references are split into Vietnamese and English sections based on the `Viet` keyword inside `Materials/References/references.bib`.
> - If a citation belongs to a Vietnamese reference, add `keywords = {Viet}` to its BibTeX entry.
> - If a citation is English/Foreign, omit the `keywords` field.
> - Numbering continues sequentially across both sections automatically!

---

## 🔤 Acronyms & Abbreviations (`acronyms.tex`)

Acronyms and abbreviations are managed using the `glossaries` package inside [Thesis/Appendix/acronyms.tex](Thesis/Appendix/acronyms.tex).

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

## 💝 Acknowledgements (`thanks.tex`)

The acknowledgements section is located in [Thesis/Appendix/thanks.tex](Thesis/Appendix/thanks.tex). 

### How to Edit Acknowledgements
1. Open `thanks.tex`.
2. Edit the content directly within the file.
3. You can dynamically print the correct list of your science supervisors by referencing `\listSupervisors` (Vietnamese format) or `\listSupervisorsEnglish` (English format).

---

## 📄 Managing Publications (`publish.tex`)

The list of candidate publications is managed in [Thesis/Appendix/publish.tex](Thesis/Appendix/publish.tex).

### How to Add a New Publication
Add a new item inside the `enumerate` block using `\item[CT-xx]` and `\hypertarget`:
```tex
\item[CT-02] \hypertarget{pub:CT-02}{} \textbf{Họ Tên Tác Giả}, \textit{Tên bài báo mới}. Tên tạp chí/hội nghị, Năm.
```

> [!NOTE]
> **Understanding Labels**
> - The prefix `CT` stands for **"Công trình"** (work). You are free to change this prefix to whatever you prefer (e.g., `BB` for *Bài báo* or `PUB` for *Publication*).
> - Make sure to keep the labels consistent between `\item[...]` and the `\hypertarget{pub:...}{}` anchor so that any cross-references or hyperlinks point to the correct items.

### How to Remove the Publications Page
If you do not have any publications yet, simply comment out or remove this line in [main.tex](main.tex):
```tex
% \inputpublications
```

---

## 📎 Adding Appendices

Appendices are stored inside the `Thesis/Appendix/` directory (e.g., `Thesis/Appendix/appendix-a.tex`).

### How to Add a New Appendix
1. **Create the File**: Create a `.tex` file (e.g., `Thesis/Appendix/appendix-b.tex`).
2. **Start the Appendix**: Use standard `\chapter` tags. In LaTeX, calling `\chapter` after the `\appendix` command automatically formats it as an Appendix (e.g., *Phụ lục B*) instead of a standard chapter:
   ```tex
   \chapter{Bảng Biểu Chi Tiết}
   \label{appendix:b}
   
   Nội dung phụ lục viết ở đây...
   ```
3. **Register in `main.tex`**: Import your appendix file inside [main.tex](main.tex) under the `% Phần phụ lục` block (at the very bottom of the document):
   ```tex
   \appendix
   \input{Thesis/Appendix/appendix-a}
   \input{Thesis/Appendix/appendix-b}
   ```

---

## 🐱 Diligent Graduate Student

Here is a look at the most diligent PhD's student in the department working hard on their thesis:

![Học viên chăm chỉ nhất HCMUS đang cày luận văn lúc 3h sáng](Materials/Figures/MeoVietLuanVan.png)
*(Hình ảnh được tạo bởi Gemini / Image created by Gemini)*

Good luck with your thesis!
