\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hcmusexam}[2026/07/14 Unofficial Exam Class for HCMUS]

% --- Option Passing ---
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}
\ProcessOptions\relax

% --- Load Base Class ---
\LoadClass{exam}

% --- Load Required Packages ---
\RequirePackage[utf8]{inputenc}
\RequirePackage[utf8]{vietnam}
\RequirePackage{multicol}
\RequirePackage{listings}
\RequirePackage{tabularx}
\RequirePackage{graphicx}
\RequirePackage{enumitem}   
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{titlesec}
\RequirePackage{multirow}
\RequirePackage[fleqn]{amsmath}
\RequirePackage[left=1.5cm,right=1.5cm,top=2cm,bottom=2cm]{geometry}
\RequirePackage{lastpage}
\RequirePackage{upquote}
\RequirePackage{algpseudocode}
\RequirePackage{xspace}
\RequirePackage{refcount}

% --- Layout & Spacing ---
\linespread{1.2}
\renewcommand{\arraystretch}{1.5}
\titleformat{\subsection}[runin]
  {\normalfont\large\bfseries}{\thesubsection}{1em}{}
\titleformat{\subsubsection}[runin]
  {\normalfont\normalsize\bfseries}{\thesubsubsection}{1em}{}

% --- Code Listings Syntax Highlighting ---
\RequirePackage{color}
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}
\lstset{
   language=C++,
   breaklines=true,
   basicstyle={\ttfamily},
   stepnumber=1,
   numbers=left,
   numberstyle=\small,
   keywordstyle=\color{blue},
   commentstyle=\color{dkgreen},
   stringstyle=\color{mauve},
   showstringspaces=false
}

% --- Custom Header Helper Command ---
\def\headline#1{\hbox to \hsize{\hrulefill\quad\lower.3em\hbox{#1}\quad\hrulefill}}

% --- Hyperlinks Configuration ---
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=black,
    urlcolor=RoyalBlue,
    citecolor=TealBlue,
    filecolor=VioletRed
}

% --- Parameter Definitions ---
\newcommand{\ExamName}[1]{\gdef\@examname{#1}}
\newcommand{\ExamDate}[1]{\gdef\@examdate{#1}}
\newcommand{\CourseName}[1]{\gdef\@coursename{#1}}
\newcommand{\ClassName}[1]{\gdef\@classname{#1}}
\newcommand{\ExamTime}[1]{\gdef\@examtime{#1}}
\newcommand{\CanAnswerInVietnamese}{\gdef\@canvietnamese{1}}

% Initialize defaults
\gdef\@examname{\dots}
\gdef\@examdate{\dots}
\gdef\@coursename{\dots}
\gdef\@classname{\dots}
\gdef\@examtime{}
\gdef\@canvietnamese{0}

% --- Header & Footer Configuration ---
\headrule
\header{\textbf{\@examdate}}{\textbf{\@coursename}}{\textbf{\@classname}}
\footer{}{Page \thepage\ of \pageref{LastPage}}{\ifnum \thepage=\getpagerefnumber{LastPage} \else \textbf{GO TO NEXT PAGE}\fi}

% --- Exam Questions Styling ---
\renewcommand{\thequestion}{\bfseries\arabic{question}}
\renewcommand{\questionlabel}{\bfseries Question \thequestion.}

\SolutionEmphasis{\color{red}}
\CorrectChoiceEmphasis{\color{red}}

% --- Student Identity Header Box ---
\newcommand{\addnamebox}{%
  \large
  \centerline{\LARGE\textbf{\@examname\ifx\@examtime\empty\else\ (\@examtime)\fi}}
  \vspace{.25cm}
  \noindent \textbf{Full name of Student:} \fillin[][8cm] \textbf{Student ID:} \fillin[][2.95cm]\par
  \ifnum\@canvietnamese=1
    \vspace{.15cm}
    \centerline{\textit{\underline{Note:} Students can answer the questions in English or Vietnamese.}}\par
  \fi
  \vspace{-.15cm}
}

% --- Equalize spacing between choices in oneparchoices ---
\renewenvironment{oneparchoices}%
  {%
    \setcounter{choice}{0}%
    \def\choice{%
      \if@correctchoice \endgroup \fi
      \refstepcounter{choice}%
      \ifnum\value{choice}>1\relax
        \hfill
      \fi
      \choicelabel
      \questionobject@pluspagecheck
      \nobreak\enskip
    }% choice
    \def\CorrectChoice{%
      \if@correctchoice \endgroup \fi
      \refstepcounter{choice}%
      \ifprintanswers
        \begingroup \@correctchoicetrue 
        \CorrectChoice@Emphasis
      \fi
      \ifnum\value{choice}>1\relax
        \hfill
      \fi
      \choicelabel
      \questionobject@pluspagecheck
      \nobreak\enskip
    }% CorrectChoice
    \let\correctchoice\CorrectChoice
    \let\par\@empty
    \ifvmode\else\enskip\fi
    \ignorespaces
  }%
  {\if@correctchoice \endgroup \fi}

% --- Align choices indentation with oneparchoices first choice ---
\renewcommand{\choiceshook}{%
  \settowidth{\leftmargin}{A.\hskip\labelsep}%
  \labelwidth\leftmargin\advance\labelwidth-\labelsep
}

