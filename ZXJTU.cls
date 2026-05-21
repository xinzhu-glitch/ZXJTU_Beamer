\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ZXJTU}[2026/05/08 ZXJTU beamer class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass{beamer}

\RequirePackage{iftex}

\ifPDFTeX
  \RequirePackage[UTF8]{ctex}
\else
  \ifXeTeX
    \RequirePackage{fontspec}
    \RequirePackage{xeCJK}
    \setCJKmainfont[BoldFont=SimHei, ItalicFont=KaiTi]{SimSun}
    \setCJKsansfont{Microsoft YaHei}
    \setCJKmonofont{SimSun}
    \XeTeXlinebreaklocale "zh"
    \XeTeXlinebreakskip = 0pt plus 1pt
  \else
    \ClassError{ZXJTU}{Unsupported engine}{Use XeLaTeX or pdfLaTeX to compile this template.}
  \fi
\fi

\usefonttheme{serif}

\setbeamerfont{frametitle}{size=\large,series=\bfseries}
\renewcommand{\normalsize}{\fontsize{10}{12}\selectfont}
\setlength{\parskip}{0.5\baselineskip}

\RequirePackage{xcolor}
\RequirePackage{xparse}
\RequirePackage{keyval}
\definecolor{Myblue}{RGB}{57,108,144}
\definecolor{Default_Blue}{RGB}{52,51,171}
\definecolor{winered}{RGB}{140,30,30}
\definecolor{structurecolor}{RGB}{60,113,183}
\definecolor{main}{RGB}{60,113,183}
\definecolor{second}{RGB}{0,150,136}
\definecolor{third}{RGB}{156,39,176}
\definecolor{exampletitle}{RGB}{92,166,124}
\definecolor{examplebody}{RGB}{236,247,240}

\newcommand{\ziti}[2][1.2]{%
  \fontsize{#2}{#1\dimexpr#2pt\relax}\selectfont}
\newcommand{\xiaowu}{{\ziti{9}}}
\newcommand{\wuhao}{{\ziti{10.5}}}
\newcommand{\xiaosi}{{\ziti{12}}}
\newcommand{\sihao}{{\ziti{14}}}

\setbeamercolor{structure}{fg=structurecolor}
\setbeamercolor{block title}{fg=white, bg=main}
\setbeamercolor{block body}{fg=black, bg=main!10}
\setbeamercolor{block title example}{fg=white, bg=exampletitle}
\setbeamercolor{block body example}{fg=black, bg=examplebody}
\setbeamercolor{block title alerted}{fg=white, bg=red!60!black}
\setbeamercolor{block body alerted}{fg=black, bg=red!5}
\setbeamertemplate{theorems}[numbered]

\makeatletter
\newcounter{zxjtu@rgbblock}
\newcounter{zxjtu@titleframe}
\newif\ifZXJTU@usesizedblock
\setcounter{zxjtu@titleframe}{-1}

\define@key{ZXJTUblock}{width}{\def\ZXJTU@blockwidth{#1}}
\define@key{ZXJTUblock}{height}{\def\ZXJTU@blockheight{#1}}

\def\ZXJTU@blockwidth{}
\def\ZXJTU@blockheight{}

\newcommand{\ZXJTU@resetblocksize}{%
  \def\ZXJTU@blockwidth{}%
  \def\ZXJTU@blockheight{}%
  \ZXJTU@usesizedblockfalse
}

\newcommand{\ZXJTU@parseblocksize}[1]{%
  \ZXJTU@resetblocksize
  \setkeys{ZXJTUblock}{#1}%
  \ifx\ZXJTU@blockwidth\@empty
    \ifx\ZXJTU@blockheight\@empty
    \else
      \ZXJTU@usesizedblocktrue
    \fi
  \else
    \ZXJTU@usesizedblocktrue
  \fi
}

\newcommand{\ZXJTU@defineblockcolors}[4]{%
  \stepcounter{zxjtu@rgbblock}%
  \edef\ZXJTU@titlebg{zxjtu@titlebg@\arabic{zxjtu@rgbblock}}%
  \edef\ZXJTU@bodybg{zxjtu@bodybg@\arabic{zxjtu@rgbblock}}%
  \edef\ZXJTU@titlefg{zxjtu@titlefg@\arabic{zxjtu@rgbblock}}%
  \edef\ZXJTU@bodyfg{zxjtu@bodyfg@\arabic{zxjtu@rgbblock}}%
  \definecolor{\ZXJTU@titlebg}{RGB}{#1}%
  \definecolor{\ZXJTU@bodybg}{RGB}{#2}%
  \definecolor{\ZXJTU@titlefg}{RGB}{#3}%
  \definecolor{\ZXJTU@bodyfg}{RGB}{#4}%
}

\NewDocumentEnvironment{RGBblock}{O{} m +b}{%
  \begingroup
  \ZXJTU@parseblocksize{#1}%
  \setbeamercolor{block title}{fg=white, bg=Myblue}%
  \setbeamercolor{block body}{fg=black, bg=Myblue!10}%
  \ifZXJTU@usesizedblock
    \ifx\ZXJTU@blockwidth\@empty
      \def\ZXJTU@blockwidth{\linewidth}%
    \fi
    \begin{minipage}{\ZXJTU@blockwidth}%
      \begin{block}{#2}%
      \ifx\ZXJTU@blockheight\@empty
        #3
      \else
        \begin{minipage}[c][\ZXJTU@blockheight][c]{\linewidth}%
          #3
        \end{minipage}%
      \fi
      \end{block}%
    \end{minipage}%
  \else
    \begin{block}{#2}%
      #3
    \end{block}%
  \fi
  \endgroup
}

\newcommand{\DeclareCustomBlockRGB}[5]{%
  \expandafter\newenvironment\expandafter{#1}[1]{%
    \begingroup
    \ZXJTU@defineblockcolors{#2}{#3}{#4}{#5}%
    \setbeamercolor{block title}{fg=\ZXJTU@titlefg, bg=\ZXJTU@titlebg}%
    \setbeamercolor{block body}{fg=\ZXJTU@bodyfg, bg=\ZXJTU@bodybg}%
    \begin{block}{##1}%
  }{%
    \end{block}%
    \endgroup
  }%
}
\makeatother

\RequirePackage{mathtools, amsmath, amsfonts, amsthm, latexsym}
\RequirePackage{newtxtext,newtxmath}
\RequirePackage{caption}
\setbeamertemplate{caption}[numbered]
\captionsetup[figure]{font=small, labelfont=md}
\captionsetup[table]{font=small, labelfont=md}

\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{subfigure}
\RequirePackage{multirow}
\RequirePackage{array}
\RequirePackage{lscape}
\RequirePackage{enumerate}
\RequirePackage{tikz}
\RequirePackage{natbib}
\RequirePackage{comment}

\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}

\mode<presentation>{
\usetheme{Madrid}
\setbeamerfont{headline}{size=\scriptsize}
\setbeamerfont{footline}{size=\scriptsize}
\setbeamertemplate{navigation symbols}{}
\usecolortheme{default}
\setbeamercolor{structure}{fg=Myblue}
\setbeamercolor{alerted text}{fg=red}
\setbeamercolor{block title}{fg=white, bg=Myblue}
\setbeamercolor{block body}{fg=black, bg=Myblue!10}
\setbeamertemplate{itemize items}[circle]
\setbeamercolor{sidebar}{bg=Myblue}
\setbeamercolor{section in sidebar}{fg=Myblue, bg=white}
\setbeamercolor{section in sidebar shaded}{fg=white, bg=Myblue}
\setbeamerfont{section in sidebar}{size=\scriptsize, series=\bfseries}
\setbeamerfont{sidebar title}{size=\small, series=\bfseries}
\setbeamercolor{section in toc}{fg=Myblue,bg=white}
\setbeamercolor{section in toc shaded}{fg=white,bg=Myblue}
\setbeamerfont{section in toc}{size=\scriptsize,series=\bfseries}
\setbeamertemplate{section in toc}{%
  \vskip0.35ex%
  \hspace*{0.12cm}%
  \begin{beamercolorbox}[wd=1.95cm,sep=1.4pt,rounded=true]{section in toc}%
    \raggedright\usebeamerfont{section in toc}\inserttocsection%
  \end{beamercolorbox}%
}
\setbeamertemplate{section in toc shaded}{%
  \vskip0.35ex%
  \hspace*{0.12cm}%
  \begin{beamercolorbox}[wd=1.95cm,sep=1.4pt]{section in toc shaded}%
    \raggedright\usebeamerfont{section in toc}\inserttocsection%
  \end{beamercolorbox}%
}
\setbeamersize{sidebar width left=2.35cm, text margin left=0.45cm, text margin right=0.6cm}
\setbeamertemplate{sidebar left}{%
  \ifnum\value{framenumber}>0\relax
    \ifnum\value{framenumber}>\value{zxjtu@titleframe}\relax
      \begin{tikzpicture}[remember picture,overlay]
        \draw[white,line width=0.45pt]
          ([xshift=2.35cm]current page.south west) -- ([xshift=2.35cm]current page.north west);
      \end{tikzpicture}%
      \vspace*{0.48cm}%
      {\color{white}\usebeamerfont{sidebar title}%
        \vbox to 0.52cm{\vspace{0.5cm}\hbox to 2.35cm{\hfil \Large Contents\hfil}\vfil}\par}%
      \vspace*{0.12cm}%
      {\hspace*{0.18cm}\color{white}\rule{1.95cm}{0.5pt}\par}
      \vspace*{0.35cm}%
      \tableofcontents[hideallsubsections,sectionstyle=show/shaded]%
      \vfill
      {\hspace*{0.2cm}\color{white}\rule{1.9cm}{0.5pt}\par}
      \vspace*{0.35cm}%
    \fi
  \fi
}
\special{papersize=\the\paperwidth,\the\paperheight}
\providecommand{\tabularnewline}{\\}
}

\makeatletter
\setbeamertemplate{title page}{%
  \setcounter{zxjtu@titleframe}{\value{framenumber}}%
  \begin{tikzpicture}[remember picture,overlay]
    \fill[white] (current page.south west) rectangle (current page.north east);
    \node[anchor=center] at ([yshift=0.85cm]current page.center) {%
      \begin{beamercolorbox}[wd=0.8\paperwidth,sep=12pt,center,rounded=true,shadow=true]{title}%
        {\usebeamerfont{title}\inserttitle\par}%
        \vspace{0.5cm}%title 和 subtitle 之间的竖向间距
        {\usebeamerfont{subtitle}\insertsubtitle\par}%
      \end{beamercolorbox}%
    };
    \node[anchor=center] at ([yshift=-1.6cm]current page.center) {\usebeamerfont{author}\insertauthor};
    \node[anchor=center] at ([yshift=-3cm]current page.center) {\usebeamerfont{date}\insertdate};
  \end{tikzpicture}%
}
\makeatother

\endinput