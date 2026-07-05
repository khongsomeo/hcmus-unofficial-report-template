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
	backend=biber,
	defernumbers=true]{biblatex}
\RequirePackage[unicode]{hyperref}
\addbibresource{Materials/References/references.bib}
\pdfstringdefDisableCommands{\let\MakeUppercase\relax}

\AtBeginDocument{
  \hypersetup{
      pdfauthor={\tenSVTiengViet},
      pdftitle={\tenKhongXuongDong{\tenKLTiengViet}},
  }
}

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
\newcommand{\dsGVHDTiengViet}{}
\newcommand{\dsGVHDTiengAnh}{}

\newcommand{\emptyval}{}

\newcommand{\tenGVHDTiengVietTruoc}{}
\newcommand{\tenGVHDTiengVietCuoi}{}
\newcommand{\tenGVHDTiengViet}{}

\newcommand{\tenGVHDTiengAnhTruoc}{}
\newcommand{\tenGVHDTiengAnhCuoi}{}
\newcommand{\tenGVHDTiengAnh}{}

\newcommand{\addTenGVHD}[2]{%
  \expandafter\gdef\expandafter\dsGVHDTiengViet\expandafter{\dsGVHDTiengViet \item #1}%
  \expandafter\gdef\expandafter\dsGVHDTiengAnh\expandafter{\dsGVHDTiengAnh \item #2}%
  \ifx\tenGVHDTiengVietCuoi\emptyval
    \gdef\tenGVHDTiengVietCuoi{#1}%
    \gdef\tenGVHDTiengViet{#1}%
  \else
    \ifx\tenGVHDTiengVietTruoc\emptyval
      \toks0=\expandafter{\tenGVHDTiengVietCuoi}%
      \xdef\tenGVHDTiengVietTruoc{\the\toks0}%
    \else
      \toks0=\expandafter{\tenGVHDTiengVietTruoc}%
      \toks1=\expandafter{\tenGVHDTiengVietCuoi}%
      \xdef\tenGVHDTiengVietTruoc{\the\toks0, \the\toks1}%
    \fi
    \gdef\tenGVHDTiengVietCuoi{#1}%
    \gdef\tenGVHDTiengViet{\tenGVHDTiengVietTruoc\ và \tenGVHDTiengVietCuoi}%
  \fi
  \ifx\tenGVHDTiengAnhCuoi\emptyval
    \gdef\tenGVHDTiengAnhCuoi{#2}%
    \gdef\tenGVHDTiengAnh{#2}%
  \else
    \ifx\tenGVHDTiengAnhTruoc\emptyval
      \toks0=\expandafter{\tenGVHDTiengAnhCuoi}%
      \xdef\tenGVHDTiengAnhTruoc{\the\toks0}%
    \else
      \toks0=\expandafter{\tenGVHDTiengAnhTruoc}%
      \toks1=\expandafter{\tenGVHDTiengAnhCuoi}%
      \xdef\tenGVHDTiengAnhTruoc{\the\toks0, \the\toks1}%
    \fi
    \gdef\tenGVHDTiengAnhCuoi{#2}%
    \gdef\tenGVHDTiengAnh{\tenGVHDTiengAnhTruoc\ and \tenGVHDTiengAnhCuoi}%
  \fi
}
\newcommand{\listSupervisors}{\tenGVHDTiengViet}
\newcommand{\listSupervisorsEnglish}{\tenGVHDTiengAnh}

\newcommand{\diachi}{Tp. Hồ Chí Minh}
\newcommand{\setDiaChi}[1]{%
  \renewcommand{\diachi}{#1}%
}
\newcommand{\diachiNgayThang}{\diachi\ --\ Năm\ \the\year}
\newcommand{\setMSSV}[1]{%
  \newcommand{\mssv}{#1}%
}
\newcommand{\setKhoaDaoTao}[1]{%
  \newcommand{\khoaDaoTao}{#1}%
}
\newcommand{\setTenBM}[1]{%
  \newcommand{\tenBM}{#1}%
}
\newcommand{\tenKhongXuongDong}[1]{{\renewcommand{\\}{ }#1}}


% ========================================================================================= %
% Lệnh dựng trang bìa và trang phụ bản đề tài                                               %
% ========================================================================================= %
\newcommand{\makethesiscover}{%
  \begin{titlepage}
  \thispagestyle{empty}
  \begin{center}
  \MakeUppercase{đại học quốc gia tp. hồ chí minh}\\
  \MakeUppercase{\bfseries trường đại học khoa học tự nhiên}\\[2cm]
  % \textbf{\MakeUppercase{khoa công nghệ thông tin}}\\[2cm]

  { \large \bfseries \MakeUppercase{\tenSVTiengViet}\\[2cm] } 

  % Đề tài luận văn thạc sĩ
  { \Large \bfseries \MakeUppercase{\tenKLTiengViet} \\[3cm]} 

  {\large\bfseries\MakeUppercase{luận văn thạc sĩ}}\\[2cm]

  \begin{tikzpicture}[remember picture, overlay]
    \draw[line width = 2pt] ($(current page.north west) + (3.25cm, -3.25cm)$) rectangle ($(current page.south east) + (-2.0cm, 3.0cm)$);
  \end{tikzpicture}

  \vfill
  \diachiNgayThang

  \end{center}

  \pagebreak
  \thispagestyle{empty}

  \begin{center}
  \MakeUppercase{đại học quốc gia tp. hồ chí minh}\\
  \MakeUppercase{\bfseries trường đại học khoa học tự nhiên}\\[2cm]
  % \textbf{\MakeUppercase{khoa công nghệ thông tin}}\\[2cm]

  {\large \bfseries \MakeUppercase{\tenSVTiengViet}\\[2cm]} 

  % Đề tài luận văn thạc sĩ
  { \Large \bfseries \MakeUppercase{\tenKLTiengViet} \\[2cm]}  

  \end{center}

  Ngành: \tenNganhTiengViet

  Mã số ngành: \maNganh \\[2cm]

  \textbf{\MakeUppercase{người hướng dẫn khoa học}}
  \begin{enumerate}[leftmargin=2.5cm]
      \dsGVHDTiengViet
  \end{enumerate}

  \begin{tikzpicture}[remember picture, overlay]
    \draw[line width = 2pt] ($(current page.north west) + (3.25cm, -3.25cm)$) rectangle ($(current page.south east) + (-2.0cm, 3.0cm)$);
  \end{tikzpicture}

  \vfill

  \begin{center}
  \diachiNgayThang
  \end{center}
  \end{titlepage}
}

% ========================================================================================= %
% Trang thông tin luận văn (Thesis Information Environments)                                 %
% ========================================================================================= %

\newenvironment{thesisinfo}{\par\setlength{\parindent}{0pt}}{\par}
\newcommand{\infoitem}[2]{#1: #2\\[0.25cm]}

% Môi trường trang thông tin luận văn Tiếng Việt
\newenvironment{trangthongtinluanvan}{%
  \chapter*{\vspace{-60pt}\centering\large\MakeUppercase{Trang thông tin luận văn}}
  \addcontentsline{toc}{chapter}{Trang thông tin luận văn}
  \vspace{-15pt}
  \begin{thesisinfo}
      \infoitem{Tên đề tài luận văn}{\tenKhongXuongDong{\tenKLTiengViet}}
      \infoitem{Ngành}{\tenNganhTiengViet}
      \infoitem{Mã số ngành}{\maNganh}
      \infoitem{Họ tên học viên cao học}{\tenSVTiengViet}
      \infoitem{Khóa đào tạo}{\khoaDaoTao}
      \infoitem{Người hướng dẫn khoa học}{\tenGVHDTiengViet}
      \infoitem{Cơ sở đào tạo}{Trường Đại học Khoa học Tự nhiên, ĐHQG-HCM}
  \end{thesisinfo}
  \vspace{-30pt}
}{%
  \vspace{0.5cm}%
  \begin{minipage}[h]{.50\textwidth}
      \centering
      \MakeUppercase{\bfseries tập thể cán bộ hướng dẫn}
  \end{minipage}
  \begin{minipage}[h]{.45\textwidth}
      \centering
      \MakeUppercase{\bfseries học viên cao học}
  \end{minipage}
  \vspace{3.5cm}
  \begin{center}
      \MakeUppercase{\bfseries xác nhận của cơ sở đào tạo\\hiệu trưởng}
  \end{center}
  \pagebreak
}

% Môi trường các phần nội dung Tiếng Việt
\newenvironment{tomtatvi}{%
  \section{\MakeUppercase{tóm tắt nội dung luận văn}}
}{}

\newenvironment{ketquamoivi}{%
  \section{\MakeUppercase{những kết quả mới của luận văn}}
}{}

\newenvironment{ungdungvi}{%
  \section{\MakeUppercase{khả năng ứng dụng trong thực tiễn và các vấn đề cần tiếp tục nghiên cứu}}
}{}

% Môi trường trang thông tin luận văn Tiếng Anh
\newenvironment{trangthesisinformation}{%
  \chapter*{\vspace{-60pt}\centering\large\MakeUppercase{thesis information}}
  \addcontentsline{toc}{chapter}{THESIS INFORMATION}
  \vspace{-15pt}
  \begin{thesisinfo}
      \infoitem{Thesis title}{\tenKhongXuongDong{\tenKLTiengAnh}}
      \infoitem{Speciality}{\tenNganhTiengAnh}
      \infoitem{Code}{\maNganh}
      \infoitem{Name of Master Student}{\tenSVTiengAnh}
      \infoitem{Academic year}{\khoaDaoTao}
      \infoitem{Supervisor}{\tenGVHDTiengAnh}
      \infoitem{At}{VNUHCM - University of Science}
  \end{thesisinfo}
  \vspace{-30pt}
  \setcounter{section}{0}
}{%
  \vspace{0.5cm}%
  \begin{minipage}[h]{.50\textwidth}
      \centering
      \MakeUppercase{\bfseries supervisor}
  \end{minipage}
  \begin{minipage}[h]{.45\textwidth}
      \centering
      {\bfseries Master \MakeUppercase{student}}
  \end{minipage}
  \vspace{3.5cm}
  \begin{center}
      \MakeUppercase{\bfseries certification \\ university of science \\ president}
  \end{center}
}

% Môi trường các phần nội dung Tiếng Anh
\newenvironment{summaryen}{%
  \section{\MakeUppercase{summary}}
}{}

\newenvironment{noveltyen}{%
  \section{\MakeUppercase{novelty of thesis}}
}{}

\newenvironment{applicationsen}{%
  \section{\MakeUppercase{applications/ applicability/ perspective}}
}{}

% ========================================================================================= %
% Helper Macros to Tidy Up main.tex                                                         %
% ========================================================================================= %

\newcommand{\inputreassurances}{%
  \input{Thesis/Appendix/reassurances}%
  \addcontentsline{toc}{chapter}{Lời cam đoan}%
}

\newcommand{\inputthanks}{%
  \input{Thesis/Appendix/thanks}%
  \addcontentsline{toc}{chapter}{Lời cảm ơn}%
}

\newcommand{\maketableofcontents}{%
  \tableofcontents%
  \addcontentsline{toc}{chapter}{Mục lục}%
}

\newcommand{\makelistoffigures}{%
  \listoffigures%
  \addcontentsline{toc}{chapter}{\listfigurename}%
}

\newcommand{\makelistoftables}{%
  \listoftables%
  \addcontentsline{toc}{chapter}{\listtablename}%
}

\newcommand{\makeglossaryofacronyms}{%
  \printnoidxglossary[type=\acronymtype, title=Danh~mục các ký~hiệu và từ~viết~tắt]%
}

\newcommand{\inputthesisinfo}{%
  \renewcommand{\thesection}{\arabic{section}}%
  \setcounter{section}{0}%
  \titleformat*{\section}{\large\bfseries}%
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}%
  \input{Thesis/Appendix/thongtinluanvan}%
  \clearpage%
  \renewcommand{\thesection}{\thechapter.\arabic{section}}%
  \titleformat*{\section}{\Large\bfseries}%
  \addtocontents{toc}{\protect\setcounter{tocdepth}{2}}%
}

\newcommand{\inputpublications}{%
  \input{Thesis/Appendix/publish}%
  \addcontentsline{toc}{chapter}{Danh mục công trình của tác giả}%
}

\newcommand{\printthesisbibliography}{%
  \printbibheading[title={Tài liệu tham khảo}]%
  \addcontentsline{toc}{chapter}{Tài liệu tham khảo}%
  \printbibliography[heading=subbibliography, title={Tiếng Việt}, keyword=Viet, resetnumbers=true]%
  \DeclareNameAlias{sortname}{family-given}%
  \DeclareNameAlias{default}{family-given}%
  \printbibliography[heading=subbibliography, title={Tiếng Anh}, notkeyword=Viet, resetnumbers=false]%
}

