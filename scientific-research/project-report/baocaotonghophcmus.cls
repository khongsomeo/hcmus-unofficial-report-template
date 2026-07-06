\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{baocaotonghophcmus}[2026/07/01 Custom HCMUS Scientific Report Class]

% --- Default Option Values ---
\newcommand{\DraftMode}{0} % Default is publish/print mode (0)

% --- Declare Class Options ---
\DeclareOption{review}{
  \renewcommand{\DraftMode}{1}
}
\DeclareOption{publish}{
  \renewcommand{\DraftMode}{0}
}
\DeclareOption{print}{
  \renewcommand{\DraftMode}{0}
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
\RequirePackage[top=2cm, bottom=2cm, left=3cm, right=2cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{tabularx}
\RequirePackage{longtable}
\RequirePackage{pdflscape}
\RequirePackage{fancyhdr}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{tikz}
\RequirePackage{calc}
\RequirePackage{xspace}
\RequirePackage{colortbl}
\RequirePackage{enumitem}
\RequirePackage{setspace}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{makecell}
\RequirePackage{threeparttable}
\RequirePackage{indentfirst}
\RequirePackage{titlesec}
\RequirePackage{hyperref}
\RequirePackage{siunitx}
\sisetup{group-separator={.}, group-minimum-digits=4, detect-all}

% --- Layout & Spacing Configuration ---
\setlength{\footskip}{\dimexpr 2cm - 0.5in \relax}
\setstretch{1.2}
\setlength{\parskip}{6pt}

\usetikzlibrary{calc}

\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}

\titlespacing*{\section}{0pt}{12pt plus 4pt minus 2pt}{12pt plus 2pt}
\titlespacing*{\subsection}{0pt}{10pt plus 3pt minus 2pt}{10pt plus 2pt}
\titlespacing*{\subsubsection}{0pt}{8pt plus 3pt minus 2pt}{8pt plus 2pt}

% --- Checkbox Helper Macros ---
\newcommand{\checkbox}{\mbox{$\square$}\xspace}
\newcommand{\checkedbox}{\mbox{\rlap{$\square$}\raisebox{0.15ex}{\hspace{0.18em}\scriptsize$\checkmark$}}\xspace}
\newcommand{\togglebox}[1]{\ifnum#1=1 \checkedbox\else\checkbox\fi}

% --- Headers & Footers Configuration ---
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[R]{\thepage}

% --- Section Numbering in Vietnamese Standards ---
\renewcommand{\thesection}{PHẦN \Roman{section}}
\renewcommand{\thesubsection}{\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}

\makeatletter
\renewcommand{\@seccntformat}[1]{\csname the#1\endcsname.\ }
\makeatother

% --- Spacing in Tables ---
\renewcommand{\arraystretch}{1.3}

% --- Conditional Draft/Publish Spacing & Index Rows ---
\ifnum\DraftMode=1
  \newcommand{\MemberIndexRow}{& \multicolumn{1}{c|}{\small (1)} & \multicolumn{1}{c|}{\small (2)} & \multicolumn{1}{c|}{\small (3)} & \multicolumn{1}{c|}{\small (4)} \\ \hline}
  \newcommand{\PubsIndexRow}{& \multicolumn{1}{c|}{\small (1)} & \multicolumn{1}{c|}{\small (2)} & \multicolumn{1}{c|}{\small (3)} & \multicolumn{1}{c|}{\small (4)} & \multicolumn{1}{c|}{\small (5)} & \multicolumn{1}{c|}{\small (6)} & \multicolumn{1}{c|}{\small (7)} & \multicolumn{1}{c|}{\small (8)} \\ \hline}
  \newcommand{\SHTTIndexRow}{& \multicolumn{1}{c|}{\small (1)} & \multicolumn{1}{c|}{\small (2)} & \multicolumn{1}{c|}{\small (3)} & \multicolumn{1}{c|}{\small (4)} \\ \hline}
\else
  \newcommand{\MemberIndexRow}{}
  \newcommand{\PubsIndexRow}{}
  \newcommand{\SHTTIndexRow}{}
\fi

% =========================================================================
% --- Team Member Registry Macros ---
% =========================================================================
\newcounter{membercount}
\newcommand{\MemberList}{}
\makeatletter
\newcommand{\AddMember}[4]{%
  \stepcounter{membercount}%
  \toks0={#1}\toks1={#2}\toks2={#3}\toks3={#4}%
  \edef\temprow{\themembercount & \the\toks0 & \the\toks1 & \the\toks2 & \the\toks3 \noexpand\\ \noexpand\hline}%
  \expandafter\g@addto@macro\expandafter\MemberList\expandafter{\temprow}%
}
\makeatother

% =========================================================================
% --- Publications List Registry Macros ---
% =========================================================================
\newcounter{countisi}
\newcounter{countintl}
\newcounter{countnat}
\newcounter{countconfintl}
\newcounter{countconfnat}
\newcounter{countbook}
\newcounter{countother}

\newcommand{\DanhSachCongBoI}{}
\newcommand{\DanhSachCongBoII}{}
\newcommand{\DanhSachCongBoIII}{}
\newcommand{\DanhSachCongBoIV}{}
\newcommand{\DanhSachCongBoV}{}
\newcommand{\DanhSachCongBoVI}{}
\newcommand{\DanhSachCongBoVII}{}

\makeatletter
\newcommand{\AddCongBoISI}[8]{%
  \stepcounter{countisi}%
  \toks0={#1}\toks1={#2}\toks2={#3}\toks3={#4}\toks4={#5}\toks5={#6}\toks6={#7}\toks7={#8}%
  \edef\temprow{1.\thecountisi & \the\toks0 & \the\toks1 & \the\toks2 & \the\toks3 & \the\toks4 & \the\toks5 & \the\toks6 & \the\toks7 \noexpand\\ \noexpand\hline}%
  \expandafter\g@addto@macro\expandafter\DanhSachCongBoI\expandafter{\temprow}%
}
\newcommand{\AddCongBoIntl}[8]{%
  \stepcounter{countintl}%
  \toks0={#1}\toks1={#2}\toks2={#3}\toks3={#4}\toks4={#5}\toks5={#6}\toks6={#7}\toks7={#8}%
  \edef\temprow{2.\thecountintl & \the\toks0 & \the\toks1 & \the\toks2 & \the\toks3 & \the\toks4 & \the\toks5 & \the\toks6 & \the\toks7 \noexpand\\ \noexpand\hline}%
  \expandafter\g@addto@macro\expandafter\DanhSachCongBoII\expandafter{\temprow}%
}
\newcommand{\AddCongBoNat}[8]{%
  \stepcounter{countnat}%
  \toks0={#1}\toks1={#2}\toks2={#3}\toks3={#4}\toks4={#5}\toks5={#6}\toks6={#7}\toks7={#8}%
  \edef\temprow{3.\thecountnat & \the\toks0 & \the\toks1 & \the\toks2 & \the\toks3 & \the\toks4 & \the\toks5 & \the\toks6 & \the\toks7 \noexpand\\ \noexpand\hline}%
  \expandafter\g@addto@macro\expandafter\DanhSachCongBoIII\expandafter{\temprow}%
}
\newcommand{\AddCongBoConfIntl}[8]{%
  \stepcounter{countconfintl}%
  \toks0={#1}\toks1={#2}\toks2={#3}\toks3={#4}\toks4={#5}\toks5={#6}\toks6={#7}\toks7={#8}%
  \edef\temprow{4.\thecountconfintl & \the\toks0 & \the\toks1 & \the\toks2 & \the\toks3 & \the\toks4 & \the\toks5 & \the\toks6 & \the\toks7 \noexpand\\ \noexpand\hline}%
  \expandafter\g@addto@macro\expandafter\DanhSachCongBoIV\expandafter{\temprow}%
}
\newcommand{\AddCongBoConfNat}[8]{%
  \stepcounter{countconfnat}%
  \toks0={#1}\toks1={#2}\toks2={#3}\toks3={#4}\toks4={#5}\toks5={#6}\toks6={#7}\toks7={#8}%
  \edef\temprow{5.\thecountconfnat & \the\toks0 & \the\toks1 & \the\toks2 & \the\toks3 & \the\toks4 & \the\toks5 & \the\toks6 & \the\toks7 \noexpand\\ \noexpand\hline}%
  \expandafter\g@addto@macro\expandafter\DanhSachCongBoV\expandafter{\temprow}%
}
\newcommand{\AddCongBoBook}[8]{%
  \stepcounter{countbook}%
  \toks0={#1}\toks1={#2}\toks2={#3}\toks3={#4}\toks4={#5}\toks5={#6}\toks6={#7}\toks7={#8}%
  \edef\temprow{6.\thecountbook & \the\toks0 & \the\toks1 & \the\toks2 & \the\toks3 & \the\toks4 & \the\toks5 & \the\toks6 & \the\toks7 \noexpand\\ \noexpand\hline}%
  \expandafter\g@addto@macro\expandafter\DanhSachCongBoVI\expandafter{\temprow}%
}
\newcommand{\AddCongBoOther}[8]{%
  \stepcounter{countother}%
  \toks0={#1}\toks1={#2}\toks2={#3}\toks3={#4}\toks4={#5}\toks5={#6}\toks6={#7}\toks7={#8}%
  \edef\temprow{7.\thecountother & \the\toks0 & \the\toks1 & \the\toks2 & \the\toks3 & \the\toks4 & \the\toks5 & \the\toks6 & \the\toks7 \noexpand\\ \noexpand\hline}%
  \expandafter\g@addto@macro\expandafter\DanhSachCongBoVII\expandafter{\temprow}%
}
\makeatother

% =========================================================================
% --- Intellectual Property (SHTT) Registry Macros ---
% =========================================================================
\newcounter{countshtti}
\newcounter{countshttii}
\newcounter{countshttiii}
\newcounter{countshttiv}
\newcounter{countshttv}

\newcommand{\DanhSachSHTTI}{}
\newcommand{\DanhSachSHTTII}{}
\newcommand{\DanhSachSHTTIII}{}
\newcommand{\DanhSachSHTTIV}{}
\newcommand{\DanhSachSHTTV}{}

\makeatletter
\newcommand{\AddSHTTForeign}[4]{%
  \stepcounter{countshtti}%
  \toks0={#1}\toks1={#2}\toks2={#3}\toks3={#4}%
  \edef\temprow{1.\thecountshtti & \the\toks0 & \the\toks1 & \the\toks2 & \the\toks3 \noexpand\\ \noexpand\hline}%
  \expandafter\g@addto@macro\expandafter\DanhSachSHTTI\expandafter{\temprow}%
}
\newcommand{\AddSHTTDomestic}[4]{%
  \stepcounter{countshttii}%
  \toks0={#1}\toks1={#2}\toks2={#3}\toks3={#4}%
  \edef\temprow{2.\thecountshttii & \the\toks0 & \the\toks1 & \the\toks2 & \the\toks3 \noexpand\\ \noexpand\hline}%
  \expandafter\g@addto@macro\expandafter\DanhSachSHTTII\expandafter{\temprow}%
}
\newcommand{\AddSHTTUtility}[4]{%
  \stepcounter{countshttiii}%
  \toks0={#1}\toks1={#2}\toks2={#3}\toks3={#4}%
  \edef\temprow{3.\thecountshttiii & \the\toks0 & \the\toks1 & \the\toks2 & \the\toks3 \noexpand\\ \noexpand\hline}%
  \expandafter\g@addto@macro\expandafter\DanhSachSHTTIII\expandafter{\temprow}%
}
\newcommand{\AddSHTTSoftware}[4]{%
  \stepcounter{countshttiv}%
  \toks0={#1}\toks1={#2}\toks2={#3}\toks3={#4}%
  \edef\temprow{4.\thecountshttiv & \the\toks0 & \the\toks1 & \the\toks2 & \the\toks3 \noexpand\\ \noexpand\hline}%
  \expandafter\g@addto@macro\expandafter\DanhSachSHTTIV\expandafter{\temprow}%
}
\newcommand{\AddSHTTOther}[4]{%
  \stepcounter{countshttv}%
  \toks0={#1}\toks1={#2}\toks2={#3}\toks3={#4}%
  \edef\temprow{5.\thecountshttv & \the\toks0 & \the\toks1 & \the\toks2 & \the\toks3 \noexpand\\ \noexpand\hline}%
  \expandafter\g@addto@macro\expandafter\DanhSachSHTTV\expandafter{\temprow}%
}
\makeatother

% =========================================================================
% --- Training Registry Macros ---
% =========================================================================
\newcounter{countphd}
\newcounter{countmaster}
\newcounter{countundergrad}

\newcommand{\DanhSachDaoTaoPHD}{}
\newcommand{\DanhSachDaoTaoMaster}{}
\newcommand{\DanhSachDaoTaoUndergrad}{}

\makeatletter
\newcommand{\AddDaoTaoPHD}[4]{%
  \stepcounter{countphd}%
  \toks0={#1}\toks1={#2}\toks2={#3}\toks3={#4}%
  \edef\temprow{\thecountphd & \the\toks0 & \the\toks1 & \the\toks2 & \the\toks3 \noexpand\\ \noexpand\hline}%
  \expandafter\g@addto@macro\expandafter\DanhSachDaoTaoPHD\expandafter{\temprow}%
}
\newcommand{\AddDaoTaoMaster}[4]{%
  \stepcounter{countmaster}%
  \toks0={#1}\toks1={#2}\toks2={#3}\toks3={#4}%
  \edef\temprow{\thecountmaster & \the\toks0 & \the\toks1 & \the\toks2 & \the\toks3 \noexpand\\ \noexpand\hline}%
  \expandafter\g@addto@macro\expandafter\DanhSachDaoTaoMaster\expandafter{\temprow}%
}
\newcommand{\AddDaoTaoUndergrad}[4]{%
  \stepcounter{countundergrad}%
  \toks0={#1}\toks1={#2}\toks2={#3}\toks3={#4}%
  \edef\temprow{\thecountundergrad & \the\toks0 & \the\toks1 & \the\toks2 & \the\toks3 \noexpand\\ \noexpand\hline}%
  \expandafter\g@addto@macro\expandafter\DanhSachDaoTaoUndergrad\expandafter{\temprow}%
}
\makeatother

% =========================================================================
% --- Table Auto-Padding Logic ---
% =========================================================================
\makeatletter
\newcommand{\FinalizeAll}{%
  % -- Công báo khoa học --
  \ifnum\value{countisi}=0
    \g@addto@macro\DanhSachCongBoI{1.1 & & & & & & & & \\ \hline 1.2 & & & & & & & & \\ \hline}%
  \else\ifnum\value{countisi}=1
    \g@addto@macro\DanhSachCongBoI{1.2 & & & & & & & & \\ \hline}%
  \fi\fi
  \ifnum\value{countintl}=0
    \g@addto@macro\DanhSachCongBoII{2.1 & & & & & & & & \\ \hline 2.2 & & & & & & & & \\ \hline}%
  \else\ifnum\value{countintl}=1
    \g@addto@macro\DanhSachCongBoII{2.2 & & & & & & & & \\ \hline}%
  \fi\fi
  \ifnum\value{countnat}=0
    \g@addto@macro\DanhSachCongBoIII{3.1 & & & & & & & & \\ \hline 3.2 & & & & & & & & \\ \hline}%
  \else\ifnum\value{countnat}=1
    \g@addto@macro\DanhSachCongBoIII{3.2 & & & & & & & & \\ \hline}%
  \fi\fi
  \ifnum\value{countconfintl}=0
    \g@addto@macro\DanhSachCongBoIV{4.1 & & & & & & & & \\ \hline 4.2 & & & & & & & & \\ \hline}%
  \else\ifnum\value{countconfintl}=1
    \g@addto@macro\DanhSachCongBoIV{4.2 & & & & & & & & \\ \hline}%
  \fi\fi
  \ifnum\value{countconfnat}=0
    \g@addto@macro\DanhSachCongBoV{5.1 & & & & & & & & \\ \hline 5.2 & & & & & & & & \\ \hline}%
  \else\ifnum\value{countconfnat}=1
    \g@addto@macro\DanhSachCongBoV{5.2 & & & & & & & & \\ \hline}%
  \fi\fi
  \ifnum\value{countbook}=0
    \g@addto@macro\DanhSachCongBoVI{6.1 & & & & & & & & \\ \hline 6.2 & & & & & & & & \\ \hline}%
  \else\ifnum\value{countbook}=1
    \g@addto@macro\DanhSachCongBoVI{6.2 & & & & & & & & \\ \hline}%
  \fi\fi
  \ifnum\value{countother}=0
    \g@addto@macro\DanhSachCongBoVII{7.1 & & & & & & & & \\ \hline 7.2 & & & & & & & & \\ \hline}%
  \else\ifnum\value{countother}=1
    \g@addto@macro\DanhSachCongBoVII{7.2 & & & & & & & & \\ \hline}%
  \fi\fi
  % -- Sở hữu trí tuệ --
  \ifnum\value{countshtti}=0
    \g@addto@macro\DanhSachSHTTI{1.1 & & & & \\ \hline 1.2 & & & & \\ \hline}%
  \else\ifnum\value{countshtti}=1
    \g@addto@macro\DanhSachSHTTI{1.2 & & & & \\ \hline}%
  \fi\fi
  \ifnum\value{countshttii}=0
    \g@addto@macro\DanhSachSHTTII{2.1 & & & & \\ \hline 2.2 & & & & \\ \hline}%
  \else\ifnum\value{countshttii}=1
    \g@addto@macro\DanhSachSHTTII{2.2 & & & & \\ \hline}%
  \fi\fi
  \ifnum\value{countshttiii}=0
    \g@addto@macro\DanhSachSHTTIII{3.1 & & & & \\ \hline 3.2 & & & & \\ \hline}%
  \else\ifnum\value{countshttiii}=1
    \g@addto@macro\DanhSachSHTTIII{3.2 & & & & \\ \hline}%
  \fi\fi
  \ifnum\value{countshttiv}=0
    \g@addto@macro\DanhSachSHTTIV{4.1 & & & & \\ \hline 4.2 & & & & \\ \hline}%
  \else\ifnum\value{countshttiv}=1
    \g@addto@macro\DanhSachSHTTIV{4.2 & & & & \\ \hline}%
  \fi\fi
  \ifnum\value{countshttv}=0
    \g@addto@macro\DanhSachSHTTV{5.1 & & & & \\ \hline 5.2 & & & & \\ \hline}%
  \else\ifnum\value{countshttv}=1
    \g@addto@macro\DanhSachSHTTV{5.2 & & & & \\ \hline}%
  \fi\fi
  % -- Kết quả đào tạo --
  \ifnum\value{countphd}=0
    \g@addto@macro\DanhSachDaoTaoPHD{1 & & & & \\ \hline 2 & & & & \\ \hline}%
  \else\ifnum\value{countphd}=1
    \g@addto@macro\DanhSachDaoTaoPHD{2 & & & & \\ \hline}%
  \fi\fi
  \ifnum\value{countmaster}=0
    \g@addto@macro\DanhSachDaoTaoMaster{1 & & & & \\ \hline 2 & & & & \\ \hline}%
  \else\ifnum\value{countmaster}=1
    \g@addto@macro\DanhSachDaoTaoMaster{2 & & & & \\ \hline}%
  \fi\fi
  \ifnum\value{countundergrad}=0
    \g@addto@macro\DanhSachDaoTaoUndergrad{1 & & & & \\ \hline 2 & & & & \\ \hline}%
  \else\ifnum\value{countundergrad}=1
    \g@addto@macro\DanhSachDaoTaoUndergrad{2 & & & & \\ \hline}%
  \fi\fi
}
\newcommand{\nobreakhline}{%
  \multispan{\LT@cols}\unskip\leaders\hrule\@height\arrayrulewidth\hfill\cr
  \noalign{\penalty10000}}

% --- Parameter Setters and Internal Storage ---
\newcommand{\BiaMoi}[1]{\gdef\@BiaMoi{#1}\gdef\BiaMoi{#1}}
\newcommand{\Tendetai}[1]{\gdef\@Tendetai{#1}\gdef\Tendetai{#1}}
\newcommand{\TendetaiTiengAnh}[1]{\gdef\@TendetaiTiengAnh{#1}\gdef\TendetaiTiengAnh{#1}}
\newcommand{\MasoDeTai}[1]{\gdef\@MasoDeTai{#1}\gdef\MasoDeTai{#1}}
\newcommand{\ChunhiemDeTai}[2]{%
  \gdef\@ChunhiemDeTaiHocVi{#1}%
  \gdef\@ChunhiemDeTaiTen{#2}%
  \gdef\@ChunhiemDeTai{\ifx\relax#1\relax\else#1 \fi#2}%
  \gdef\ChunhiemDeTai{\ifx\relax#1\relax\else#1 \fi#2}%
  \gdef\ChunhiemDeTaiTen{#2}%
  \gdef\ChunhiemDeTaiHocVi{#1}%
}
\newcommand{\DiaPhuongBaoCao}[1]{\gdef\@DiaPhuongBaoCao{#1}\gdef\DiaPhuongBaoCao{#1}}
\newcommand{\ThangNamBaoCao}[1]{%
  \ifx\relax#1\relax
    \gdef\@ThangNamBaoCao{tháng \ifnum\month<10 0\fi\number\month\ năm \number\year}%
    \gdef\ThangNamBaoCao{tháng \ifnum\month<10 0\fi\number\month\ năm \number\year}%
  \else
    \gdef\@ThangNamBaoCao{#1}%
    \gdef\ThangNamBaoCao{#1}%
  \fi
}

% Initialize placeholders/defaults
\gdef\@BiaMoi{1}
\gdef\@Tendetai{\dots}
\gdef\@TendetaiTiengAnh{\dots}
\gdef\@MasoDeTai{\dots}
\gdef\@ChunhiemDeTaiHocVi{}
\gdef\@ChunhiemDeTaiTen{\dots}
\gdef\@ChunhiemDeTai{\dots}
\gdef\ChunhiemDeTaiTen{\dots}
\gdef\ChunhiemDeTaiHocVi{}
\gdef\@DiaPhuongBaoCao{\dots}
\gdef\@ThangNamBaoCao{tháng \ifnum\month<10 0\fi\number\month\ năm \number\year}

% --- Title Page Command ---
\newcommand{\maketitlepage}{%
  \hypersetup{pageanchor=false}
  \begin{titlepage}
    \thispagestyle{empty}
    \begin{tikzpicture}[remember picture, overlay]
      \ifnum\@BiaMoi=1
        \draw[line width=0.5pt, black] 
          ($(current page.north west) + (3.0cm,-2.0cm)$) 
          rectangle 
          ($(current page.south east) + (-2.0cm,2.0cm)$);
        \draw[line width=0.5pt, black] 
          ($(current page.north west) + (3.05cm,-2.05cm)$) 
          rectangle 
          ($(current page.south east) + (-2.05cm,2.05cm)$);
      \else
        \draw[line width=0.5pt, blue!70!black] 
          ($(current page.north west) + (3.0cm,-2.0cm)$) 
          rectangle 
          ($(current page.south east) + (-2.0cm,2.0cm)$);
        \draw[line width=1.5pt, blue!70!black] 
          ($(current page.north west) + (3.12cm,-2.12cm)$) 
          rectangle 
          ($(current page.south east) + (-2.12cm,2.12cm)$);
      \fi
    \end{tikzpicture}
    
    \vspace*{-2.0cm}
    \hfill
    \ifnum\DraftMode=1
      \begin{tabular}{|c|}
        \hline
        Mẫu T-BCTH-22v1 \\
        \hline
      \end{tabular}
    \else
      \phantom{\begin{tabular}{|c|}
        \hline
        Mẫu T-BCTH-22v1 \\
        \hline
      \end{tabular}}
    \fi
    
    \ifnum\@BiaMoi=1
      \vspace{0.3cm}
    \else
      \vspace{1.5cm}
    \fi
    
    \begin{center}
      {\large ĐẠI HỌC QUỐC GIA TP. HỒ CHÍ MINH} \\
      {\large\bf TRƯỜNG ĐẠI HỌC KHOA HỌC TỰ NHIÊN} \\
      \ifnum\@BiaMoi=1
        \vspace{2.2cm}
      \else
        \vspace{0.8cm}
        \includegraphics[width=2.5cm]{img/hcmus-logo.png} \\
        \vspace{1.5cm}
      \fi
      {\Huge\bf BÁO CÁO TỔNG HỢP} \\
      \ifnum\@BiaMoi=1
        \vspace{0.25cm}
      \else
        \vspace{0.6cm}
      \fi
      {\Large\bf KẾT QUẢ THỰC HIỆN} \\
      {\Large\bf ĐỀ TÀI NGHIÊN CỨU KHOA HỌC VÀ CÔNG NGHỆ} \\
      {\Large\bf CẤP TRƯỜNG} \\
    \end{center}
    
    \ifnum\@BiaMoi=1
      \vspace{0.8cm}
      \begin{center}
        \begin{minipage}{\dimexpr\textwidth-2.0cm\relax}
          {\fontsize{14}{16}\selectfont
          \noindent \textbf{Tên đề tài:} \@Tendetai \par\vspace{0.5cm}
          \noindent \textbf{Tên tiếng Anh (nếu có):} \@TendetaiTiengAnh \par\vspace{1.0cm}
          
          \noindent \textbf{Chủ nhiệm đề tài:} \@ChunhiemDeTai \par\vspace{0.4cm}
          \noindent \textbf{Mã số đề tài:} \@MasoDeTai
          }
        \end{minipage}
      \end{center}
    \else
      \vspace{1.5cm}
      {\fontsize{14}{16}\selectfont
      \noindent \hspace*{0.5cm} \textbf{Tên đề tài:} \\
      \noindent \hspace*{1.77cm} \parbox[t]{\dimexpr\textwidth-2.27cm}{\bfseries\raggedright\MakeUppercase \@Tendetai} \\[0.4cm]
      \noindent \hspace*{0.5cm} \textbf{Tên tiếng Anh:} \\
      \noindent \hspace*{1.77cm} \parbox[t]{\dimexpr\textwidth-2.27cm}{\bfseries\raggedright \@TendetaiTiengAnh}
      
      \vspace{1.5cm}
      
      \noindent\hspace*{3.5cm}%
      \begin{tabular}{l}
        \textbf{Chủ nhiệm đề tài: \@ChunhiemDeTai} \\
        \textbf{Mã số đề tài: \@MasoDeTai}
      \end{tabular}
      }
    \fi
    
    \ifnum\@BiaMoi=1
      \vspace{\stretch{1.4}}
      \begin{center}
        \large\bf \@DiaPhuongBaoCao, \@ThangNamBaoCao
      \end{center}
      \vspace{\stretch{1.0}}
    \else
      \vfill
      \begin{center}
        \large\bf \@DiaPhuongBaoCao, \@ThangNamBaoCao
      \end{center}
    \fi
  \end{titlepage}
  \hypersetup{pageanchor=true}
  \newpage
  \setcounter{page}{1}
}

% --- Bibliography Command ---
\newcommand{\printreportbibliography}[1]{%
  \clearpage
  \phantomsection
  \addcontentsline{toc}{section}{Tài liệu tham khảo}%
  \renewcommand{\refname}{Tài liệu tham khảo}%
  \bibliographystyle{unsrt}%
  \bibliography{#1}%
}

% --- Signature Block Command ---
\newcommand{\makesignatureblock}{%
  \vspace{0.4cm}
  \hfill
  \begin{tabular}{c}
    \ifnum\DraftMode=1
      \textit{\@DiaPhuongBaoCao, ngày ............ tháng ............ năm ............} \\
    \else
      \textit{\@DiaPhuongBaoCao, ngày \ifnum\day<10 0\fi\number\day\ tháng \ifnum\month<10 0\fi\number\month\ năm \number\year} \\
    \fi
    \textbf{Chủ nhiệm đề tài} \\
    \\
    \\
    \\
    \textbf{\@ChunhiemDeTaiTen}
  \end{tabular}
}

% --- Budget Parameter Setters and Default Values ---
\newcommand{\SetKinhPhiNhanCong}[2]{\gdef\KPAppNC{#1}\gdef\KPActNC{#2}}
\newcommand{\SetKinhPhiVatLieu}[2]{\gdef\KPAppVL{#1}\gdef\KPActVL{#2}}
\newcommand{\SetKinhPhiThietBi}[2]{\gdef\KPAppTB{#1}\gdef\KPActTB{#2}}
\newcommand{\SetKinhPhiDiLai}[2]{\gdef\KPAppDL{#1}\gdef\KPActDL{#2}}
\newcommand{\SetKinhPhiThueNgoai}[2]{\gdef\KPAppTN{#1}\gdef\KPActTN{#2}}
\newcommand{\SetKinhPhiTrucTiepKhac}[2]{\gdef\KPAppTTK{#1}\gdef\KPActTTK{#2}}
\newcommand{\SetKinhPhiQuanLy}[3]{\gdef\KPAppQL{#1}\gdef\KPActQL{#2}\gdef\KPNoteQL{#3}}
\newcommand{\SetKinhPhiHoiDong}[3]{\gdef\KPAppHD{#1}\gdef\KPActHD{#2}\gdef\KPNoteHD{#3}}

% Initialize defaults
\SetKinhPhiNhanCong{0}{0}
\SetKinhPhiVatLieu{0}{0}
\SetKinhPhiThietBi{0}{0}
\SetKinhPhiDiLai{0}{0}
\SetKinhPhiThueNgoai{0}{0}
\SetKinhPhiTrucTiepKhac{0}{0}
\SetKinhPhiQuanLy{0}{0}{}
\SetKinhPhiHoiDong{0}{0}{}

\newcommand{\makebudgettable}{%
  \noindent
  \begin{tabularx}{\linewidth}{|c|X|>{\raggedleft\arraybackslash}p{2.5cm}|>{\raggedleft\arraybackslash}p{2.5cm}|>{\raggedright\arraybackslash}p{3.4cm}|}
    \hline
    \textbf{STT} & 
    \multicolumn{1}{>{\centering\arraybackslash}X|}{\textbf{Nội dung chi}} & 
    \multicolumn{1}{>{\centering\arraybackslash}p{2.5cm}|}{\makecell{\textbf{Kinh phí}\\\textbf{được duyệt}\\\textbf{(đồng)}}} & 
    \multicolumn{1}{>{\centering\arraybackslash}p{2.5cm}|}{\makecell{\textbf{Kinh phí}\\\textbf{thực hiện}\\\textbf{(đồng)}}} & 
    \multicolumn{1}{>{\centering\arraybackslash}p{3.4cm}|}{\textbf{Ghi chú}} \\ \hline
    \textbf{A} & \textbf{Chi phí trực tiếp} & \textbf{\num{\number\numexpr \KPAppNC + \KPAppVL + \KPAppTB + \KPAppDL + \KPAppTN + \KPAppTTK \relax}} & \textbf{\num{\number\numexpr \KPActNC + \KPActVL + \KPActTB + \KPActDL + \KPActTN + \KPActTTK \relax}} & \\ \hline
    1 & Nhân công lao động khoa học & \num{\KPAppNC} & \num{\KPActNC} & \\ \hline
    2 & Nguyên, nhiên vật liệu & \num{\KPAppVL} & \num{\KPActVL} & \\ \hline
    3 & Thiết bị, dụng cụ & \num{\KPAppTB} & \num{\KPActTB} & \\ \hline
    4 & Đi lại, công tác phí & \num{\KPAppDL} & \num{\KPActDL} & \\ \hline
    5 & Dịch vụ thuê ngoài & \num{\KPAppTN} & \num{\KPActTN} & \\ \hline
    6 & Chi phí trực tiếp khác & \num{\KPAppTTK} & \num{\KPActTTK} & \\ \hline
    \textbf{B} & \textbf{Chi phí gián tiếp} & \textbf{\num{\number\numexpr \KPAppQL + \KPAppHD \relax}} & \textbf{\num{\number\numexpr \KPActQL + \KPActHD \relax}} & \\ \hline
    1 & Chi phí quản lý của tổ chức chủ trì & \num{\KPAppQL} & \num{\KPActQL} & \KPNoteQL \\ \hline
    2 & Chi phí thù lao hội đồng nghiệm thu đề tài & \num{\KPAppHD} & \num{\KPActHD} & \KPNoteHD \\ \hline
    & \textbf{Tổng số:} & \textbf{\num{\number\numexpr \KPAppNC + \KPAppVL + \KPAppTB + \KPAppDL + \KPAppTN + \KPAppTTK + \KPAppQL + \KPAppHD \relax}} & \textbf{\num{\number\numexpr \KPActNC + \KPActVL + \KPActTB + \KPActDL + \KPActTN + \KPActTTK + \KPActQL + \KPActHD \relax}} & \\ \hline
  \end{tabularx}%
}
\newcommand{\makegeneralinfosection}{%
  \section{THÔNG TIN CHUNG}

  \noindent\textbf{1. Tên đề tài:} \Tendetai \\
  \noindent\textbf{Tên tiếng Anh (nếu có):} \TendetaiTiengAnh

  \vspace{2pt}
  \noindent\textbf{2. Mã số:} \MasoDeTai

  \vspace{2pt}
  \noindent\textbf{3. Tổ chức chủ trì:} Trường Đại học Khoa học Tự nhiên, ĐHQG-HCM

  \vspace{2pt}
  \ifnum\DraftMode=1
    \noindent\textbf{4. Loại đề tài nghiên cứu:} \qquad \togglebox{\LoaiCoBan} Nghiên cứu cơ bản \qquad\qquad \togglebox{\LoaiUngDung} Nghiên cứu ứng dụng
  \else
    \noindent\textbf{4. Loại đề tài nghiên cứu:} \\
    \noindent\hspace*{0.5cm}\togglebox{\LoaiCoBan} Nghiên cứu cơ bản \qquad\qquad \togglebox{\LoaiUngDung} Nghiên cứu ứng dụng
  \fi

  \vspace{2pt}
  \noindent\textbf{5. Ngành/nhóm ngành/lĩnh vực:} \\[4pt]
  \nopagebreak
  \begingroup
  \renewcommand{\arraystretch}{0.95}
  \noindent
  \begin{tabularx}{\linewidth}{p{7.5cm} X}
    \togglebox{\NganhToan} Toán & \togglebox{\NganhVatlieu} Khoa học và Công nghệ Vật liệu \\
    \togglebox{\NganhVatly} Vật lý & \togglebox{\NganhNangluong} Năng lượng \\
    \togglebox{\NganhHoahoc} Hóa học và Công nghệ Hóa học & \togglebox{\NganhCokhi} Cơ khí, Tự động hóa, Kỹ thuật Giao thông \\
    \togglebox{\NganhSinhhoc} Sinh học và Công nghệ Sinh học & \togglebox{\NganhDientu} Điện -- Điện tử \\
    \togglebox{\NganhSuckhoe} Khoa học Sức khỏe & \togglebox{\NganhCNTT} Công nghệ Thông tin và Truyền thông \\
    \togglebox{\NganhTraidat} Khoa học Trái đất và Môi trường & \togglebox{\NganhKhac} Khác: \NganhKhacText
  \end{tabularx}
  \endgroup

  \vspace{2pt}
  \noindent\textbf{6. Danh sách chủ nhiệm, thành viên tham gia thực hiện đề tài} \\[4pt]
  \nopagebreak
  \noindent
  \begin{tabularx}{\linewidth}{|c|p{2cm}|X|X|p{3.5cm}|}
    \hline
    \textbf{TT} & 
    \multicolumn{1}{c|}{\textbf{Mã số}} & 
    \multicolumn{1}{c|}{\textbf{Họ và tên}} & 
    \multicolumn{1}{c|}{\textbf{Đơn vị công tác}} & 
    \multicolumn{1}{c|}{\textbf{Vai trò trong đề tài}} \\ \hline
    \MemberIndexRow
    \MemberList
  \end{tabularx}

  \ifnum\DraftMode=1
    \vspace{-0.45cm}
    \begingroup
    \singlespacing
    \noindent\textit{Ghi chú:} \\
    \noindent\hspace*{0.4cm} - \textit{Ở mục (1): ghi Mã số cán bộ, mã số sinh viên, mã số học viên... (nếu có).} \\
    \noindent\hspace*{0.4cm} - \textit{Ở mục (2): ghi cả học hàm, học vị (nếu có).} \\
    \noindent\hspace*{0.4cm} - \textit{Ở mục (4): chủ nhiệm, cố vấn, thư ký, thành viên chính, thành viên...}
    \endgroup
  \fi

  \vspace{2pt}
  \noindent\textbf{7. Thời gian thực hiện:} \\
  \noindent\hspace*{0.5cm}\textbf{Theo hợp đồng:} \ThoigianHopdong \\
  \noindent\hspace*{0.5cm}\textbf{Gia hạn (nếu có):} \ThoigianGiahan \\
  \noindent\hspace*{0.5cm}\textbf{Thực hiện thực tế:} \ThoigianThucte

  \vspace{2pt}
  \noindent\textbf{8. Tổng kinh phí được phê duyệt của đề tài:} \\
  \noindent\hspace*{0.5cm}\textbf{\KinhphiDuyet} triệu đồng \\
  \noindent\hspace*{0.5cm}(bằng chữ: \KinhphiBangchu\ triệu đồng)

  \newpage
}

\newcommand{\makepublicationsection}{%
  \begin{landscape}
  \section{KẾT QUẢ CÔNG BỐ, SỞ HỮU TRÍ TUỆ VÀ ĐÀO TẠO}

  \subsection{Kết quả công bố}
  \begingroup
  \setlength{\LTpre}{0pt}
  \setlength{\LTpost}{0pt}
  \renewcommand{\arraystretch}{1.0}
  \small
  \singlespacing
  \begin{longtable}{|>{\centering\arraybackslash}m{\dimexpr 1.2cm - 2\tabcolsep - \arrayrulewidth}|
                     m{\dimexpr 3.2cm - 2\tabcolsep - \arrayrulewidth}|
                     >{\centering\arraybackslash}m{\dimexpr 1.6cm - 2\tabcolsep - \arrayrulewidth}|
                     m{\dimexpr 4.5cm - 2\tabcolsep - \arrayrulewidth}|
                     m{\dimexpr 5.0cm - 2\tabcolsep - \arrayrulewidth}|
                     >{\centering\arraybackslash}m{\dimexpr 2.2cm - 2\tabcolsep - \arrayrulewidth}|
                     m{\dimexpr 2.5cm - 2\tabcolsep - \arrayrulewidth}|
                     m{\dimexpr 2.5cm - 2\tabcolsep - \arrayrulewidth}|
                     m{\dimexpr 2.5cm - 2\tabcolsep - \arrayrulewidth}|}
    \hline
    \textbf{\parbox{\dimexpr 1.2cm - 2\tabcolsep}{\centering STT}} & 
    \textbf{\parbox{\dimexpr 3.2cm - 2\tabcolsep}{\centering Tên các tác giả}} & 
    \textbf{\parbox{\dimexpr 1.6cm - 2\tabcolsep}{\centering Năm\\ công\\ bố}} & 
    \textbf{\parbox{\dimexpr 4.5cm - 2\tabcolsep}{\centering Tên công trình}} & 
    \textbf{\parbox{\dimexpr 5.0cm - 2\tabcolsep}{\centering Thông tin chi tiết\\ về công trình}} & 
    \textbf{\parbox{\dimexpr 2.2cm - 2\tabcolsep}{\centering Xếp hạng\\ tạp chí/\\ hội nghị}} & 
    \textbf{\parbox{\dimexpr 2.5cm - 2\tabcolsep}{\centering DOI}} & 
    \textbf{\parbox{\dimexpr 2.5cm - 2\tabcolsep}{\centering ISSN/ISBN}} & 
    \textbf{\parbox{\dimexpr 2.5cm - 2\tabcolsep}{\centering Tình trạng}} \\ \hline
    \PubsIndexRow
    \endhead

    \textbf{1} & \multicolumn{8}{l|}{\textbf{Công trình công bố trên tạp chí ISI/tạp chí quốc tế có uy tín}} \\* \nobreakhline
    \DanhSachCongBoI
    \textbf{2} & \multicolumn{8}{l|}{\textbf{Công trình công bố trên tạp chí quốc tế khác}} \\* \nobreakhline
    \DanhSachCongBoII
    \textbf{3} & \multicolumn{8}{l|}{\textbf{Công trình công bố trên tạp chí quốc gia có uy tín}} \\* \nobreakhline
    \DanhSachCongBoIII
    \textbf{4} & \multicolumn{8}{l|}{\textbf{Công bố đăng kỷ yếu hội nghị quốc tế}} \\* \nobreakhline
    \DanhSachCongBoIV
    \textbf{5} & \multicolumn{8}{l|}{\textbf{Công bố khoa học đăng kỷ yếu hội nghị quốc gia}} \\* \nobreakhline
    \DanhSachCongBoV
    \textbf{6} & \multicolumn{8}{l|}{\textbf{Sách chuyên khảo}} \\* \nobreakhline
    \DanhSachCongBoVI
    \textbf{7} & \multicolumn{8}{l|}{\textbf{Kết quả công bố khác (nếu có)}} \\* \nobreakhline
    \DanhSachCongBoVII
  \end{longtable}

  \ifnum\DraftMode=1
    \smallskip
    \noindent\textbf{Ghi chú:} \\
    \noindent\hspace*{0.4cm} - \textit{Đưa vào \textbf{Phụ lục sản phẩm} toàn văn các công bố trên tạp chí, hội nghị, sách chuyên khảo.} \\
    \noindent\hspace*{0.4cm} - \textit{Ở mục (4):} \\
    \noindent\hspace*{0.8cm} * \textit{Thông tin bài báo đăng trên tạp chí được ghi theo định dạng \textless tên tác giả, tên công trình, tên tạp chí, nhà xuất bản, số phát hành, trang đăng công trình, các thông tin khác -- nếu có\textgreater;} \\
    \noindent\hspace*{0.8cm} * \textit{Thông tin bài báo đăng tại hội nghị được ghi theo định dạng \textless tên tác giả, tên công trình, tên hội nghị, địa điểm tổ chức, thời điểm tổ chức hội nghị, nhà xuất bản (nếu có), trang đăng công trình, các thông tin khác -- nếu có\textgreater.} \\
    \noindent\hspace*{0.4cm} - \textit{Ở mục (5): vui lòng ghi rõ thông tin xếp hạng (nếu có)} \\
    \noindent\hspace*{0.8cm} * \textit{Tạp chí: Scopus, Q1/Q2/Q3/Q4, SCI/SCI-E/E-SCI/ISI, kèm theo Impact Factor (nếu có)} \\
    \noindent\hspace*{0.8cm} * \textit{Hội nghị: Scopus, xếp hạng theo CORE hay Qualis} \\
    \noindent\hspace*{0.4cm} - \textit{Ở mục (8): vui lòng ghi: đã xuất bản/chấp nhận đăng/đang phản biện...}
  \fi
  \endgroup
  \end{landscape}

  \newpage

  \subsection{Kết quả đăng ký sở hữu trí tuệ}
  \noindent
  \begin{tabularx}{\linewidth}{|c|X|X|X|p{2.5cm}|}
    \hline
    \textbf{STT} & 
    \multicolumn{1}{c|}{\textbf{Tên các tác giả}} & 
    \multicolumn{1}{c|}{\textbf{Tên công trình}} & 
    \multicolumn{1}{>{\centering\arraybackslash}X|}{\textbf{Nơi nhận hồ sơ/ cấp chứng nhận, số và ngày quyết định}} & 
    \multicolumn{1}{c|}{\textbf{Tình trạng}} \\ \hline
    \SHTTIndexRow
    \textbf{1} & \multicolumn{4}{l|}{\textbf{Bằng sáng chế ở nước ngoài}} \\ \hline
    \DanhSachSHTTI
    \textbf{2} & \multicolumn{4}{l|}{\textbf{Bằng sáng chế ở trong nước}} \\ \hline
    \DanhSachSHTTII
    \textbf{3} & \multicolumn{4}{l|}{\textbf{Giải pháp hữu ích}} \\ \hline
    \DanhSachSHTTIII
    \textbf{4} & \multicolumn{4}{l|}{\textbf{Bản quyền phần mềm}} \\ \hline
    \DanhSachSHTTIV
    \textbf{5} & \multicolumn{4}{l|}{\textbf{Các kết quả khác}} \\ \hline
    \DanhSachSHTTV
  \end{tabularx}

  \ifnum\DraftMode=1
    \smallskip
    \begingroup
    \singlespacing
    \noindent\textit{Ghi chú:} \\
    \noindent\hspace*{0.4cm} - \textit{Đưa vào \textbf{Phụ lục sản phẩm} bản scan bằng sáng chế, giải pháp hữu ích, bản quyền phần mềm... hoặc bản scan giấy chứng nhận hồ sơ được chấp nhận.} \\
    \noindent\hspace*{0.4cm} - \textit{(3) Nếu đã được chứng nhận, vui lòng ghi rõ số và ngày quyết định.} \\
    \noindent\hspace*{0.4cm} - \textit{(4) Tình trạng: chấp nhận đơn/đã được cấp}
    \endgroup
  \fi

  \subsection{Kết quả đào tạo}
  \noindent
  \begin{tabularx}{\linewidth}{|c|p{3.5cm}|p{3.5cm}|X|p{2cm}|}
    \hline
    \textbf{STT} & 
    \multicolumn{1}{>{\centering\arraybackslash}p{3.5cm}|}{\textbf{Họ và tên}} & 
    \multicolumn{1}{>{\centering\arraybackslash}p{3.5cm}|}{\makecell{\textbf{Thời gian}\\\textbf{tham gia đề tài}\\\textbf{(từ .../... đến .../...)}}} & 
    \multicolumn{1}{>{\centering\arraybackslash}X|}{\makecell{\textbf{Công trình công bố}\\\textbf{hoặc tên đề tài}\\\textbf{luận án / luận văn /}\\\textbf{khóa luận /}\\\textbf{đề tài tốt nghiệp}}} & 
    \multicolumn{1}{>{\centering\arraybackslash}p{2cm}|}{\textbf{Ghi chú}} \\ \hline
    \multicolumn{5}{|l|}{\textbf{Nghiên cứu sinh}} \\ \hline
    \DanhSachDaoTaoPHD
    \multicolumn{5}{|l|}{\textbf{Học viên cao học}} \\ \hline
    \DanhSachDaoTaoMaster
    \multicolumn{5}{|l|}{\textbf{Sinh viên đại học}} \\ \hline
    \DanhSachDaoTaoUndergrad
  \end{tabularx}

  \ifnum\DraftMode=1
    \smallskip
    \begingroup
    \singlespacing
    \noindent\textit{Ghi chú:} \\
    \noindent\hspace*{0.4cm} - \textit{Nếu người học tham gia đề tài và kết quả đề tài có trong nội dung luận án, luận văn, khóa luận hay đề tài tốt nghiệp của người học: đưa vào \textbf{Phụ lục sản phẩm} trang bìa luận án/luận văn/khóa luận/đề tài tốt nghiệp, cùng với bản scan bằng tốt nghiệp hoặc giấy chứng nhận người học đã bảo vệ thành công luận án/luận văn/khóa luận/đề tài tốt nghiệp.} \\
    \noindent\hspace*{0.4cm} - \textit{Nếu người học tham gia và đóng góp trong một công trình công bố hay sản phẩm sở hữu trí tuệ: trong \textbf{Phụ lục sản phẩm} cần đánh dấu và ghi rõ thông tin người học là tác giả, đồng tác giả của công trình công bố hay sản phẩm sở hữu trí tuệ nào.}
    \endgroup
  \fi

  \newpage
}

\newcommand{\makebudgetsection}{%
  \section{TÌNH HÌNH SỬ DỤNG KINH PHÍ}
  \makebudgettable
  \newpage
}

\makeatother

\AtBeginDocument{\FinalizeAll}
