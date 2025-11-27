%
%  Copyright 2016-2025 Wen Wang <wangwen1192@outlook.com>
%
%  This work may be distributed and/or modified under the
%  conditions of the LaTeX Project Public License, either version 1.3
%  of this license or (at your option) any later version.
%  The latest version of this license is in
%    http://www.latex-project.org/lppl.txt
%  and version 1.3 or later is part of all distributions of LaTeX
%  version 2005/12/01 or later.
%
%  This work has the LPPL maintenance status `maintained'.
%
%  The Current Maintainer of this work is Wen Wang <wangwen1192@outlook.com>.
%
%  This work consists of the files thesis-uestc.cls, thesis-uestc.bst.
%


\ProvidesClass{thesis-uestc}

\LoadClass[12pt, openany, twoside]{book}

\RequirePackage{ifxetex}
\RequireXeTeX
\makeatletter

\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{graphicx}
\RequirePackage{caption}
\DeclareCaptionFont{thesis_caption_font}{\fontsize{10.5bp}{20bp}\selectfont}
\captionsetup{font=thesis_caption_font, labelsep=space, skip=6bp}

\RequirePackage{array}
\RequirePackage{booktabs}
\setlength{\heavyrulewidth}{1.5bp}
\setlength{\lightrulewidth}{0.75bp}
\setlength{\arrayrulewidth}{0.5bp}
\setlength{\cmidrulewidth}{0.5bp}

\RequirePackage{setspace}
\RequirePackage{multirow}
\RequirePackage[tbtags]{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{lmodern}
\RequirePackage[nopostdot]{glossaries}
\RequirePackage{mathspec}

\RequirePackage{xeCJK}
\RequirePackage{ifplatform}

% 页眉简化开关：启用后所有页面页眉都显示章节名，否则奇偶页不同
\newif\ifthesis@simplifyheader
\thesis@simplifyheaderfalse
\newcommand{\simplifyheader}{\thesis@simplifyheadertrue}

\ifwindows
  \setCJKmainfont[AutoFakeBold=true]{SimSun}
  \newCJKfontfamily{\heiti}{SimHei}
  \newfontfamily{\heiti@letter}{SimHei}
  \setallmainfonts{Times New Roman}
\else
\ifmacosx
  \setCJKmainfont[AutoFakeBold=true]{Songti SC}
  \newCJKfontfamily{\heiti}{STHeiti}
  \newfontfamily{\heiti@letter}{STHeiti}
  \setallmainfonts{Times New Roman}
\else
  \setCJKmainfont[Path=fonts/,AutoFakeBold=true]{simsun.ttc} % 宋体
  \newCJKfontfamily{\heiti}[Path=fonts/]{simhei.ttf} % 黑体
  \newfontfamily{\heiti@letter}[Path=fonts/]{simhei.ttf} % 黑体英文字体
  \setallmainfonts[
    Path=fonts/,
    BoldFont=timesbd.ttf,
    ItalicFont=timesi.ttf,
    BoldItalicFont=timesbi.ttf,
  ]{times.ttf} % 英文Times New Roman字体
\fi
\fi

\DeclareMathAlphabet{\mathbf}{\eu@enc}{\eu@mathrm}{\bfdefault}{it}
\DeclareMathAlphabet{\mathbd}{\eu@enc}{\eu@mathrm}{\bfdefault}{n}
\newcommand{\bm}{\mathbf}

\RequirePackage{zhnumber}
\RequirePackage{pifont}

\RequirePackage[hyphens]{xurl}
\RequirePackage[hyperfootnotes=false,
    bookmarksnumbered,
    bookmarksdepth=4
]{hyperref}
\hypersetup{
  colorlinks=true,
  citecolor=black,
  linkcolor=black,
  urlcolor=black
}

\RequirePackage{indentfirst}
%\RequirePackage{calc}
\RequirePackage{float}
\RequirePackage{fancyvrb}
\RequirePackage{fvextra}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{appendix}
\RequirePackage{cite}
\RequirePackage[normalem]{ulem}
\RequirePackage{enumitem}

\RequirePackage[algochapter, boxruled, linesnumbered]{algorithm2e}
\SetAlFnt{\fontsize{12bp}{20bp}\selectfont}

\RequirePackage{etoolbox}
\RequirePackage{xparse}
\RequirePackage{newfloat}
\RequirePackage[resetlabels]{multibib}
\RequirePackage[nottoc]{tocbibind}
\RequirePackage{everypage}
\RequirePackage{ifoddpage}
\RequirePackage{pdfpages}

\graphicspath{{./pic/}}

\RequirePackage[titles]{tocloft}
\RequirePackage[labelformat=simple]{subcaption}
\DeclareCaptionFont{subfigure_font}{\fontsize{10.5bp}{12.075bp}\selectfont}
\captionsetup[subfigure]{font=subfigure_font, belowskip=6bp, width=36bp}
\renewcommand{\thesubfigure}{(\alph{subfigure})}
\newcommand{\floatcontinue}{\end{figure}\clearpage\begin{figure}[tb]\ContinuedFloat}

\urlstyle{rm}
\raggedbottom

% \AtBeginDocument{\pretocmd{\ref}{~}{}{}\apptocmd{\ref}{}{}{}}

\newcommand{\thesistablelist}{
  \listoftables
}

\RequirePackage[a4paper,
  inner=3cm, outer=3cm, top=3cm, bottom=3cm,
  headsep=17bp, footskip=0.8cm, % 微调到和word规范打印的pdf效果一致
  bindingoffset=0cm]{geometry}

\setlength{\headheight}{15bp}

\pagestyle{fancy}
% Redefine \normalsize to strictly use 12bp font size and 20bp baseline skip
\renewcommand{\normalsize}{%
  \@setfontsize\normalsize{12bp}{20bp}%
  \abovedisplayskip 10bp \@plus 2bp \@minus 5bp
  \abovedisplayshortskip \z@ \@plus 3bp
  \belowdisplayshortskip 6bp \@plus 3bp \@minus 3bp
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI}
\normalsize
\setlength\parindent{24bp}
\titlespacing{\chapter}{0bp}{10bp}{20bp} % 注意，本来在word中段前24bp，段后18bp，但是由于latex页眉版心计算方式与word的差异（如headsep等差异），导致最后综合页边距、页眉、版心等因素，为了复刻word效果，这里设置为10bp，20bp
\titlespacing{\section}{0bp}{18bp}{6bp}
\titlespacing{\subsection}{0bp}{12bp}{6bp}
\titlespacing{\subsubsection}{0bp}{12bp}{6bp}

\renewcommand\thechapter{第\zhnumber{\arabic{chapter}}章}
\renewcommand\thesection{\arabic{chapter}.\arabic{section}}

\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}

%\captionsetup{format=hang}
%\captionsetup{width=\textwidth - 42bp}
\captionsetup{width=\textwidth - 96bp}
\captionsetup[figure]{aboveskip=6bp, belowskip=0bp}
\captionsetup[table]{aboveskip=9bp, belowskip=0bp}

\setlength{\intextsep}{9bp}

\AtBeginEnvironment{figure}{%
  \def\@floatboxreset{\centering}%
}

\AtBeginEnvironment{table}{%
  \def\@floatboxreset{\centering}%
}

\AtBeginEnvironment{tabular}{\small}

\RequirePackage{tabularx}

% 【新增】针对自动换行表格
\AtBeginEnvironment{tabularx}{\small}

\newcommand{\chinesecolon}{\char"FF1A}
\newcommand{\chinesespace}{\char"3000}
\newcommand{\chineseperiod}{\char"3002}
\newcommand{\chinesequestion}{\char"FF1F}
\newcommand{\chineseexclamation}{\char"FF01}
\newcommand{\chinesecomma}{\char"FF0C}
\newcommand{\chinesesemicolon}{\char"FF1B}
\newcommand{\chineseleftparenthesis}{\char"FF08}
\newcommand{\chineserightparenthesis}{\char"FF09}

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}

\titleformat{\chapter}[block]
  {\centering\fontsize{15bp}{15bp}\selectfont\strong\thispagestyle{fancy}}{\thechapter}{7.5bp}{}

\titleformat{\section}[block]
  {\fontsize{14bp}{14bp}\selectfont\strong}
  {\bfseries\thesection}{7bp}{}

\titleformat{\subsection}[block]
  {\fontsize{14bp}{14bp}\selectfont\strong}
  {\bfseries\thesubsection}{7bp}{}

\titleformat{\subsubsection}[block]
  {\fontsize{12bp}{12bp}\selectfont\strong}
  {\bfseries\thesubsubsection}{6bp}{}

\RequirePackage[hang, perpage]{footmisc}
\addtolength{\footnotesep}{0bp}
\setlength{\footnotemargin}{13.5bp}

\renewcommand{\footnotesize}{\fontsize{9bp}{11.7bp}\selectfont}
\renewcommand{\small}{\fontsize{10.5bp}{13.65bp}\selectfont}
\renewcommand\footnotelayout{\fontsize{9bp}{11.7bp}\selectfont}

\renewcommand{\thefootnote}{\ifcase\value{footnote}\or\ding{172}\or
\ding{173}\or\ding{174}\or\ding{175}\or\ding{176}\or\ding{177}\or
\ding{178}\or\ding{179}\or\ding{180\or\ding{181}}\fi}

\renewcommand{\footnoterule}{\vfill\noindent\vspace{0.9mm}\hspace{27bp}\rule{5.05cm}{0.02cm}\vspace*{2.6bp}}

\def\@makefntext #1{
  \ifFN@hangfoot
      \bgroup \setbox \@tempboxa \hbox {
          \ifdim
        \footnotemargin >0bp \hb@xt@
                \footnotemargin {\hbox { \normalfont \@thefnmark}\hss }
            \else
              \hbox { \normalfont \@thefnmark}
      \fi
    }
        \leftmargin \wd \@tempboxa
        \rightmargin \z@ \linewidth \columnwidth
          \advance \linewidth -\leftmargin\parshape \@ne
    \leftmargin \linewidth \footnotesize \@setpar {{\@@par }}
    \leavevmode \llap {\box \@tempboxa }\parskip
        \hangfootparskip \relax \parindent
    \hangfootparindent \relax
        \else
          \parindent 1em \noindent
            \ifdim
                \footnotemargin >\z@ \hb@xt@
                \footnotemargin {\hss \hbox { \normalfont \@thefnmark} }
            \else
        \ifdim \footnotemargin =\z@
                    \llap {\hbox { \normalfont \@thefnmark} }
                \else
          \llap {\hb@xt@ -\footnotemargin {\hbox { \normalfont \@thefnmark} \hss }}
        \fi
            \fi
    \fi
        \footnotelayout #1\ifFN@hangfoot \par \egroup
  \fi
}

\newcounter{pseudopage}
\setcounter{pseudopage}{0}
\AddEverypageHook{\stepcounter{pseudopage}}

\newcommand\blankpage{%
  \newpage
  \null
  \thispagestyle{empty}%
  \addtocounter{pseudopage}{-1}%
  \newpage
}

\newenvironment{chineseabstract}{
  %\pagenumbering{Roman}
  \ifchinesebook{
    \pdfbookmark{中文摘要}{chineseabstract}
  }{
    \pdfbookmark{Chinese Abstract}{chineseabstract}
  }
  \setcounter{pseudopage}{1}
  \chapter*{\heiti 摘\chinesespace 要}
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5bp}{13.65bp}\selectfont 摘\enspace 要}
  \fancyfoot[CE,CO]{\fontsize{9bp}{10.35bp}\selectfont\Roman{pseudopage}}
}{
  \checkoddpage
  \ifoddpage
      \blankpage
    \else
      \newpage
    \fi
}

\newcommand{\chinesekeyword}[1]{
  \vspace{\baselineskip}
  \noindent
  \@hangfrom{\makebox[48bp][l]{\textbf{关键词\chinesecolon}}}#1
}

\newenvironment{englishabstract}{
  %\pagenumbering{Roman}
  \ifchinesebook{
    \pdfbookmark{英文摘要}{englishabstract}
  }{
    \pdfbookmark{English Abstract}{englishabstract}
  }
  \chapter*{\bfseries ABSTRACT}
    \fancyhf{}
    \fancyhead[C]{\fontsize{10.5bp}{13.65bp}\selectfont ABSTRACT}
    \fancyfoot[CE,CO]{\fontsize{9bp}{10.35bp}\selectfont\Roman{pseudopage}}
}{
  \checkoddpage
  \ifoddpage
      \blankpage
    \else
      \newpage
    \fi
}

\newcommand{\englishkeyword}[1]{
  \vspace{\baselineskip}
  \noindent
  \@hangfrom{\makebox[60bp][l]{\textbf{Keywords:}}}#1
}

\AddEverypageHook{\addtocontents{toc}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1bp}
}}

\AddEverypageHook{\addtocontents{lof}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1bp}
}}

\AddEverypageHook{\addtocontents{lot}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1bp}
}}

\tocloftpagestyle{fancy}
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand\cftchapleader{\cftdotfill{\cftdotsep}}

\renewcommand{\cftdotsep}{0.4}
\renewcommand{\headrulewidth}{0.75bp}

\setlength{\cftbeforetoctitleskip}{0bp}
\setlength{\cftaftertoctitleskip}{18bp}
\setlength{\cftbeforechapskip}{0bp}

\addtolength{\cftchapnumwidth}{25bp}

\cftsetindents{section}{21bp}{22bp}
\cftsetindents{subsection}{44bp}{31bp}
\cftsetindents{subsubsection}{76bp}{41bp}

\renewcommand{\cfttoctitlefont}{\fontsize{15bp}{15bp}\selectfont\strong}
\renewcommand\cftchapfont{\strong}

% \newcommand{\zh@thetitle}{\chinesespace}
% \newcommand{\zh@theauthor}{\chinesespace}
% \newcommand{\zh@thedate}{\chinesespace}
% \newcommand{\zh@theschool}{\chinesespace}
% \newcommand{\zh@themajor}{\chinesespace}
% \newcommand{\zh@theadvisor}{\chinesespace}
% 
% \newcommand{\en@thetitle}{\chinesespace}
% \newcommand{\en@theauthor}{\chinesespace}
% \newcommand{\en@thedate}{\chinesespace}
% \newcommand{\en@theschool}{\chinesespace}
% \newcommand{\en@themajor}{\chinesespace}
% \newcommand{\en@theadvisor}{\chinesespace}
% 
% \newcommand{\thestudentnumber}{\chinesespace}
% 
% \renewcommand{\title}[2]{
%   \renewcommand{\zh@thetitle}{#1}
%   \renewcommand{\en@thetitle}{#2}
% }
% 
% \renewcommand{\author}[2]{
%   \renewcommand{\zh@theauthor}{#1}
%   \renewcommand{\en@theauthor}{#2}
% }
% 
% \renewcommand{\date}[2]{
%   \renewcommand{\zh@thedate}{#1}
%   \renewcommand{\en@thedate}{#2}
% }
% 
% \newcommand{\major}[2]{
%   \renewcommand{\zh@themajor}{#1}
%   \renewcommand{\en@themajor}{#2}
% }
% 
% \newcommand{\school}[2]{
%   \renewcommand{\zh@theschool}{#1}
%   \renewcommand{\en@theschool}{#2}
% }
% 
% \newcommand{\advisor}[2]{
%   \renewcommand{\zh@theadvisor}{#1}
%   \renewcommand{\en@theadvisor}{#2}
% }
% 
% \newcommand{\studentnumber}[1]{
%   \renewcommand{\thestudentnumber}{#1}
% }
% 
% \newcommand{\thedateoral}{}
% \newcommand{\thedatesubmit}{}
% \newcommand{\thedateconfer}{年\chinesespace 月}
% 
% \newcommand{\setdate}[2][]{ 
% \ifthenelse{\equal{#1}{oral}}{
%   \renewcommand{\thedateoral}{#2}
% }{}
% \ifthenelse{\equal{#1}{submit}}{
%   \renewcommand{\thedatesubmit}{#2}
% }{}
% \ifthenelse{\equal{#1}{confer}}{
%   \renewcommand{\thedateconfer}{#2}
% }{}
% }

\renewcommand{\strong}{\heiti}
\DeclareOption{english} {
  \newcommand{\englishbook}{}
  \renewcommand{\thechapter}{Chapter \arabic{chapter}}
  \addtolength{\cftchapnumwidth}{12bp}
  \renewcommand{\strong}{\bfseries}
}

\newcommand{\ifchinesebook}[2]{
  \ifthenelse{\isundefined{\englishbook}}{#1}{#2}
}

\DeclareOption{bachelor}{
  \def\chinesedegreename{本科}
  \def\englishdegreename{Bachelor}
  \def\chinesebooktitle{学士学位论文}
  \def\englishbooktitle{Bachelor Thesis}
  \def\display@chineseheader{电子科技大学学士学位论文}
  \def\display@englishheader{Bachelor Thesis of University of
    Electronic Science and Technology of China}
}

\newcommand{\ifbachelor}[2]{
  \ifthenelse{\equal{\englishdegreename}{Bachelor}}{#1}{#2}
}

\DeclareOption{master}{
  \def\chinesedegreename{硕士}
  \def\englishdegreename{Master}
  \def\chinesebooktitle{硕士学位论文}
  \def\englishbooktitle{Master Thesis}
  \def\display@chineseheader{电子科技大学硕士学位论文}
  \def\display@englishheader{Master Thesis of University of
    Electronic Science and Technology of China}
}

\DeclareOption{promaster}{
  \def\chinesedegreename{专业硕士}
  \def\englishdegreename{Professional Master}
  \def\chinesebooktitle{专业学位硕士学位论文}
  \def\englishbooktitle{Master Thesis for Professional Degree}
  \def\display@chineseheader{电子科技大学硕士学位论文}
  \def\display@englishheader{Professional Master Thesis of University 
    of Electronic Science and Technology of China}
}

\DeclareOption{doctor}{
  \def\chinesedegreename{博士}
  \def\englishdegreename{Doctor}
  \def\chinesebooktitle{博士学位论文}
  \def\englishbooktitle{Doctoral Dissertation}
  \def\display@chineseheader{电子科技大学博士学位论文}
  \def\display@englishheader{Doctoral Dissertation of University of
    Electronic Science and Technology of China}
}

\DeclareOption{engdoctor}{
  \def\chinesedegreename{工程博士}
  \def\englishdegreename{Engineering Doctor}
  \def\chinesebooktitle{工程博士学位论文}
  \def\englishbooktitle{Engineering Doctoral Dissertation}
  \def\display@chineseheader{电子科技大学博士学位论文}
  \def\display@englishheader{Engineering Doctoral Dissertation of
    University of Electronic Science and Technology of China}
}

\ExecuteOptions{master}

\ProcessOptions\relax

\ifchinesebook{
  \renewcommand{\contentsname}{目\quad 录}
  \renewcommand{\bibname}{参考文献}
  \renewcommand{\figurename}{图}
  \renewcommand{\tablename}{表}
  \renewcommand{\listfigurename}{图目录}
  \renewcommand{\listtablename}{表目录}
}{}

\pretocmd{\listoffigures}{
    \newpage
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5bp}{13.65bp}\selectfont\listfigurename}
  \fancyfoot[CE,CO]{\fontsize{9bp}{10.35bp}\selectfont\Roman{pseudopage}}
  \ifchinesebook{
    \addtolength{\cftfignumwidth}{12bp}
    \renewcommand{\cftfigpresnum}{\figurename}
  }{
    \addtolength{\cftfignumwidth}{32bp}
    \renewcommand{\cftfigpresnum}{\figurename~}
  }
  \addtocontents{toc}{\protect\setcounter{tocdepth}{-1}}
}{}{}

\newcommand{\thesisfigurelist}{
  \listoffigures
}

\pretocmd{\listoftables}{
    \newpage
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5bp}{13.65bp}\selectfont\listtablename}
  \fancyfoot[CE,CO]{\fontsize{9bp}{10.35bp}\selectfont\Roman{pseudopage}}
  
  \ifchinesebook{
    \addtolength{\cfttabnumwidth}{12bp}
    \renewcommand{\cfttabpresnum}{\tablename}
  }{
    \addtolength{\cfttabnumwidth}{32bp}
    \renewcommand{\cfttabpresnum}{\tablename~}
  }
  \addtocontents{toc}{\protect\setcounter{tocdepth}{-1}}
}{}{}

\ifchinesebook{
  \SetAlgorithmName{算法}{算法}{算法列表}
}{
  \SetAlgorithmName{Algorithm}{Algorithm}{List of Algorithms}
}
\renewcommand\thealgocf{\arabic{chapter}-\arabic{algocf}}
\SetAlgoCaptionSeparator{\null}
\AtBeginEnvironment{algorithm}{\vspace{9bp}}
\AfterEndEnvironment{algorithm}{\vspace{9bp}}

\newfloat{thesiscodefloat}{htbp}{loc}[chapter]
\renewcommand{\thethesiscodefloat}{\arabic{chapter}-\arabic{thesiscodefloat}}
\newcommand{\thesiscodecaptionname}{代码}
\newcommand{\thesiscodelisttitle}{代码列表}
\ifchinesebook{
  \floatname{thesiscodefloat}{代码}
  \newcommand{\listofthesiscodes}{\listof{thesiscodefloat}{代码列表}}
}{
  \floatname{thesiscodefloat}{Code}
  \renewcommand{\thesiscodecaptionname}{Code}
  \renewcommand{\thesiscodelisttitle}{List of Codes}
  \newcommand{\listofthesiscodes}{\listof{thesiscodefloat}{List of Codes}}
}
\captionsetup[thesiscodefloat]{aboveskip=6bp, belowskip=0bp}

\newcommand{\thesiscode@numberfont}{\fontsize{8bp}{12bp}\selectfont\bfseries\rmfamily}
\newcommand{\thesiscodebasedir}{code/}
\newcommand{\thesiscode@set@numberfont}{%
  \renewcommand{\theFancyVerbLine}{\thesiscode@numberfont\arabic{FancyVerbLine}}%
}

\newcounter{thesiscode@algstore}
\newcommand{\thesiscode@addtolist}{%
  \addcontentsline{loc}{thesiscodefloat}{\protect\numberline{\thethesiscodefloat}\thesiscode@caption}%
}

\newcommand{\thesiscode@fontswitch}{\ttfamily}
\newcommand{\thesis@setcodefont}{%
  \def\thesiscode@fontswitch{\ttfamily}%
  \IfFileExists{fonts/consola.ttf}{
    \def\thesiscode@fontswitch{\fontspec[Path=fonts/]{consola.ttf}}%
  }{
    \IfFileExists{fonts/Consola.ttf}{
      \def\thesiscode@fontswitch{\fontspec[Path=fonts/]{Consola.ttf}}%
    }{
      \IfFontExistsTF{Consolas}{
        \def\thesiscode@fontswitch{\fontspec{Consolas}}%
      }{
        \PackageWarningNoLine{thesis-uestc}{Consolas font not found. Falling back to monospaced default.}%
      }
    }
  }
}
\thesis@setcodefont
\newcommand{\thesiscodefont}{%
  \thesiscode@fontswitch
  \fontsize{10.5bp}{17.5bp}\selectfont} % 代码块的字体和行距更改处

\newcommand{\thesiscode@begin}[3]{%
  \def\thesiscode@caption{#2}%
  \def\thesiscode@label{#3}%
  \refstepcounter{thesiscodefloat}%
  \protected@edef\@currentlabel{\thethesiscodefloat}%
  \setcounter{thesiscode@algstore}{\value{algocf}}%
  \setcounter{algocf}{\value{thesiscodefloat}}%
  \addtocounter{algocf}{-1}%
  \let\thesiscode@oldthealgocf\thealgocf
  \renewcommand{\thealgocf}{\thethesiscodefloat}%
  \let\thesiscode@oldalgname\algorithmcfname
  \renewcommand{\algorithmcfname}{\thesiscodecaptionname}
  \thesis@setcodefont
  \LinesNotNumbered
  \begin{algorithm}[#1]
    \ifx\thesiscode@caption\@empty\else
      \caption{\thesiscode@caption}
      \ifx\thesiscode@label\@empty\else
        \label{\thesiscode@label}
      \fi
      \thesiscode@addtolist
    \fi
}

\newcommand{\thesiscode@end}{%
  \end{algorithm}
  \setcounter{algocf}{\value{thesiscode@algstore}}%
  \let\algorithmcfname\thesiscode@oldalgname
  \let\thealgocf\thesiscode@oldthealgocf
  \LinesNumbered
}

\NewDocumentEnvironment{thesiscode}{O{H} o o}{
  \VerbatimEnvironment
  \IfNoValueTF{#2}{\def\thesiscode@cap{}}{\def\thesiscode@cap{#2}}
  \IfNoValueTF{#3}{\def\thesiscode@lab{}}{\def\thesiscode@lab{#3}}
  \thesiscode@begin{#1}{\thesiscode@cap}{\thesiscode@lab}
  \thesiscode@set@numberfont
  \vspace{-2bp}
  \begin{Verbatim}[numbers=left,
    numberblanklines=true,
    numbersep=6bp,
    xleftmargin=0bp,
    stepnumber=1,
    breaklines=true,
    % breakanywhere=true,
    formatcom=\thesiscodefont]
}{
  \end{Verbatim}
  \vspace{-9bp}
  \thesiscode@end
}

\NewDocumentCommand{\thesiscodefile}{O{H} o o m}{
  \IfNoValueTF{#2}{\def\thesiscode@cap{}}{\def\thesiscode@cap{#2}}
  \IfNoValueTF{#3}{\def\thesiscode@lab{}}{\def\thesiscode@lab{#3}}
  \thesiscode@begin{#1}{\thesiscode@cap}{\thesiscode@lab}
  \thesiscode@set@numberfont
  \vspace{-2bp}
  \VerbatimInput[
    numbers=left,
    numberblanklines=true,
    numbersep=6bp,
    xleftmargin=0bp,
    stepnumber=1,
    breaklines=true,
    % breakanywhere=true,
    formatcom=\thesiscodefont]{\thesiscodebasedir#4}
  \vspace{-9bp}
  \thesiscode@end
}

%\renewcommand*{\glossarypreamble}{\vspace{-9bp}}
\newacronymstyle{acronym-uestc}{
  \ifglshaslong{\glslabel}{\glsgenacfmt}{\glsgenentryfmt}
}{
  \renewcommand*{\GenericAcronymFields}{
    first={\the\glslongtok\space\protect\paren{\the\glsshorttok}},
    description={\the\glslongtok}}
  \renewcommand*{\genacrfullformat}[2]{%
    \glsentrydesc{##1}~(\glsentrylong{##1},\space%
    \glsentryshort{##1})%
  }
  \renewcommand*{\acronymentry}[1]{%
    \acronymfont{\glsentryshort{##1}}%
  }
}
\setacronymstyle{acronym-uestc}

\newglossarystyle{uestc-chinese}{
  \setlength{\glsdescwidth}{.3\textwidth}
  \setlength{\glspagelistwidth}{.3\textwidth}
  \renewenvironment{theglossary}%
  {\begin{longtable}{lp{\glsdescwidth}p{\glspagelistwidth}}}%
    {\end{longtable}}%
  \renewcommand*{\glossaryheader}{%
    \heiti 缩略词 &\heiti 英文全称 &
    \heiti 中文全称 \tabularnewline\endhead}%
  \renewcommand*{\glsgroupheading}[1]{}%
  \renewcommand{\glossentry}[2]{
    \glsentryitem{##1}\glstarget{##1}{\glossentryname{##1}} &
    \glsentrylong{##1} & \glsentrydesc{##1}\tabularnewline
  }
  \renewcommand*{\subglossentry}[3]{
    \glossentry{##2}{##3}}
}


\newglossarystyle{uestc-english}{
  \setlength\glsdescwidth{.7\textwidth}
  \renewenvironment{theglossary}%
    {\begin{longtable}{lp{\glsdescwidth}}}%
    {\end{longtable}}%

  \renewcommand*{\glossaryheader}{}%
  \renewcommand*{\glsgroupheading}[1]{}%
  \renewcommand{\glossentry}[2]{
    \glsentryitem{##1}\glstarget{##1}{\glossentryname{##1}} &
    \ifglshaslong{##1}{\glsentrylong{##1}\ifglshasdesc{##1}{, \glsentrydesc{##1}}{}}
    {\glsentrydesc{##1}} \\
  }
  \renewcommand*{\subglossentry}[3]{
  \glossentry{##2}{##3}}
}

\defglsentryfmt{%
  \ifglshaslong{\glslabel}{%
    \glsgenacfmt%
  }{%
    \ifglsused{\glslabel}{%
      \glsgenentryfmt%
    }{%
      \glsgenentryfmt%
    }%
  }%
}

\newcommand{\thesisglossarylist}{
  \newpage 
  \fancyhf{}
  \ifchinesebook{
    \fancyhead[C]{\fontsize{10.5bp}{13.65bp}\selectfont 缩略词表}
    \fancyfoot[CE,CO]{\fontsize{9bp}{10.35bp}\selectfont\Roman{pseudopage}}
    \pdfbookmark{缩略词表}{glossary}
    \printglossary[style=uestc-chinese, title={\protect\centering 缩略词表}, nonumberlist, nogroupskip]
  }{
    \fancyhead[C]{\fontsize{10.5bp}{13.65bp}\selectfont Glossary}
    \fancyfoot[CE,CO]{\fontsize{9bp}{10.35bp}\selectfont\Roman{pseudopage}}
    \pdfbookmark{Glossary}{glossary}
    \printglossary[style=uestc-english, title={\protect\centering Glossary}, nonumberlist, nogroupskip]
  }
  \newpage
}

\newcommand{\makecover}{
\thispagestyle{empty}
\setlength{\extrarowheight}{9bp}
\ifchinesebook{\pdfbookmark{封面}{cover}}{\pdfbookmark{Cover}{cover}}
\begin{center}
  \ifbachelor{\includegraphics{bachelor_font.pdf} \\}{
    \fontsize{22bp}{22bp}\selectfont 电\hspace{0.5em}子\hspace{0.5em}科\hspace{0.5em}技%
    \hspace{0.5em}大\hspace{0.5em}学 \\[7bp]}
  \fontsize{12bp}{12bp}\selectfont UNIVERSITY OF ELECTRONIC SCIENCE
    AND TECHNOLOGY OF CHINA \\[36bp]
  \ifbachelor{\fontsize{42bp}{42bp}\selectfont{\bfseries\chinesebooktitle} \\[24bp]}{
    \fontsize{42bp}{42bp}\selectfont\chinesebooktitle \\[24bp]}
  \fontsize{16bp}{16bp}\selectfont
    \textnormal{\MakeUppercase{\englishbooktitle}} \\[48bp]
  \ifbachelor{
    %\vspace{0.4cm}
    \includegraphics[width=180bp]{logo.pdf} \\[40bp]
  }{\includegraphics[width=180bp]{logo.pdf} \\[40bp]}
  \begin{tabular}{lp{4.2in}}
    \bfseries\fontsize{18bp}{18bp}\selectfont 论文题目 & \multirow[t]{2}{4.2in}{
        \centering
          \bfseries\fontsize{18bp}{18bp}\selectfont
          \zh@thetitle
    } \\
    \cline{2-2}
            & \\
    \cline{2-2}
  \end{tabular}\hspace*{\fill} \\[\baselineskip]
  \begin{tabular}{>{\bfseries\fontsize{16bp}{16bp}\selectfont}l
      >{\centering\arraybackslash\bfseries\fontsize{16bp}{16bp}\selectfont}
      p{3.77in}p{15bp}}
    学科专业 & \zh@themajor &\\
    \cline{2-2}
    学\chinesespace\chinesespace 号 & \thestudentnumber & \\
    \cline{2-2}
    作者姓名 & \zh@theauthor &\\
    \cline{2-2}
    指导老师 & \zh@theadvisor &\\
    \cline{2-2}
    学\chinesespace\chinesespace 院 & \zh@theschool &\\
    \cline{2-2}
  \end{tabular}
\end{center}

\ifbachelor{}{\thetitlepage}

\newpage
\setcounter{page}{1}
\setlength{\extrarowheight}{2bp}
}

\newcommand{\thetitlepage}{
  \newpage
  \thispagestyle{empty}

\noindent 分类号 \rule[-3bp]{2.5in}{0.5bp} 密级 \rule[-3bp]{2.5in}{0.5bp} \\[12bp]
UDC\textsuperscript{ 注1} \rule[-3bp]{2.5in}{0.5bp} \\[12bp]

\begin{center}
  \fontsize{36bp}{36bp}\selectfont{
    学\chinesespace 位\chinesespace 论\chinesespace 文
  } \\[48bp]

  \fontsize{16bp}{16bp}\selectfont{\bfseries\zh@thetitle} \\
  \vspace{-15bp}
  \rule{5.9in}{.5bp} \\
  \fontsize{12bp}{12bp}\selectfont（题名和副题名）\\[36bp]
  \fontsize{16bp}{16bp}\selectfont{\bfseries\zh@theauthor} \\
  \vspace{-15bp}
  \rule{1.63in}{.5bp} \\
  \fontsize{12bp}{12bp}\selectfont（作者姓名） \\[36bp]

  \begin{tabular}{>{\fontsize{12bp}{12bp}\selectfont}l
      >{\centering\arraybackslash\fontsize{16bp}{16bp}\selectfont}
      p{4.45in}}
      指导老师 & {\bfseries\zh@theadvisor} \\
    \cline{2-2}
      & {\bfseries 电子科技大学\chinesespace 成都} \\
    \cline{2-2}
    & \fontsize{12bp}{12bp}\selectfont（姓名、职称、单位名称）
  \end{tabular}  \\[36bp]
\end{center}

  \noindent
  \begin{tabular}{>{\fontsize{12bp}{12bp}\selectfont}l
      >{\centering\arraybackslash\fontsize{14bp}{14bp}\bfseries\selectfont}
      p{1.0in}
      >{\fontsize{12bp}{12bp}\selectfont}l
      >{\centering\arraybackslash\fontsize{14bp}{14bp}\bfseries\selectfont}
      p{2.50in}}
      申请学位级别 & \chinesedegreename &
      学科专业 & \zh@themajor \\
    \cline{2-2}
    \cline{4-4}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12bp}{12bp}\selectfont}l
      >{\centering\arraybackslash\fontsize{14bp}{14bp}\bfseries\selectfont}
      p{1.59in}
      >{\fontsize{12bp}{12bp}\selectfont}l
      >{\centering\arraybackslash\fontsize{14bp}{14bp}\bfseries\selectfont}
      p{1.59in}}
      提交论文日期 & \thedatesubmit &
      论文答辩日期 & \thedateoral \\
    \cline{2-2}
    \cline{4-4}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12bp}{12bp}\selectfont}l
      >{\centering\arraybackslash\fontsize{14bp}{14bp}\bfseries\selectfont}
      p{4.02in}}
      学位授予单位和日期 & 电子科技大学\chinesespace{} \thedateconfer \\
    \cline{2-2}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12bp}{12bp}\selectfont}l
      >{\centering\arraybackslash\fontsize{14bp}{14bp}\heiti\selectfont}
      p{2.29in}}
      答辩委员会主席 & \\
    \cline{2-2}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12bp}{12bp}\selectfont}l
      >{\centering\arraybackslash\fontsize{14bp}{14bp}\heiti\selectfont}
      p{5.03in}}
      评阅人 & \\
    \cline{2-2}
  \end{tabular}

\vspace{0.54in}
\noindent
\hspace{12bp}注1：注明《国际十进分类法UDC》的类号。

\newpage
\thispagestyle{empty}\null
\par{\vspace{2.3cm}}
\noindent
\begin{minipage}[t][1.52cm][t]{\textwidth}
  \fontsize{18bp}{20bp}\selectfont
  \bfseries\centering\en@thetitle
\end{minipage}
\par{\vspace{6.3cm}}
\noindent
\begin{minipage}[t][1.52cm][t]{\textwidth}
  \fontsize{15bp}{17bp}\selectfont
  \centering\noindent
  A \englishbooktitle{} Submitted to \\
  University of Electronic Science and Technology of China
\end{minipage}
\par{\vspace{3.2cm}}
\noindent
\begin{tabular}{>{\fontsize{16bp}{16bp}\selectfont}r
  >{\centering\arraybackslash\bfseries\fontsize{16bp}{16bp}\selectfont}
  p{10.6cm}}
  Discipline: & \multirow[t]{2}{*}{\en@themajor} \\
\cline{2-2}
& \\
\cline{2-2}
Author: & \en@theauthor \\
\cline{2-2}
Student ID: & \thestudentnumber \\
\cline{2-2}
Supervisor: & \en@theadvisor \\
\cline{2-2}
School: & \en@theschool \\
\cline{2-2}
\end{tabular}
}

% \newcommand{\bindpdfcover}[1]{
%   \ifchinesebook{\pdfbookmark{封面}{cover}}{\pdfbookmark{Cover}{cover}}
%   \includepdf[pages=-]{#1}
%   \newpage\setcounter{page}{0}\setcounter{pseudopage}{0}
% }

\newcommand{\originalitydeclaration}{
\newpage
\thispagestyle{empty}
\begin{spacing}{1.9}
  \ifchinesebook{\pdfbookmark{独创性声明}{originalitydeclaration}}
    {\pdfbookmark{Originality Declaration}{originalitydeclaration}}
  \noindent\begin{center}
  \fontsize{18bp}{20bp}\selectfont\bfseries 独创性声明
  \end{center}
    \par{\fontsize{14bp}{16bp}\selectfont\noindent\null\hspace{28bp}%
    本人声明所呈交的学位论文是本人在导师指导下进行的研究工作及取得的研究成果。%
    据我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，%
    也不包含为获得电子科技大学或其它教育机构的学位或证书而使用过的材料。%
    与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示谢意。}
  \\[14bp]
  \fontsize{14bp}{16bp}\selectfont\noindent\null\hspace{35bp}作者签名：\rule[-3bp]{4.1cm}{0.5bp}\hspace{42bp}%
  日期：\chinesespace\chinesespace 年\hspace{21bp}月\hspace{21bp}日 \\
  \noindent\begin{center}
    \fontsize{18bp}{20bp}\selectfont\bfseries 论文使用授权
  \end{center}
  \par{\fontsize{14bp}{14bp}\selectfont\noindent\null\hspace{28bp}%
    本学位论文作者完全了解电子科技大学有关保留、使用学位论文的规定，%
    同意学校有权保留并向国家有关部门或机构送交论文的复印件和数字文档，%
    允许论文被查阅。本人授权电子科技大学可以将学位论文的全部或部分内容编入有关数据库进行检索及下载，%
    可以采用影印、扫描等复制手段保存、汇编学位论文。
}
  \par{\fontsize{14bp}{14bp}\selectfont\noindent\null\hspace{22bp}%
  \chineseleftparenthesis%
  涉密的学位论文须按照国家及学校相关规定管理，在解密后适用于本授权%
  \chineserightparenthesis} \\[14bp]
  \fontsize{14bp}{16bp}\selectfont\noindent\null\hspace{35bp}作者签名：\rule[-3bp]{4.1cm}{0.5bp}\hspace{12bp}%
  导师签名：\rule[-3bp]{4.1cm}{0.5bp} \\[6bp]
  \null\hspace{259bp} 日期：\chinesespace\chinesespace 年\hspace{21bp}月\hspace{21bp}日
\end{spacing}
\newpage\setcounter{page}{0}\setcounter{pseudopage}{0}
}

% \newcommand{\signatureofdeclaration}[1]{
%   \includepdf[pages=-]{#1}
%   \newpage\setcounter{page}{0}\setcounter{pseudopage}{0}
% }

\setlength{\extrarowheight}{2bp}

\newcommand{\thesis@customheadercontent}{}
\newcommand{\setheadercontent}[1]{\renewcommand{\thesis@customheadercontent}{#1}}

\newcommand{\standardheader}{
  \fancyhf{}
  \ifthesis@simplifyheader
    % 简化页眉：所有页面都显示章节名
    \ifchinesebook{
      \fancyhead[C]{\fontsize{10.5bp}{13.65bp}\selectfont\leftmark}
    }{
      \fancyhead[C]{\fontsize{10.5bp}{13.65bp}\selectfont\nouppercase\leftmark}
    }
  \else
    % 标准页眉：奇数页显示章节名，偶数页显示论文标题或自定义内容
    \ifchinesebook{
      \fancyhead[CE]{\fontsize{10.5bp}{13.65bp}\selectfont
        \ifx\thesis@customheadercontent\@empty
          \display@chineseheader
        \else
          \thesis@customheadercontent
        \fi
      }
      \fancyhead[CO]{\fontsize{10.5bp}{13.65bp}\selectfont\leftmark}
    }{
      \fancyhead[CE]{\fontsize{10.5bp}{13.65bp}\selectfont\nouppercase
        \ifx\thesis@customheadercontent\@empty
          \display@englishheader
        \else
          \thesis@customheadercontent
        \fi
      }
      \fancyhead[CO]{\fontsize{10.5bp}{13.65bp}\selectfont\nouppercase\leftmark}
    }
  \fi
  \fancyfoot[CE,CO]{\fontsize{9bp}{10.35bp}\selectfont\thepage}
}

\pretocmd{\tableofcontents}{
  \newpage
  \checkoddpage
  \ifoddpage
      \newpage
    \else
      \blankpage
    \fi
  \fancyhf{}
  \ifchinesebook{
    \fancyhead[C]{\fontsize{10.5bp}{13.65bp}\selectfont 目\enspace 录}
    \fancyfoot[CE,CO]{\fontsize{9bp}{10.35bp}\selectfont\Roman{pseudopage}}
    \pdfbookmark{目录}{toc}
  }{
    \fancyhead[C]{\fontsize{10.5bp}{13.65bp}\selectfont Contents}
    \fancyfoot[CE,CO]{\fontsize{9bp}{10.35bp}\selectfont\Roman{pseudopage}}
    \pdfbookmark{Contents}{toc}
  }
}{}{}

\newcommand{\thesistableofcontents}{
  \tableofcontents
}

\renewcommand{\chaptermark}[1]{\markboth{\thechapter\hspace{5.25bp}#1}{}}

\newcommand{\thesisacknowledgement}{
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
  \setcounter{section}{0}
  \ifchinesebook{
    \chapter*{致\hspace{12bp}谢}
    \addcontentsline{toc}{chapter}{致\hspace{12bp}谢}
    \markboth{致谢}{致谢}
  }{
    \chapter*{Acknowledgements}
    \addcontentsline{toc}{chapter}{Acknowledgements}
    \markboth{Acknowledgements}{Acknowledgements}
  }
  \thispagestyle{fancy}
}

\newcommand{\thesiscontent}{
  \newpage
  \clearpage{\thispagestyle{empty}\cleardoublepage}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{2}}
  \standardheader
  \pagenumbering{arabic}
}

\pretocmd{\@chapter}{
  \ifdefined\@BODY
  \else
  \ifnum\value{chapter}=0
      \thesiscontent
    \fi
  \fi
}{}{}

\apptocmd{\@chapter}{
  \ifdefined\@BODY
  \else
    \ifnum\value{chapter}=1
      % 取消第一章强制设为绪论页眉的格式
      %\ifchinesebook{\chaptermark{绪论}}{\chaptermark{Introduction}}
      \setcounter{page}{1}
    \fi
  \fi
  \def\@BODY{\null}
}{}{}

\newcommand{\thesischapterexordium}{
  \ifchinesebook{
    \chapter{绪\quad 论}
  }{
    \chapter{Introduction}
  }
}

%\renewcommand*{\l@chapter}{\@dottedtocline{1}{1.5em}{2.3em}}

\newcommand{\thesisappendix}{
  \newpage
  \appendix
  \interlinepenalty=0
  \ifchinesebook{}{\addtocontents{toc}{\protect\addtolength{\cftchapnumwidth}{12bp}}}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{2}}
  \titleformat{\chapter}[block]
    {\centering\fontsize{15bp}{15bp}\selectfont\strong\thispagestyle{fancy}}{\thechapter}{7.5bp}{}
  \ifchinesebook{
    \renewcommand{\thechapter}{附录\Alph{chapter}}
    \renewcommand{\appendixname}{附录}
  }{
    \renewcommand{\thechapter}{Appendix \Alph{chapter}}
    \renewcommand{\appendixname}{Appendix}
  }

  \renewcommand{\thesection}{\Alph{chapter}.\arabic{section}}
  \renewcommand{\theequation}{\alph{chapter}-\arabic{equation}}
  \renewcommand{\thetable}{\alph{chapter}-\arabic{table}}
  \renewcommand{\thefigure}{\alph{chapter}-\arabic{figure}}
  \renewcommand{\thetheorem}{\alph{chapter}.\arabic{theorem}}
  \renewcommand{\theaxiom}{\alph{chapter}.\arabic{axiom}}
  \renewcommand{\thecorollary}{\alph{chapter}.\arabic{corollary}}
  \renewcommand{\thelemma}{\alph{chapter}.\arabic{lemma}}
  \renewcommand{\thedefinition}{\alph{chapter}.\arabic{definition}}
  \renewcommand{\theexample}{\alph{chapter}.\arabic{example}}
}

\newcommand{\thesissingleappendix}{
  \newpage
  \appendix
  \interlinepenalty=0
  \addtocontents{toc}{\protect\setcounter{tocdepth}{2}}
  \titleformat{\chapter}[block]
    {\centering\fontsize{15bp}{15bp}\selectfont\strong\thispagestyle{fancy}}{附\hspace{12bp}录}{7.5bp}{}
  %\renewcommand{\thechapter}{附\hspace{12bp}录}
  \ifchinesebook{
    \renewcommand{\appendixname}{附录}
  }{
    \renewcommand{\appendixname}{Appendix}
  }
  
  \renewcommand{\thesection}{A.\arabic{section}}
  
  \renewcommand{\theequation}{a-\arabic{equation}}
  \renewcommand{\thetable}{a-\arabic{table}}
  \renewcommand{\thefigure}{a-\arabic{figure}}
  \renewcommand{\thetheorem}{a.\arabic{theorem}}
  \renewcommand{\theaxiom}{a.\arabic{axiom}}
  \renewcommand{\thecorollary}{a.\arabic{corollary}}
  \renewcommand{\thelemma}{a.\arabic{lemma}}
  \renewcommand{\thedefinition}{a.\arabic{definition}}
  \renewcommand{\theexample}{a.\arabic{example}}
  
  \ifchinesebook{
    \chapter*{附\hspace{12bp}录}
    \addcontentsline{toc}{chapter}{附录}
    \markboth{附录}{附录}
  }{
    \chapter*{Appendix}
    \addcontentsline{toc}{chapter}{Appendix}
    \markboth{Appendix}{Appendix}
  }
}

\ifchinesebook{
  \newcommand{\translation@originaltitle}{外文资料原文}
  \newcommand{\translation@chinesetitle}{外文资料译文}
}{
  \newcommand{\translation@originaltitle}{Original Text for Translation}
  \newcommand{\translation@chinesetitle}{Translated Text in Chinese}
}

\newcommand{\thesistranslationoriginal}{
  \interlinepenalty=0
  \chapter*{\translation@originaltitle}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
  \renewcommand\thesection{\arabic{section}}
    \setcounter{section}{0}
    \addcontentsline{toc}{chapter}{\translation@originaltitle}
    \markboth{\translation@originaltitle}{\translation@originaltitle}
    \thispagestyle{fancy}
    \hypersetup{bookmarksdepth=0} 
    \renewcommand{\theequation}{\arabic{equation}}
    \renewcommand{\thetable}{\arabic{table}}
    \renewcommand{\thefigure}{\arabic{figure}}
    \renewcommand{\figurename}{Figure}
    \renewcommand{\tablename}{Table}
}

\newcommand{\thesistranslationchinese}{
  \interlinepenalty=0
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
  \chapter*{\translation@chinesetitle}
  \renewcommand\thesection{\arabic{section}}
    \setcounter{section}{0}
    \addcontentsline{toc}{chapter}{\translation@chinesetitle}
    \markboth{\translation@chinesetitle}{\translation@chinesetitle}
    \thispagestyle{fancy}
    \hypersetup{bookmarksdepth=0} 
    \renewcommand{\theequation}{\arabic{equation}}
    \renewcommand{\thetable}{\arabic{table}}
    \renewcommand{\thefigure}{\arabic{figure}}
    \renewcommand{\figurename}{图}
    \renewcommand{\tablename}{表}
}

\ifchinesebook{
  \newcommand{\thesisaccomplishtitle}{攻读\chinesedegreename{}学位期间取得的成果}
  \newcommand{\thesisbibname}{参考文献}
}{
  \newcommand{\thesisaccomplishtitle}{Research Results Obtained During the Study for \englishdegreename{} Degree}
  \newcommand{\thesisbibname}{References}
}

\renewcommand{\bibname}{\thesisbibname}
\renewcommand{\@biblabel}[1]{[#1]\hfill}

\AtBeginEnvironment{thebibliography}{%
  \fontsize{10.5bp}{20bp}\selectfont % 行间距20bp设置在该环境无效，后续需要setstretch
  \setlength{\itemsep}{0bp}
  \setlength{\parskip}{0bp}
}

\newenvironment{thesisthebibliography}{
  \begin{thebibliography}{lo}
    \interlinepenalty=10000
    % \fontsize{10.5bp}{20bp}\selectfont % 在该环境无效果
    \setstretch{1.5873} % 20 / 1.2 / 10.5 
    \thispagestyle{fancy}
    \setlength{\itemsep}{0bp}
    \setlength{\parskip}{0bp}
}{
  \end{thebibliography}
}

\pretocmd{\bibliography}{
  \thispagestyle{fancy}
  \interlinepenalty=10000
  \setstretch{1.5873}
  % \fontsize{10.5bp}{20bp}\selectfont % 在该环境无效果
  \setlength{\itemsep}{0bp}
  \setlength{\parskip}{0bp}
}{}{}

\apptocmd{\bibliography}{
}{}{}

\newcommand{\bstlabelmark}{lo}
\newcommand{\thesisloadbibliography}[2][]{
  \ifthenelse{
    \equal{#1}{large}
  }{
    \setlength{\labelsep}{3bp}
    \renewcommand{\bstlabelmark}{loo}
    \bibliographystyle{thesis-uestc}
    \bibliography{#2}
    \setlength{\labelsep}{6bp}
  }{
    \bibliographystyle{thesis-uestc}
    \bibliography{#2}
  }
}

\newcommand{\thesisbibliography}{\thesisloadbibliography}

\newcites{accomplish}{\thesisaccomplishtitle}

\newenvironment{thesistheaccomplish}{
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
  \renewcommand\thesection{\arabic{section}}
  \setcounter{section}{0}
  \nociteaccomplish{*}
  \renewcommand{\bibname}{\thesisaccomplishtitle}
  \begin{thebibliography}{lo}
  \interlinepenalty=10000
  \setlength{\itemsep}{0bp}\setlength{\parskip}{0bp}
  % \fontsize{10.5bp}{20bp}\selectfont % 在该环境无效果
  \setstretch{1.5873}
  \thispagestyle{fancy}
}{
  \end{thebibliography}
  \renewcommand{\bibname}{\thesisbibname}
}

\newcommand{\thesisloadaccomplish}[1]{
  \nociteaccomplish{*}
  \renewcommand{\bibname}{\thesisaccomplishtitle}
  \renewcommand{\bstlabelmark}{lo}
  \thispagestyle{fancy}
  \bibliographystyleaccomplish{thesis-uestc}
  \bibliographyaccomplish{#1}
  \renewcommand{\bibname}{\thesisbibname}
}

\newcommand{\thesisaccomplish}{\thesisloadaccomplish}

\newtheoremstyle{dotless}{0bp}{0bp}{\normalfont}{24bp}{\strong}{}{ }{}
\theoremstyle{dotless}
%\renewcommand\@upn{\selectfont\heiti@letter}

\ifchinesebook{
  \newtheorem{theorem}{定理}[chapter]
  \newtheorem{axiom}[theorem]{公理}
  \newtheorem{corollary}[theorem]{推论}
  \newtheorem{lemma}[theorem]{引理}
  \newtheorem{definition}[theorem]{定义}
  \newtheorem{example}[theorem]{例子}
  \newtheorem{proposition}[theorem]{命题}
}{
  \newtheorem{theorem}{Theorem}[chapter]
  \newtheorem{axiom}[theorem]{Axiom}
  \newtheorem{corollary}[theorem]{Corollary}
  \newtheorem{lemma}[theorem]{Lemma}
  \newtheorem{definition}[theorem]{Definition}
  \newtheorem{example}[theorem]{Example}
  \newtheorem{proposition}[theorem]{Proposition}
}


\renewcommand{\thetheorem}{\arabic{chapter}.\arabic{theorem}}
\renewcommand{\theaxiom}{\arabic{chapter}.\arabic{axiom}}
\renewcommand{\thecorollary}{\arabic{chapter}.\arabic{corollary}}
\renewcommand{\thelemma}{\arabic{chapter}.\arabic{lemma}}
\renewcommand{\thedefinition}{\arabic{chapter}.\arabic{definition}}
\renewcommand{\theexample}{\arabic{chapter}.\arabic{example}}
\renewcommand{\qedsymbol}{$\blacksquare$}
\ifchinesebook{
  \renewcommand{\proofname}{证明}
}{}

\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}
  \normalfont
  \topsep0bp \partopsep0bp
  \trivlist
  \item[\hskip5\labelsep
    \strong
  #1\@addpunct{:}]\ignorespaces
}{
  \popQED\endtrivlist\@endpefalse
}

\newcommand{\citing}[1]{\textsuperscript{\cite{#1}}}
\setlist{noitemsep}
\setlist{nolistsep}

\AtBeginDocument{
  \setlength{\abovedisplayskip}{6bp}
  \setlength{\belowdisplayskip}{6bp}
  \setlength{\belowdisplayshortskip}{6bp}
  \setlength{\abovedisplayshortskip}{6bp}
}

\makeatother
\endinput
