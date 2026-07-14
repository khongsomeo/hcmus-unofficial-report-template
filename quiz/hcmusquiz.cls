\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hcmusquiz}[2026/07/14 Unofficial Quiz Class for HCMUS]
\PassOptionsToPackage{dvipsnames}{xcolor}

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
\RequirePackage{tikz}

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
  \vspace{.3cm}
  \noindent \textbf{Full name of Student:} \fillin[][8cm] \textbf{Student ID:} \fillin[][2.95cm]\par
  \ifnum\@canvietnamese=1
    \vspace{.3cm}
    \centerline{\textit{\underline{Note:} Students can answer the questions in English or Vietnamese.}}\par
    \vspace{.3cm}
  \else
    \vspace{.3cm}
  \fi
  \vspace{-\topsep}
  \vspace{-\partopsep}
}

% --- Circled correct choice label for answer key mode ---
\newcommand{\mcq@circledlabel}[1]{%
  \tikz[baseline=(char.base)]{%
    \node[shape=circle,draw,inner sep=0.8pt,minimum size=4.8mm,font=\footnotesize\bfseries,fill=red,text=white,draw=red] (char) {#1};%
  }%
}

\renewcommand{\choicelabel}{%
  \if@correctchoice
    \mcq@circledlabel{\Alph{choice}}%
  \else
    \thechoice.%
  \fi
}

% --- Equalize spacing between choices in oneparchoices ---
\renewenvironment{oneparchoices}%
  {%
    \if@filesw
      \immediate\write\@auxout{\string\global\string\@namedef{mcq@isquestion@\the\value{question}}{1}}%
    \fi
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
      \if@filesw
        \immediate\write\@auxout{\string\global\string\@namedef{correctans@\the\value{question}}{\Alph{choice}}}%
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

% --- Align choices indentation with oneparchoices first choice and track answers ---
\renewcommand{\choiceshook}{%
  \settowidth{\leftmargin}{A.\hskip\labelsep}%
  \labelwidth\leftmargin\advance\labelwidth-\labelsep
  \if@filesw
    \immediate\write\@auxout{\string\global\string\@namedef{mcq@isquestion@\the\value{question}}{1}}%
  \fi
  \let\old@CorrectChoice\CorrectChoice
  \def\CorrectChoice{%
    \old@CorrectChoice
    \if@filesw
      \immediate\write\@auxout{\string\global\string\@namedef{correctans@\the\value{question}}{\Alph{choice}}}%
    \fi
  }%
  \let\correctchoice\CorrectChoice
}

% --- MCQ Answer Box Feature ---
\newcount\mcq@i
\newcount\mcq@j
\newcount\mcq@col

\newcommand{\mcq@char}[1]{%
  \ifcase#1\or A\or B\or C\or D\or E\or F\or G\or H\fi
}

\newcommand{\NumChoices}[1]{\gdef\@numchoices{#1}}
\gdef\@numchoices{4}

\newcommand{\mcq@circledchar}[2][]{%
  \tikz[baseline=(char.base)]{%
    \node[shape=circle,draw,inner sep=1pt,minimum size=5.5mm,font=\small\bfseries,#1] (char) {#2};%
  }%
}

\newcommand{\mcq@renderchoice}[2]{%
  \edef\mcq@currentchar{\mcq@char{#2}}%
  \def\mcq@iscorrect{0}%
  \ifprintanswers
    \@ifundefined{correctans@#1}{}{%
      \expandafter\let\expandafter\mcq@temp\csname correctans@#1\endcsname
      \ifx\mcq@temp\mcq@currentchar
        \def\mcq@iscorrect{1}%
      \fi
    }%
  \fi
  \ifnum\mcq@iscorrect=1
    \mcq@circledchar[fill=red, text=white, draw=red]{\mcq@currentchar}%
  \else
    \mcq@circledchar{\mcq@currentchar}%
  \fi
}

\newcommand{\mcq@circle}{%
  \ifnum\numquestions>0\relax
    \begin{multicols}{2}
    \mcq@i=1
    \loop
    \ifnum\mcq@i>\numquestions\else
      \@ifundefined{mcq@isquestion@\the\mcq@i}{}{%
        \noindent\makebox[1.2cm][l]{\textbf{\the\mcq@i.}}%
        \makebox[4cm][l]{%
          \mcq@j=1
          \loop
          \ifnum\mcq@j>\@numchoices\else
            \ifnum\mcq@j>1\hfill\fi
            \mcq@renderchoice{\the\mcq@i}{\the\mcq@j}%
            \advance\mcq@j by 1
          \repeat
        }%
        \par\vspace{0.15cm}%
      }%
      \advance\mcq@i by 1
    \repeat
    \end{multicols}
  \fi
}

\newcommand{\mcq@rendertable}[1]{%
  \begin{tabularx}{\linewidth}{#1}
    \hline
    \mcq@tablebody
  \end{tabularx}%
}

\newcount\mcq@totmcq
\newcount\mcq@numcols
\newcount\mcq@rowcount

\newcommand{\MaxMCQPerRow}[1]{\gdef\@maxmcqperrow{#1}}
\gdef\@maxmcqperrow{10}

\newcommand{\mcq@appendtobody}{%
  \toks0=\expandafter{\mcq@currowone}%
  \toks1=\expandafter{\mcq@currowtwo}%
  \toks2=\expandafter{\mcq@tablebody}%
  \xdef\mcq@tablebody{%
    \the\toks2
    \the\toks0 \noexpand\\ \noexpand\hline
    \the\toks1 \noexpand\\ \noexpand\hline
  }%
}

\newcommand{\mcq@addtocurrowone}[1]{%
  \toks0=\expandafter{\mcq@currowone}%
  \ifnum\mcq@rowcount=0\relax
    \xdef\mcq@currowone{\the\toks0 \noexpand\textbf{#1}}%
  \else
    \xdef\mcq@currowone{\the\toks0 & \noexpand\textbf{#1}}%
  \fi
}

\newcommand{\mcq@addtocurrowtwo}[1]{%
  \toks0=\expandafter{\mcq@currowtwo}%
  \ifprintanswers
    \@ifundefined{correctans@#1}{%
      \def\mcq@ansval{}%
    }{%
      \expandafter\let\expandafter\mcq@letter\csname correctans@#1\endcsname
      \edef\mcq@ansval{\noexpand\textcolor{red}{\noexpand\textbf{\mcq@letter}}}%
    }%
  \else
    \def\mcq@ansval{}%
  \fi
  \toks1=\expandafter{\mcq@ansval}%
  \ifnum\mcq@rowcount=0\relax
    \xdef\mcq@currowtwo{\the\toks0 \the\toks1}%
  \else
    \xdef\mcq@currowtwo{\the\toks0 & \the\toks1}%
  \fi
}

\newcommand{\mcq@table}{%
  \ifnum\numquestions>0\relax
    \mcq@totmcq=0
    \mcq@col=1
    \loop
    \ifnum\mcq@col>\numquestions\else
      \@ifundefined{mcq@isquestion@\the\mcq@col}{}{%
        \advance\mcq@totmcq by 1
      }%
      \advance\mcq@col by 1
    \repeat
    \ifnum\mcq@totmcq>0\relax
      \mcq@numcols=\@maxmcqperrow
      \ifnum\mcq@totmcq<\mcq@numcols
        \mcq@numcols=\mcq@totmcq
      \fi
      \def\mcq@colspec{|}%
      \mcq@col=1
      \loop
      \ifnum\mcq@col>\mcq@numcols\else
        \expandafter\gdef\expandafter\mcq@colspec\expandafter{\mcq@colspec X|}%
        \advance\mcq@col by 1
      \repeat
      \def\mcq@tablebody{}%
      \def\mcq@currowone{}%
      \def\mcq@currowtwo{}%
      \mcq@col=1
      \mcq@rowcount=0
      \loop
      \ifnum\mcq@col>\numquestions\else
        \@ifundefined{mcq@isquestion@\the\mcq@col}{}{%
          \expandafter\mcq@addtocurrowone\expandafter{\the\mcq@col}%
          \expandafter\mcq@addtocurrowtwo\expandafter{\the\mcq@col}%
          \advance\mcq@rowcount by 1
          \ifnum\mcq@rowcount=\mcq@numcols\relax
            \mcq@appendtobody
            \def\mcq@currowone{}%
            \def\mcq@currowtwo{}%
            \mcq@rowcount=0
          \fi
        }%
        \advance\mcq@col by 1
      \repeat
      \ifnum\mcq@rowcount>0\relax
        \loop
        \ifnum\mcq@rowcount<\mcq@numcols
          \toks0=\expandafter{\mcq@currowone}%
          \xdef\mcq@currowone{\the\toks0 &}%
          \toks1=\expandafter{\mcq@currowtwo}%
          \xdef\mcq@currowtwo{\the\toks1 &}%
          \advance\mcq@rowcount by 1
        \repeat
        \mcq@appendtobody
      \fi
      \noindent
      \expandafter\mcq@rendertable\expandafter{\mcq@colspec}%
    \fi
  \fi
}

\newcommand{\MCQAnswerBox}[1]{%
  \def\mcq@arg{#1}%
  \def\mcq@circlekey{circle}%
  \def\mcq@fillkey{fill}%
  \ifx\mcq@arg\mcq@circlekey
    \mcq@circle
  \else
    \ifx\mcq@arg\mcq@fillkey
      \mcq@table
    \fi
  \fi
}

