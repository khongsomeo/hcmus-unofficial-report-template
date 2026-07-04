\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hcmusthesis}[2026/07/05 HCMUS Unofficial Thesis Class]

% Pass options to the base class extreport
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extreport}}
\ProcessOptions\relax
\LoadClass[oneside,a4paper,14pt]{extreport}

% ========================================================================================= %
% Gói lệnh & Cấu hình cơ bản                                                                 %
% ========================================================================================= %

% Font tiếng Việt
\RequirePackage[T5]{fontenc}
\RequirePackage[utf8]{inputenc}
\DeclareTextSymbolDefault{\DH}{T1}

% Font times
\RequirePackage{mathptmx}

\makeatletter
\def\blx@maxline{77}
\makeatother

% Caption bảng
\RequirePackage{caption}
\captionsetup[table]{
    position=top,
    belowskip=4pt,
}
\RequirePackage{subcaption}

% Cột
\RequirePackage{multicol}

% Chèn hình
\RequirePackage{graphicx}
\graphicspath{ {Materials/Figures} }

% Format tiêu đề
\RequirePackage{titlesec}

% Chèn và định dạng mã nguồn
\RequirePackage{fancyvrb,fvextra}
\RequirePackage{listings}
\RequirePackage{color}
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}
\lstdefinestyle{mystyle}{
    backgroundcolor=\color{backcolour},   
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\footnotesize,
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=b,                    
    keepspaces=true,                 
    numbers=left,                    
    numbersep=5pt,                  
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2
}
\lstset{style=mystyle}

% Chèn và định dạng mã giả
\RequirePackage{amsmath}
\RequirePackage{algorithm}
\RequirePackage[noend]{algpseudocode}
\makeatletter
\def\BState{\State\hskip-\ALG@thistlm}
\makeatother

% Bảng biểu
\RequirePackage{booktabs}
\RequirePackage{makecell}
\RequirePackage{tabularx}
\RequirePackage{threeparttable}
\RequirePackage{multirow}
\RequirePackage{array}
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Đổi tên mặc định
\renewcommand{\chaptername}{Chương}
\renewcommand{\figurename}{Hình}
\renewcommand{\tablename}{Bảng}
\renewcommand{\contentsname}{Mục lục}
\renewcommand{\listfigurename}{Danh sách hình}
\renewcommand{\listtablename}{Danh sách bảng}
\renewcommand{\appendixname}{Phụ lục}

% Dãn dòng 1.5
\RequirePackage{setspace}
\onehalfspacing

% Khoảng cách giữa đoạn văn 6pt
\RequirePackage{parskip}
\setlength{\parskip}{6pt}
\setlength{\parindent}{0.5cm}

% Thụt vào đầu dòng
\RequirePackage{indentfirst}

% Định nghĩa
\RequirePackage{amsthm}
\newtheoremstyle{break}
  {\topsep}{\topsep}%
  {\itshape}{}%
  {\bfseries}{}%
  {\newline}{}%

\theoremstyle{break}
\newtheorem{definition}{Định nghĩa}[section]

% Canh lề
\RequirePackage[
  top=35mm,
  bottom=30mm,
  left=35mm,
  right=20mm,
  includefoot]{geometry}

% Trang bìa
\RequirePackage{tikz}
\usetikzlibrary{calc}
\newcommand\HRule{\rule{\textwidth}{1pt}}
\RequirePackage{enumitem}

% Đổi lại tên list of tables, list of figures
\renewcommand{\listfigurename}{Danh mục các hình, biểu đồ}
\renewcommand{\listtablename}{Danh mục các bảng số liệu}

% Bảng từ viết tắt
\RequirePackage[acronym,toc]{glossaries}
\makenoidxglossaries
\loadglsentries{Thesis/Appendix/acronyms}

% Tài liệu tham khảo
\RequirePackage[
	sorting=nty,
	backend=bibtex,
	defernumbers=true]{biblatex}
\RequirePackage[unicode]{hyperref}
\addbibresource{Materials/References/references.bib}
\pdfstringdefDisableCommands{\let\MakeUppercase\relax}

% ========================================================================================= %
% Các định nghĩa thông tin (Metadata Setters & Getters)                                      %
% ========================================================================================= %

\newcommand{\setHoVaTen}[2]{%
  \newcommand{\tenSVTiengViet}{#1}%
  \newcommand{\tenSVTiengAnh}{#2}%
}
\newcommand{\setTenKL}[2]{%
  \newcommand{\tenKLTiengViet}{#1}%
  \newcommand{\tenKLTiengAnh}{#2}%
}
\newcommand{\setMaNganh}[1]{%
  \newcommand{\maNganh}{#1}%
}
\newcommand{\setTenNganh}[2]{%
  \newcommand{\tenNganhTiengViet}{#1}%
  \newcommand{\tenNganhTiengAnh}{#2}%
}
\newcommand{\setTenGVHD}[2]{%
  \newcommand{\tenGVHDTiengViet}{#1}%
  \newcommand{\tenGVHDTiengAnh}{#2}%
}
\newcommand{\setDiaChiNgayThang}[1]{%
  \newcommand{\diachiNgayThang}{#1}%
}
\newcommand{\setMSSV}[1]{%
  \newcommand{\mssv}{#1}%
}
\newcommand{\setKhoaDaoTao}[1]{%
  \newcommand{\khoaDaoTao}{#1}%
}
\newcommand{\setTenBM}[1]{%
  \newcommand{\tenBM}{#1}%
}
