\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{baocaosanpham}[2026/07/11 Báo cáo sản phẩm cá nhân đề tài NCKH]

% --- Load Base Class ---
\LoadClass[12pt,a4paper]{article}

% --- Load Required Packages ---
\RequirePackage[utf8]{inputenc}
\RequirePackage[utf8]{vietnam}
\RequirePackage{mathptmx} % Times New Roman font
\RequirePackage[top=2.54cm, bottom=2.54cm, left=2.54cm, right=2.54cm]{geometry} % 1 inch margins
\RequirePackage{setspace}
\RequirePackage{parskip}
\RequirePackage{xcolor}
\RequirePackage{colortbl}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{makecell}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{titlesec}
\RequirePackage{caption}
\RequirePackage{amsmath}
\RequirePackage{amssymb}

% --- Margins and Spacing ---
\setstretch{1.15} % 1.15 line spacing
\setlength{\parskip}{6pt} % Space after paragraph = 6pt
\setlength{\parindent}{0pt} % Zero paragraph indent

% --- Redefine Subsection and Subsubsection Numbering (Word style) ---
% Remove the section prefix (since section is unnumbered \section*)
\renewcommand{\thesubsection}{\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}

% --- Heading Styles (Word style) ---
\titleformat{\section}{\normalfont\fontsize{14}{17}\bfseries}{\thesection. }{0.5em}{}
\titlespacing*{\section}{0pt}{12pt}{6pt}

\titleformat{\subsection}{\normalfont\fontsize{13}{16}\bfseries}{\thesubsection. }{0.5em}{}
\titlespacing*{\subsection}{0pt}{12pt}{6pt}

\titleformat{\subsubsection}{\normalfont\fontsize{12}{15}\bfseries\itshape}{\thesubsubsection. }{0.5em}{}
\titlespacing*{\subsubsection}{0pt}{6pt}{6pt}

% --- Captions Styling ---
\captionsetup{font=small, labelfont=bf, labelsep=colon, justification=centering, margin=10pt}

% --- Meta Parameters ---
\newcommand{\TenDeTai}[1]{\gdef\@TenDeTai{#1}}
\newcommand{\MasoDeTai}[1]{\gdef\@MasoDeTai{#1}}
\newcommand{\HoTen}[1]{\gdef\@HoTen{#1}}
\newcommand{\VaiTro}[1]{\gdef\@VaiTro{#1}}
\newcommand{\HopDong}[1]{\gdef\@HopDong{#1}}

% Initialize placeholders
\gdef\@TenDeTai{\dots}
\gdef\@MasoDeTai{\dots}
\gdef\@HoTen{\dots}
\gdef\@VaiTro{\dots}
\gdef\@HopDong{\dots}

% --- Render Header ---
\newcommand{\makeheader}{%
  \begin{center}
    \fontsize{16}{20}\bfseries BÁO CÁO SẢN PHẨM \par
  \end{center}
  \vspace{0.4cm}
  
  \noindent
  \begin{tabular}{@{}l p{12cm}@{}}
    \textbf{Tên đề tài:} & \@TenDeTai \\
    \textbf{Mã số:} & \@MasoDeTai \\
    \textbf{Họ và tên:} & \@HoTen \\
    \textbf{Vai trò:} & \@VaiTro \\
  \end{tabular}
  \vspace{0.4cm}
}

% --- Part I: Tóm tắt kết quả ---
\newenvironment{tomtatketqua}{%
  \section*{PHẦN I. TÓM TẮT KẾT QUẢ}
  \ifx\@HopDong\empty\else
    \noindent\textbf{Nội dung công việc (theo hợp đồng \@HopDong):}
  \fi
}{%
  \vspace{0.4cm}
}

\newenvironment{tasks}{%
  \begin{enumerate}
}{%
  \end{enumerate}
}

\newcommand{\reportsanpham}[1]{%
  \vspace{0.3cm}
  \noindent\textbf{Báo cáo sản phẩm:}
  \begin{enumerate}
    #1
  \end{enumerate}
}

% --- Part II: Minh chứng sản phẩm ---
\newenvironment{minhchung}{%
  \section*{PHẦN II. MINH CHỨNG SẢN PHẨM}
}{%
}

% --- Table styling helper ---
\definecolor{tableheader}{RGB}{242,242,242}
\newcommand{\rowheader}{\rowcolor{tableheader}}
