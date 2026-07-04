# HCMUS Master Thesis Template

> [!CAUTION]
> **Unofficial Template & Ongoing Development**
> - This is **not** the official LaTeX thesis template of the Ho Chi Minh City University of Science (HCMUS), and is specifically designed for the **Master's thesis** only.
> - This template is still under active development and adjustments.
> - If you encounter any issues or wish to make contributions, please **open an issue** in this repository or contact **thquan (at) fit.hcmus.edu.vn**.

This is a professional Master's Thesis Template for the Ho Chi Minh City University of Science, refactored from previous works by Dr. Nghiem Quoc Minh and Mr. Bui Huy Thong. The layout, geometry, packages, and custom styles are encapsulated inside the custom class `hcmusthesis.cls`.

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
% [!] Chỉ phần Tiếng Việt được phép chứa \\ để tự động xuống dòng trên trang bìa
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
> Line breaks (`\\`) are strictly forbidden in all metadata fields except for the Vietnamese thesis title (`\setTenKL` first argument). Putting line breaks in fields like student names or supervisor names will break the metadata processing and result in compilation errors.

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
bibtex main
pdflatex main
pdflatex main
```

> [!NOTE]
> **Splitting Bibliographies**
> The references are split into Vietnamese and English sections based on the `Viet` keyword inside `Materials/References/references.bib`.
> - If a citation belongs to a Vietnamese reference, add `keywords = {Viet}` to its BibTeX entry.
> - If a citation is English/Foreign, omit the `keywords` field.
> - Numbering continues sequentially across both sections automatically!
