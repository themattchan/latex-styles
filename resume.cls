%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template.
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
% Modified by Matthew Chan
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass{article}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions \relax

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array}            % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen}           % Required for ifthenelse statements

\pagestyle{empty}             % Suppress page numbers

%----------------------------------------------------------------------------------------
%   HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\LARGE}            % Size of the name at the top of the document
\def\addressskip{\smallskip}     % The space between the two address (or phone/email) lines
\def\sectionlineskip{\smallskip} % The space above the horizontal line for each section
\def\nameskip{\smallskip}        % The space after your name at the top
\def\sectionskip{\smallskip}     % The space after the heading section


\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {}               % Sets \@name to empty by default

\def \addressSep {$\bullet$} % Set default address separator to a round dot

% One, two or three address lines can be specified
\let \@addressone   \relax
\let \@addresstwo   \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
  \@ifundefined{@addresstwo}%
  {\def \@addresstwo {#1}}%
  {\@ifundefined{@addressthree}%
    {\def \@addressthree {#1}}%
    {\def \@addressone {#1}}}%
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
%  \addressskip
}

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
  \hfil { \namesize\bf \@name }
  \hfil \nameskip\break
  \endgroup
}

%----------------------------------------------------------------------------------------
%   PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}
{%
  \ori@document%
  \printname%
  \@ifundefined{@addressone}  {}{\printaddress{\@addressone}}%
  \@ifundefined{@addresstwo}  {}{\addressskip\printaddress{\@addresstwo}}%
  \@ifundefined{@addressthree}{}{\addressskip\printaddress{\@addressthree}}%
}

%----------------------------------------------------------------------------------------
%   SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]
{ % 1 input argument - section name
  \sectionskip
  {\bf #1} % Section title
  \sectionlineskip
  \hrule % Horizontal line
  \vspace{0.5em}
  \begin{list}{}{\leftmargin=1.5em} % List for each individual item in the section
    \itemsep -1em \vspace{-0.5em} % Compress items in list together for aesthetics
    \item[]
}
{%
  \end{list}
}

%----------------------------------------------------------------------------------------
%   WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

% 4 input arguments - title, year(s) employed, company name and location
\newenvironment{rItem}[4]
{%
  {\bf #1}%
  \ifthenelse{\equal{#3}{}} {} {, {#3}}%
  \ifthenelse{\equal{#4}{}} {} {, {#4}}%
  \hfill {#2}
}

\newenvironment{rSubsection}[4]
{%
  \begin{rItem} {#1}{#2}{#3}{#4} \end{rItem}\smallskip
  \begin{list}{$\cdot$}{\leftmargin=0em}
   \itemsep -0.5em \vspace{-0.5em}
}
{%
  \end{list}
  \vspace{0.5em}
}

% same as rSubsection, but no bullet list - just one \item for description
\newenvironment{rDescript}[4]
{%
  \begin{rItem} {#1}{#2}{#3}{#4} \end{rItem}\smallskip
  \begin{list}{}{\leftmargin=0em}
   \itemsep -0.5em \vspace{-0.5em}
}
{%
  \end{list}
%  \vspace{0.3em}
}
