%% $Header: https://projects.cs.ru.is/svn/template/tvd/techreport/rureport.cls 39 2015-01-19 16:44:54Z foley $
%% Reykjavik University Report Class file
%% Initial version by Joe Foley <foley@RU.IS>
%% Created on 2013-02-04
%% This code is distributed under the Perl Artistic License
%% http://language.per.com/misc/Artistic.html
%% Some code is derived from the template on stackoverfrow by Chris M. Hughes
%% http://tex.stackexchange.com/questions/158638/make-beamer-not-look-like-beamer

%% --------------- Identification ----------------------------
\ProvidesClass{rubeamer}[2019/09/18 Reykjavik University Presentation Template v1.0]
\NeedsTeXFormat{LaTeX2e}
\typeout{Author: Joseph T. Foley, foley AT ru DOT is}

%% ---------------- Initial Code -----------------------------
%% Critical packages are here that everything else depends upon
\RequirePackage{ifthen}
% This package allows you to create conditionals on booleans
\RequirePackage{ifdraft}
\newboolean{icelandic}

% Better handling of arguments, particularly for defaults
\RequirePackage{xargs}

%% ---------------- Declaration of Options--------------------
%% Remember that we have \AtEndOfClass{},\AtEndOfPackage{}
%%     \AtBeginDocument{}, \AtEndDocument{}
%% If you want execution conditional on file existence
%%     \IfFileExists{filename}{true}{false}
%%     \InputIfFileExists{filename}{true}{false}
%% For error beamering
%%     \ClassError{class-name}{error-text}{help-text}
%%     \PackageError{class-name}{error-text}{help-text}

%% When loading packages, use the \PassOptionsToPackage{option}{package}
%% This way if a package is loaded with options somewhere else, you don't get a clash

\DeclareOption{icelandic}{\setboolean{icelandic}{true}}% set Icelandic labels on figures, tables, etc.

%% suggested options to beamer:  handout, mathserif

%% now we pass the remaining unused options to our parent class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
%% ---------------- Execution of Options -----------------------------
\ProcessOptions \relax % this stops searching for a * in
                       % \ProcessOtions*

%% Alternative way to subclass.  Disable the other option processing
%% if you enable it.  This will dump all options onto the parent class
%\ProcessOptions\LoadClassWithOptions{article}
%% ---------------- Package Loading -----------------------------
\LoadClass{beamer}% our parent class.

%% ---------------- Internationalization -----------------------------
\@nameuse{RequirePackage}[english,german,icelandic]{babel}
%% Babel allows various automatic text to be in selected languages
%% But to use the options, you have to always load it, even for english
%% The languages must be specified in order.

%% We load german because it seems to be needed for the special Icelandic quotation marks.
%% Smart quotation marks
%% The \@nameuse magic is to prevent AUCTeX from using the semi-broken icelandic mode.
%% If you don't have a keyboard to type the Icelandic characters, there are macros:
%% "` or \glqq  (startquote)
%% "' or \grqq  (endquote)
%% \TH          Þ
%% \th          þ
%% \DH          Ð
%% \dh          ð
%% 

%% ---------------------Encoding ------------------------
%% Important:  imputenc must be after babel!
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}  % allows UTF encoding, needed for Icelandic characters

%% ------------------- More Internationalization After Encoding -----------------
\RequirePackage[autostyle,strict]{csquotes} 
%% http://mirrors.concertpass.com/tex-archive/macros/latex/contrib/csquotes/csquotes.pdf
%% You invoke with \enquote{} and \blockquote{}
%% csquotes must be loaded before babel for AUCTeX
%% autostyle: update style as language changes in document
%% strict: any warnings become errors
\DeclareQuoteAlias{german}{icelandic}
%% Unfortunately, csquotes does not understand Icelandic quotation marks
%%   so we must create an alias.  German is close enough.
% set language based upon the class setting
\newcommand{\resetlanguage}{%
  \ifthenelse{\boolean{icelandic}}%
  {\selectlanguage{icelandic}}%
  {\selectlanguage{english}}}%
%% For some reason if we reset here, it defaults to german.
%% Instead, we will put a BeginDocument hook.
\AtBeginDocument{\resetlanguage{}}





\usepackage[overlay,absolute]{textpos}
%% Sometimes we want to place text or graphics manually on the page
%% textpos allows us to do exactly that
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
%% But first we have to define the units of measure.
%\begin{textblock}{5}(7,4.5)
%\includegraphics[width=\textwidth]{graphicfilename}
%\end{textblock}

\RequirePackage{fancyhdr}
%% Nice options for tweaking the header and footer

\PassOptionsToPackage{final}{graphicx}
\RequirePackage{graphicx}
%% We give the "final" option so that it always includes graphics
%% Take out this option if you want draft mode to skip pics

\DeclareGraphicsExtensions{.pdf,.jpeg,.jpg,.png,.gif,.PDF,.JPEG,.JPG,.PNG,.GIF}
%% The extensions that it will search for as valid graphics files
%% We need To include the UPPERCASE versions For windows people

\PassOptionsToPackage{final}{pdfpages}
\RequirePackage{pdfpages}
%% The "pdfpages" package lets you include PDF documents into your
%% document but keeps the formatting consistent (headers, footers,
%% etc.)


\RequirePackage{pseudocode}


\PassOptionsToPackage{hyphens,spaces}{url}
\RequirePackage{url}
%% The url package typesets url's and unix file paths nicely when they
%% become long.  Warning: windows paths such as C:\window do not work!
%% You need another verbatim to make those typeset properly.

\RequirePackage{xspace}
%% The xspace package will try to figure out if you meant to have a
%% space after a new command if you don't give it any arguments (in
%% braces: {} ).  

%% Color is already included in the beemer class
%\RequirePackage{color}
\definecolor{rugray}{rgb}{0.2,0.2,0.2}
\definecolor{rured}{rgb}{0.84,0.10,0.13}
%% The "color" package allows us to set the color of text and other
%% objects in a document


% The old template uses san-serif, let's also do so 
\renewcommand{\familydefault}{\sfdefault}

%% ---------------- Main Code -----------------------------
%%  Remember that we can declar commands (to make fragile things safe)
%%  The * form is for ``short'' commands, not longer than a paragraph
%%       \DeclareRobustCommand{cmd}[num][default]{definition}
%%       \DeclareRobustCommand*{cmd}[num][default]{definition}
%%  For checking if commands are redefined
%%       \CheckCommand{cmd}[num][default]{definition}

% this is for the picture environment
\setlength{\unitlength}{1cm}


%% AMS is American Mathematics Society.  They have a bunch of nice
%% math fonts and symbols
\RequirePackage{amsfonts}
\RequirePackage{amsmath}

%% More math magic
%% Particularly \begin{Bmatrix*}[l] which left-justifies
\usepackage{mathtools}

% helpful for math typsetting
% http://www.math.uiuc.edu/~hildebr/tex/displays.html

%% ---------------Fonts-------------------------------%%
\usepackage{mathpazo}
\usepackage[scaled=.95]{helvet}% uncomment these if required
\usepackage{courier}

%% -------------- Beamer Settings --------------------%%
\usetheme{Boadilla}
\usecolortheme{seagull}%no highlight colors, just grey
%\usecolortheme{rose}%More colorful, but not RU colors
\usefonttheme{professionalfonts}

% standard enumeration
\setbeamertemplate{enumerate items}{(\arabic{enumi})}

% default itemize
\setbeamertemplate{itemize items}[circle]

% transparency
\setbeamercovered{transparent=15}

% for resuming lists across frames
\newcounter{savedenum}
\newcommand*{\saveenum}{\setcounter{savedenum}{\theenumi}}
\newcommand*{\resume}{\setcounter{enumi}{\thesavedenum}}

\setbeamertemplate{caption}[numbered]

% if you don't set this, then the numbers don't show up in the References
% when using beamer
\setbeamertemplate{bibliography item}[text]
%% suggestions from http://tex.stackexchange.com/questions/97615/article-style-bibliography-in-beamer-class
% If bibliography goes over one page
\setbeamertemplate{frametitle continuation}[from second]
% Set all bib colors to black
\setbeamercolor*{bibliography entry title}{fg=black}
\setbeamercolor*{bibliography entry author}{fg=black}
\setbeamercolor*{bibliography entry location}{fg=black}
\setbeamercolor*{bibliography entry note}{fg=black}
% and kill the abominable icon
%\setbeamertemplate{bibliography item}{}



% This magic allows you to use captions and crossreferences
% http://tex.stackexchange.com/questions/56136/image-caption-and-cross-referenceing-in-beamer-poster
\newenvironment<>{varblock}[2][\textwidth]{%
  \setlength{\textwidth}{#1}
  \begin{actionenv}#3%
    \def\insertblocktitle{ \centering#2\par}%
    \par%
    \usebeamertemplate{block begin}}
  {\par%
    \usebeamertemplate{block end}%
  \end{actionenv}}
\newcommand{\sqsi}[1]{[\si{#1}]}


%% Reykjavik University customizations
\RequirePackage{transparent}

\setbeamercolor*{palette secondary}{use=structure,fg=white,bg=red}

\newcommand{\formatemail}[1]{$<$\texttt{#1}$>$}
% This will load custom-beamer.sty with your custom macros and definitions if it exists
\IfFileExists{custom-beamer.sty}{\usepackage{custom-beamer}}{}


%%% Local Variables:
%%% mode: latex
%%% TeX-master: ru-presentation-template.tex
%%% End:
