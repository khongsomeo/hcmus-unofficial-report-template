# ⚙️ Quick Setup in `main.tex`

Open [main.tex](https://github.com/khongsomeo/hcmus-unofficial-report-template/blob/main/thesis/master/main.tex) and configure the student metadata block:

```tex
% Tên học viên: {Tiếng Việt}{Tiếng Anh} (Không dùng \\)
\setHoVaTen{Nguyễn~Văn~A}{Nguyen Van A}

% Mã số học viên (MSSV) (Không dùng \\)
\setMSSV{22C11001}

% Khóa đào tạo (Ví dụ: K32/2022) (Không dùng \\)
\setKhoaDaoTao{K32/2022}

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

% Địa điểm bảo vệ (Không dùng \\, mặc định là Tp. Hồ Chí Minh nếu comment)
% \setDiaChi{Tp. Hồ Chí Minh}
```

> [!WARNING]
> **Line Breaks (`\\`) Warning**
> Line breaks (`\\`) are strictly forbidden in all metadata fields except for the thesis title (`\setTenKL`). Putting line breaks in fields like student names or supervisor names will break the metadata processing and result in compilation errors.

---
*Back to [Home](Home)*
