\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dondenghinghiemthuhcmus}[2026/07/01 Custom HCMUS Acceptance Request Form Class]

% --- Default Option Values ---
\newcommand{\ReviewMode}{0} % Default is print/publish mode (0)

% --- Declare Class Options ---
\DeclareOption{review}{
  \renewcommand{\ReviewMode}{1}
}
\DeclareOption{print}{
  \renewcommand{\ReviewMode}{0}
}
\DeclareOption{publish}{
  \renewcommand{\ReviewMode}{0}
}

% Pass any other options to the base class 'article'
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% Process all options
\ProcessOptions\relax

% --- Load Base Class ---
\LoadClass[12pt,a4paper]{article}

% --- Load Required Packages ---
\RequirePackage[utf8]{inputenc}
\RequirePackage[utf8]{vietnam}
\RequirePackage{mathptmx}
\RequirePackage[top=1.0cm, bottom=1.5cm, left=3cm, right=2cm]{geometry}
\RequirePackage{xcolor}
\RequirePackage{tabularx}
\RequirePackage{makecell}
\RequirePackage{setspace}

% --- Tabularx Column Configurations ---
\renewcommand{\tabularxcolumn}[1]{m{#1}}

% --- Spacing Configuration ---
\setstretch{1.2}

% --- Parameter Setters and Internal Storage ---
\newcommand{\DonviQuanly}[1]{\gdef\@DonviQuanly{#1}}
\newcommand{\NgayKy}[1]{\gdef\@NgayKy{#1}}
\newcommand{\ThangKy}[1]{\gdef\@ThangKy{#1}}
\newcommand{\NamKy}[1]{\gdef\@NamKy{#1}}
\newcommand{\HoTenChuNhiem}[2]{%
  \gdef\@HoTenChuNhiemHocVi{#1}%
  \gdef\@HoTenChuNhiemTen{#2}%
  \gdef\@HoTenChuNhiem{\ifx\relax#1\relax\else#1 \fi#2}%
  \gdef\HoTenChuNhiem{\ifx\relax#1\relax\else#1 \fi#2}%
  \gdef\HoTenChuNhiemTen{#2}%
  \gdef\HoTenChuNhiemHocVi{#1}%
}
\newcommand{\TenDeTai}[1]{\gdef\@TenDeTai{#1}}
\newcommand{\MasoDeTai}[1]{\gdef\@MasoDeTai{#1}}
\newcommand{\NamDangKy}[1]{\gdef\@NamDangKy{#1}}
\newcommand{\KinhGoiDonVi}[1]{\gdef\@KinhGoiDonVi{#1}}
\newcommand{\XacNhanDonVi}[1]{\gdef\@XacNhanDonVi{#1}}

% Initialize placeholders/defaults
\gdef\@DonviQuanly{\dots}
\gdef\@NgayKy{\dots}
\gdef\@ThangKy{\dots}
\gdef\@NamKy{\dots}
\gdef\@HoTenChuNhiemHocVi{}
\gdef\@HoTenChuNhiemTen{\dots}
\gdef\@HoTenChuNhiem{\dots}
\gdef\HoTenChuNhiemTen{\dots}
\gdef\HoTenChuNhiemHocVi{}
\gdef\@TenDeTai{\dots}
\gdef\@MasoDeTai{\dots}
\gdef\@NamDangKy{\dots}
\gdef\@KinhGoiDonVi{Ban chủ nhiệm Khoa Công nghệ Thông tin}
\gdef\@XacNhanDonVi{Ban chủ nhiệm Khoa Công nghệ Thông tin}

% --- Member Declaration Logic ---
\newcommand{\DeclareMember}[4]{%
  \expandafter\gdef\csname HD#1Ten\endcsname{#2}%
  \expandafter\gdef\csname HD#1DonVi\endcsname{#3}%
  \expandafter\gdef\csname HD#1MSCB\endcsname{#4}%
}
\newcommand{\GetMemberTen}[1]{\csname HD#1Ten\endcsname}
\newcommand{\GetMemberDonVi}[1]{\csname HD#1DonVi\endcsname}
\newcommand{\GetMemberMSCB}[1]{\csname HD#1MSCB\endcsname}

% Initialize empty members
\DeclareMember{ChuTich}{}{}{}
\DeclareMember{PhanBien}{}{}{}
\DeclareMember{UyVien}{}{}{}
\DeclareMember{ThuKy}{}{}{}

% --- Conditional Field Styling and Mau T Box ---
\ifnum\ReviewMode=1
  \newcommand{\dien}[1]{{\color{purple}#1}}
  \newcommand{\diencell}{\color{purple}\bfseries}
  \newcommand{\MauTBox}{\hfill\fbox{\small Mẫu T-ĐĐNNT-22v1}}
\else
  \newcommand{\dien}[1]{{#1}}
  \newcommand{\diencell}{\bfseries}
  \newcommand{\MauTBox}{\hfill\phantom{\fbox{\small Mẫu T-ĐĐNNT-22v1}}}
\fi

% --- Render Template Command ---
\newcommand{\makeacceptanceform}{%
  \pagestyle{empty}
  
  \noindent
  \MauTBox
  \vspace{0.2cm}
  
  \noindent
  \begin{tabular}{@{}c@{}}
    \small\textbf{TRƯỜNG ĐẠI HỌC KHOA HỌC TỰ NHIÊN} \\
    \small\dien{\bfseries\MakeUppercase{\@DonviQuanly}} \\
    \rule{3.5cm}{0.5pt}
  \end{tabular}
  \hfill
  \begin{tabular}{@{}c@{}}
    \small\textbf{CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM} \\
    \small\textbf{Độc lập -- Tự do -- Hạnh phúc} \\
    \rule{4cm}{0.5pt}
  \end{tabular}
  
  \vspace{0.2cm}
  \noindent
  \hfill\textit{Tp. Hồ Chí Minh, ngày \dien{\@NgayKy} tháng \dien{\@ThangKy} năm \dien{\@NamKy}}
  
  \vspace{0.4cm}
  \begin{center}
    \large\textbf{ĐƠN ĐỀ NGHỊ NGHIỆM THU} \\
    \large\textbf{ĐỀ TÀI NGHIÊN CỨU KHOA HỌC VÀ CÔNG NGHỆ CẤP TRƯỜNG}
  \end{center}
  
  \vspace{0.3cm}
  \noindent\hspace*{1.27cm}
  \begin{tabular}{@{}ll@{}}
    \textbf{\textit{Kính gởi:}} & - \makecell[tl]{\diencell\@KinhGoiDonVi} \\
    & - \textbf{Phòng Khoa học Công nghệ,} \\
    & \hphantom{-} \textbf{Trường Đại học Khoa học Tự nhiên, ĐHQG-HCM}
  \end{tabular}
  
  \vspace{0.4cm}
  \noindent\hspace*{1.27cm}
  Tôi tên \dien{\@HoTenChuNhiem} có đăng ký thực hiện đề tài nghiên cứu khoa học và công nghệ cấp Trường năm \dien{\@NamDangKy}. Nay tôi đã hoàn tất và kính đề nghị \dien{\@DonviQuanly} và Phòng Khoa học và Công nghệ thành lập Hội đồng khoa học nghiệm thu đề tài.
  
  \vspace{0.4cm}
  \noindent\hspace*{1.27cm}
  Tên đề tài: ``\dien{\itshape\@TenDeTai}''
  
  \vspace{0.15cm}
  \noindent\hspace*{1.27cm}
  Mã số đề tài: \dien{\@MasoDeTai}
  
  \vspace{0.4cm}
  \noindent\hspace*{1.27cm}
  Đề xuất thành phần Hội đồng như sau:
  
  \vspace{0.2cm}
  \noindent
  \begin{tabularx}{\linewidth}{|c|X|X|c|c|}
    \hline
    \textbf{STT} & 
    \multicolumn{1}{c|}{\textbf{Họ và tên}} & 
    \multicolumn{1}{c|}{\textbf{Đơn vị công tác}} & 
    \textbf{MSCB} & 
    \textbf{\makecell{Chức danh\\ trong hội đồng}} \\ \hline
    1 & \dien{\GetMemberTen{ChuTich}} & \dien{\GetMemberDonVi{ChuTich}} & \dien{\GetMemberMSCB{ChuTich}} & Chủ tịch \\ \hline
    2 & \dien{\GetMemberTen{PhanBien}} & \dien{\GetMemberDonVi{PhanBien}} & \dien{\GetMemberMSCB{PhanBien}} & Phản biện \\ \hline
    3 & \dien{\GetMemberTen{UyVien}} & \dien{\GetMemberDonVi{UyVien}} & \dien{\GetMemberMSCB{UyVien}} & Ủy viên \\ \hline
    4 & \dien{\GetMemberTen{ThuKy}} & \dien{\GetMemberDonVi{ThuKy}} & \dien{\GetMemberMSCB{ThuKy}} & UV Thư ký \\ \hline
  \end{tabularx}
  
  \vspace{0.3cm}
  \noindent\hspace*{1.27cm}
  Kính chào trân trọng.
  
  \vspace{0.4cm}
  \noindent
  \begin{minipage}[t]{0.6\textwidth}
    \centering
    \small\makecell[c]{\diencell Xác nhận của \@XacNhanDonVi} \\
    \ifnum\ReviewMode=1
      \small\textit{(ký và ghi rõ họ tên)}
    \else
      \phantom{\small\textit{(ký và ghi rõ họ tên)}}
    \fi
  \end{minipage}
  \hfill
  \begin{minipage}[t]{0.35\textwidth}
    \centering
    \small\textbf{Chủ nhiệm đề tài} \\
    \ifnum\ReviewMode=1
      \small\textit{(ký và ghi rõ họ tên)} \\
    \else
      \phantom{\small\textit{(ký và ghi rõ họ tên)}} \\
    \fi
    \vspace{2.2cm}
    \small\dien{\bfseries\@HoTenChuNhiem}
  \end{minipage}
}
