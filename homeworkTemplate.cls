\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homeworkTemplate}[2021/03/02 Homework Template]

\LoadClass[letterpaper,12pt,oneside]{article}

\RequirePackage[left=1in,right=1in,top=1in,bottom=1.2in]{geometry}
\RequirePackage{xargs}
\RequirePackage{environ}
\RequirePackage{graphics}
\RequirePackage{amsmath}
\RequirePackage{bold-extra}
\RequirePackage{xcolor}
\RequirePackage{biblatex}
\RequirePackage{minted}

% ============= defining new commands ==============
\newcommand{\code}[1]{\colorbox{light-gray}{\texttt{#1}}}
\newcommand{\todo}[1]{\colorbox{light-gray}{\textcolor{red}{\bfseries{\scshape{TODO: #1}}}}}

\newcommand{\codefile}[2]{
  \inputminted[
    frame=lines,
    framesep=2mm,
    obeytabs=true,
    bgcolor=white,
    xleftmargin=15pt,
    numbersep=8pt,
    python3=true,
    fontsize=\footnotesize, linenos
  ]{#1}{#2}
}

% ===================================================



\setlength\parindent{0pt}

\def\nline{\bigskip}

\definecolor{light-gray}{gray}{0.95}




% ============== defining new environments ===================
% problem environments
\newcounter{partnum}
\newcounter{problemnum}
\setcounter{problemnum}{0}
\newenvironment{problem}[1][\unskip] {
    \setcounter{partnum}{0}\stepcounter{problemnum}
    \textbf{Problem \arabic{problemnum}. #1} \par}
  {\par}


% ppart environments
\newcommand\tabfill[1]{%
  \dimen@\linewidth
  \advance\dimen@\@totalleftmargin
  \advance\dimen@-\dimen\@curtab
  \parbox[t]\dimen@{#1\ifhmode\strut\fi}%
}

\setcounter{partnum}{0}
\newenvironmentx{pparthead}[2][1={\roman},2={},usedefault] {
    \stepcounter{partnum}
    \begin{tabbing}
        \hspace*{0.2cm} \= \hspace*{0.8cm} \=  \kill \\
        \> \textbf{#1{partnum})} \> \textbf{#2}
    \end{tabbing}
    \par
    \leftskip=1.3cm
    }
  {\par\smallskip}
  
\NewEnviron{ppart}[1][1={\roman},usedefault] {
    \stepcounter{partnum}
    \begin{tabbing}
        \hspace*{0.2cm} \= \hspace*{0.8cm} \=  \kill \\
        \> \textbf{#1{partnum})} \> \tabfill{ \BODY }
  \end{tabbing} \par\smallskip}

\newenvironmentx{ppart*} {
  \leftskip=1.3cm
  }
{\par\medskip}

% answer environments
\NewEnviron{answer}
{\framebox[\textwidth][l]{\parbox{0.98\textwidth}{\BODY}}\nline}

% ================================================================


% Defining headers
%% ===== Class paramters for use in header. ======
\RequirePackage{xkeyval}%

\def\doctitle{}%
\def\docauthor{U12635715 \\ Jiun-Yan (Eric) Chen}%
\def\doccollabs{None}%
\def\docclass{}%

\define@key{homeworkTemplate.cls}{title}[ ]{%
  \def\doctitle{#1}%
}

\define@key{homeworkTemplate.cls}{collaborators}[None]{%
  \def\doccollabs{#1}%
}

\define@key{homeworkTemplate.cls}{class}[ ]{%
  \def\docclass{#1}%
}

\ExecuteOptionsX{,title, class}
\ProcessOptionsX%

% =================================================

\RequirePackage{fancyhdr}
\renewcommand{\footrulewidth}{0.4pt}
\fancypagestyle{firstpage}
{
  \setlength{\headheight}{40pt}
  \lhead{\small \scshape{\docclass \\ Collaborators: \doccollabs}}
  \rhead{\small \scshape{\docauthor}}
  \chead{\large \bfseries{\scshape{\doctitle}} \\ }
  \setlength{\footskip}{11pt}
}
  

% defining document parms
\AtBeginDocument{%
  \thispagestyle{firstpage}
  \pagestyle{fancy}%
  \setlength{\headheight}{16pt}
}

\endinput