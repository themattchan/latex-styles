\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{MattHomework}[2016/04/04 version 1.00 Homework Style]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions \relax

%% Load base
%% Pass all options to article
\LoadClassWithOptions{article}
%--------------------------------------------------------------------------------
% Titles etc
%--------------------------------------------------------------------------------
\let\@course\@empty
\let\@term\@empty
\newcommand{\course}[1]{\gdef\@course{#1}}
\newcommand{\term}[1]{\gdef\@term{#1}}

\renewcommand{\@maketitle}{%
  \@course, \@term \newline
  \@author \vspace{1em}
  \begin{center}
    {\Large \textbf \@title}
  \end{center}
}


%--------------------------------------------------------------------------------
% Requires
%--------------------------------------------------------------------------------
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8] {inputenc}
\RequirePackage[parfill]{parskip} % line break instead of indentation
\RequirePackage[margin=1in]{geometry}
\RequirePackage{float}  % use attribute [H] to force images to stay where they should be
\RequirePackage{secdot} % dot after section number
\RequirePackage{lmodern}
\RequirePackage{textcomp}
% Colors
\RequirePackage[usenames, dvipsnames]{xcolor}
\definecolor{MyPastelBlue}{rgb}{0,0.3,0.7}
\definecolor{MyPastelGreen}{rgb}{0.133,0.545,0.133}
\definecolor{MyPastelGold}{rgb}{0.75,0.49,0.07}

\RequirePackage{enumerate}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{hyperref}
\hypersetup{%
  colorlinks=true,
  linkcolor=MyPastelBlue,
%  urlcolor=MidnightBlue,
  citecolor=black,
  pdfborderstyle={/S/U/W 1}
}
\RequirePackage{tikz}
\RequirePackage{tabu}
\RequirePackage{multirow}
\RequirePackage{mdframed}

\RequirePackage{ulem}           % strikeouts etc

%--------------------------------------------------------------------------------
% Math
%--------------------------------------------------------------------------------
\RequirePackage{amssymb,amsmath}
\RequirePackage[]{units}        % includes nicefrac
\RequirePackage{mathtools}
\RequirePackage{empheq}
\RequirePackage[binary-units = true]{siunitx}            % scientific notation
\DeclarePairedDelimiter\ceil{\lceil}{\rceil}
\DeclarePairedDelimiter\floor{\lfloor}{\rfloor}
% TODO make this an option
%\renewcommand\qedsymbol{$\blacksquare$}

%--------------------------------------------------------------------------------
% Theorems
%--------------------------------------------------------------------------------
\RequirePackage{amsthm}
% bold title, italic text, extra space above and below;
\theoremstyle{plain}
\newtheorem{thm}{Theorem}[section]
\newtheorem{lem}[thm]{Lemma}
\newtheorem{prop}[thm]{Proposition}
\newtheorem*{cor}{Corollary}

% bold title, upright text, extra space above and below;
\theoremstyle{definition}
\newtheorem{defn}{Definition}[section]
\newtheorem{exmp}{Example}[section]
\newtheorem{xca}[exmp]{Exercise}

% italic title, upright text, no extra space above or below.
\theoremstyle{remark}
\newtheorem*{remark}{Remark}
\newtheorem*{claim}{Claim}
\newtheorem*{note}{Note}
\newtheorem{case}{Case}

%--------------------------------------------------------------------------------
% Code Highlights
%--------------------------------------------------------------------------------
\RequirePackage{listings}

\lstdefinestyle{MySimpleStyle}{
  basicstyle=\small\ttfamily,
  keywordstyle=\bf\ttfamily\color{MyPastelBlue},
  commentstyle=\footnotesize\color{MyPastelGreen},
  stringstyle={\color{MyPastelGold}},
  upquote=true,
  breaklines=true,
  breakatwhitespace=true
}

\lstdefinelanguage{Pseudo}{
  morekeywords=[1]{define, def, function, procedure, algorithm},
  morekeywords=[2]{for, from, do, if, then, else, return, set, all,
    each, while, until, yield, let, var, val, case, match, of},
  morecomment=[s]{(*}{*)},
  morecomment=[l]{--},
  alsodigit=!\$\%\&*+-./:<=>?@^_~,
  mathescape=true,
  columns=fullflexible,
  literate={
    {/=}{{$\neq\;$}}1
    {++}{{$+\!\!\!+$}}1
    {::}{{$:\!\!\!:\;\;$}}4
    {||}{{$\lor\;$}}1
    {\&\&}{{$\land\;$}}1
    {->}{{$\rightarrow\;$}}2 {>=}{{$\geq\;$}}2 {<-}{{$\leftarrow$}}2
    {<=}{{$\leq\;$}}2 {=>}{{$\Rightarrow$}}2
    {\ .\ }{{\ $\circ$\ }}3 {(.)}{{($\circ$)}}2
    {\\ }{{$\lambda$}}1
  }
}
\lstnewenvironment{code}[1][Pseudo]{\lstset{language={#1},style=MySimpleStyle}}{}
\lstnewenvironment{MyC}{\lstset{language={C},style=MySimpleStyle}}{}

%--------------------------------------------------------------------------------
% Tikz things
%--------------------------------------------------------------------------------

% nice circled text
\newcommand{\pgftextcircled}[1]{
    \setbox0=\hbox{#1}%
    \dimen0\wd0%
    \divide\dimen0 by 2%
    \begin{tikzpicture}[baseline=(a.base)]%
        \useasboundingbox (-\the\dimen0,0pt) rectangle (\the\dimen0,1pt);
        \node[circle,draw,outer sep=0pt,inner sep=0.1ex] (a) {#1};
    \end{tikzpicture}
}
\let\textcircled=\pgftextcircled
\let\textcc=\pgftextcircled

%--------------------------------------------------------------------------------
% TODO
%--------------------------------------------------------------------------------
\newcommand{\todo}{%
  \begin{mdframed}[linecolor=red, linewidth=3pt, userdefinedwidth=\textwidth]
    {\textbf{\texttt{\LARGE{\color{red} TODO TODO TODO}}}}
  \end{mdframed}
}

\newcommand{\fixme}{%
  \begin{mdframed}[linecolor=blue, linewidth=3pt, userdefinedwidth=\textwidth]
    {\textbf{\texttt{\LARGE{\color{blue} FIXME}}}}
  \end{mdframed}
}



\endinput