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

\NewDocumentEnvironment{RGBblock}{m m m O{255,255,255} O{0,0,0}}{%
  \begingroup
  \ZXJTU@defineblockcolors{#2}{#3}{#4}{#5}%
  \setbeamercolor{block title}{fg=\ZXJTU@titlefg, bg=\ZXJTU@titlebg}%
  \setbeamercolor{block body}{fg=\ZXJTU@bodyfg, bg=\ZXJTU@bodybg}%
  \begin{block}{#1}%
}{%
  \end{block}%
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
\setbeamertemplate{itemize items}[triangle]
\setbeamersize{text margin left=0.6cm, text margin right=0.6cm}
\special{papersize=\the\paperwidth,\the\paperheight}
\providecommand{\tabularnewline}{\\}
}

\endinput