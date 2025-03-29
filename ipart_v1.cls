\NeedsTeXFormat{LaTeX2e}[2000/06/01]
\ProvidesClass{ipart_v1}[2014/11/03]


\def\@tempa#1#2\@nil{\edef\@classname{#1}}
\expandafter\@tempa\@currnamestack{}{}{}\@nil
\ifx\@classname\@empty \edef\@classname{\@currname}\fi

\newif\ifpub
\pubtrue
\newif\iffin
\newif\ifhyp
\newif\ifyandy
\newif\ifprint
\newif\ifnoquery
\newif\ifcag
\newif\ifcis
\newif\ifjsg
\newif\ifmrl
\newif\ifatmp
\newif\ifcntp
\newif\ifpamq

% Are we printing crop marks?
\newif\if@cropmarkson \@cropmarksontrue

% Numbered or named references?
\newif\if@numberedrefs \@numberedrefsfalse


\DeclareOption{draft}{\PassOptionsToPackage{draft}{graphicx}}
\DeclareOption{a4paper}{\PassOptionsToPackage{a4}{crop}}
\DeclareOption{centre}{\PassOptionsToPackage{center}{crop}}
\DeclareOption{crop}{\PassOptionsToPackage{cam}{crop}\global\@cropmarksontrue}
\DeclareOption{nocrop}
                     {\PassOptionsToPackage{off}{crop}\global\@cropmarksonfalse}
\DeclareOption{info}{\PassOptionsToPackage{info}{crop}}
\DeclareOption{noinfo}{\PassOptionsToPackage{noinfo}{crop}}
\DeclareOption{noquery}{\noquerytrue}
\DeclareOption{cag}{\cagtrue}
\DeclareOption{cis}{\cistrue}
\DeclareOption{jsg}{\jsgtrue}
\DeclareOption{mrl}{\mrltrue}
\DeclareOption{atmp}{\atmptrue}
\DeclareOption{cntp}{\cntptrue}
\DeclareOption{pamq}{\pamqtrue}

% Set twoside printing
\@twosidetrue

\@mparswitchtrue



\DeclareOption{print}{\printtrue\fintrue}
\DeclareOption{np}{\pubfalse}
\DeclareOption{production}{\fintrue}
\DeclareOption{hyp}{\hyptrue}
\DeclareOption{yandy}{\yandytrue}
\DeclareOption{dvips}{}
\DeclareOption{letterpaper}{\paperheight 10in\paperwidth 7in }
\DeclareOption{landscape}{\@tempdima\paperheight \paperheight\paperwidth \paperwidth\@tempdima}
\DeclareOption{portrait}{}
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\overfullrule5\p@ }
\DeclareOption{final}{\overfullrule\z@ }
\DeclareOption{crop}{\PassOptionsToPackage{cam}{crop}}
\DeclareOption{nocrop}{\PassOptionsToPackage{off}{crop}}

\newif\if@titlepage
\DeclareOption{titlepage}{\@titlepagetrue}
\DeclareOption{notitlepage}{\@titlepagefalse}
\newif\if@openright
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{nomath}{}
\DeclareOption{noamsfonts}{}
\DeclareOption{psamsfonts}{%
  \PassOptionsToPackage{psamsfonts}{amsfonts}%
  \PassOptionsToPackage{cmex10}{amsmath}}

\newif\iftagsleft@
\DeclareOption{leqno}{%
  \tagsleft@true \PassOptionsToPackage{leqno}{amsmath}}
\DeclareOption{reqno}{%
  \tagsleft@false \PassOptionsToPackage{reqno}{amsmath}}
\newif\ifctagsplit@
\DeclareOption{centertags}{%
  \ctagsplit@true \PassOptionsToPackage{centertags}{amsmath}}
\DeclareOption{tbtags}{%
  \ctagsplit@false \PassOptionsToPackage{tbtags}{amsmath}}

\DeclareOption{fleqn}{%
  \def\[{\relax
    \ifmmode\@badmath
    \else
      \begin{trivlist}%
      \@beginparpenalty\predisplaypenalty
      \@endparpenalty\postdisplaypenalty
      \item[]\leavevmode
      \hbox to\linewidth\bgroup$\displaystyle
      \hskip\mathindent\bgroup
    \fi}%
  \def\]{\relax%
    \ifmmode%
      \egroup \m@th$\hfil \egroup%
      \end{trivlist}%
    \else \@badmath%
    \fi}%

  \renewenvironment{equation}{%
    \@beginparpenalty\predisplaypenalty%
    \@endparpenalty\postdisplaypenalty%
    \refstepcounter{equation}%
    \@topsep\abovedisplayskip \trivlist%
    \item[]\leavevmode%
    \hbox to\linewidth\bgroup\hskip\mathindent$\displaystyle}{%
    \m@th$\hfil \displaywidth\linewidth \hbox{\@eqnnum}\egroup%
    \endtrivlist}%

  \renewenvironment{eqnarray}{%
    \stepcounter{equation}\let\@currentlabel\theequation
    \global\@eqnswtrue \global\@eqcnt\z@ \tabskip\mathindent
    \let\\=\@eqncr \abovedisplayskip\topsep
    \ifvmode \advance\abovedisplayskip\partopsep \fi
    \belowdisplayskip\abovedisplayskip
    \belowdisplayshortskip\abovedisplayskip
    \abovedisplayshortskip\abovedisplayskip
    $$\everycr{}\halign to\linewidth\bgroup
      \hskip\@centering
      $\displaystyle\tabskip\z@skip####\m@th$&%
      \@eqnsel \global\@eqcnt\@ne
      \hfil${}####{}\m@th$\hfil&%
      \global\@eqcnt\tw@
      $\displaystyle ####\m@th$\hfil\tabskip\@centering&%
      \global\@eqcnt\thr@@
      \hbox to \z@\bgroup\hss####\egroup\tabskip\z@skip\cr}{%
      \@@eqncr \egroup \global\advance\c@equation\m@ne$$%
      \global\@ignoretrue}%
  \newdimen\mathindent \mathindent\leftmargini}%

\let\@bls\baselineskip

%% PAGE DEFINITIONS

\setlength{\paperheight}{10in}
\setlength{\paperwidth}{7in}

% Default font sizes
\renewcommand\normalsize{%
  \@setfontsize\normalsize{11\p@}{13.5\p@}%
  \abovedisplayskip 12\p@ \@plus 2\p@ \@minus2\p@
  \abovedisplayshortskip 3\p@ \@plus 3\p@ \@minus1\p@
  \belowdisplayshortskip 6\p@ \@plus 3\p@ \@minus2\p@
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI}
\normalsize
\let\@bls\baselineskip

\newcommand\small{%
  \@setfontsize\small{9\p@}{11\p@}%
  \abovedisplayskip 6\p@ \@plus1\p@ \@minus1\p@
  \abovedisplayshortskip 3\p@ \@plus 2\p@ \@minus1\p@
  \belowdisplayshortskip 2\p@ \@plus 1\p@ \@minus1\p@
  \def\@listi{\leftmargin\leftmargini
              \listparindent \parindent
              \topsep 6\p@ \@plus2\p@ \@minus1\p@
              \parsep \z@ \itemsep \z@}%
  \belowdisplayskip \abovedisplayskip
  }

\newcommand\footnotesize{%
  \@setfontsize\footnotesize{10\p@}{12\p@}%
  \abovedisplayskip 10\p@ \@plus2\p@ \@minus2\p@
  \abovedisplayshortskip \z@ \@plus \p@
  \belowdisplayshortskip 1\p@ \@plus2\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \listparindent 1em
              \topsep 5\p@ \@plus 2\p@ \@minus 1\p@
              \parsep \z@ \itemsep \z@}%
  \belowdisplayskip \abovedisplayskip
  }

\def\scriptsize{\@setfontsize\scriptsize{7\p@}{9\p@}}
\def\tiny{\@setfontsize\tiny{6\p@}{7\p@}}
\def\little{\@setfontsize\little{5\p@}{6\p@}}
\def\large{\@setfontsize\large{12\p@}{14\p@}}
\def\Large{\@setfontsize\Large{14\p@}{16\p@}}
\def\LARGE{\@setfontsize\LARGE{16\p@}{18\p@}}
\def\huge{\@setfontsize\huge{24\p@}{26\p@}}
\def\Huge{\@setfontsize\Huge{25\p@}{27\p@}}

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}


\widowpenalty=10000
\clubpenalty=10000
\brokenpenalty=10000
\newdimen\linespacing
\lineskip=0pt\lineskiplimit=0pt

\normallineskip=0pt \normallineskiplimit=0pt
\let\baselinestretch=\@empty
\footskip=27pt
\setlength\maxdepth{.5\topskip}      % pages can be short or deep by half a line?
\columnsep=10pt \columnseprule=0pt
\marginparwidth=5pt
\marginparsep=11pt
\marginparpush=5pt

\skip\footins=9pt plus11pt
\skip\@mpfootins=\skip\footins
\fboxsep=3pt \fboxrule=.4pt
\arrayrulewidth=.4pt    \doublerulesep=2pt
\labelsep=5.5pt           \arraycolsep=\labelsep
\tabcolsep=\labelsep    \tabbingsep=\labelsep
\floatsep=15pt plus 12pt    \dblfloatsep=15pt plus 12pt
\textfloatsep=\floatsep  \dbltextfloatsep=15pt plus 12pt
\intextsep=\floatsep
\@fptop=0pt plus1fil     \@dblfptop=0pt plus1fil
\@fpbot=0pt plus1fil     \@dblfpbot=0pt plus1fil
\@fpsep=8pt plus2fil     \@dblfpsep=8pt plus2fil\relax
\parskip=0pt \relax
\newdimen\normalparindent
\normalparindent=12pt
\setlength\parindent{18pt}
\partopsep=0pt \relax \parsep=11pt \relax \itemsep=3pt \relax

\@lowpenalty=51
\@medpenalty=151
\@highpenalty=301
\@beginparpenalty=-\@lowpenalty
\@endparpenalty=-\@lowpenalty
\@itempenalty=-\@lowpenalty

\newcommand{\firstpage}[1]{%
  \setcounter{page}{#1}}

\def\year@info{\the\year}
\def\vol@info{00}
\def\issue@info{00}
\def\aucopyright@info{}

\def\acopyright#1{\gdef\aucopyright@info{#1}}
\def\Year#1{\gdef\year@info{#1}}
\def\Vol#1{\gdef\vol@info{#1}}
\def\Issue#1{\gdef\issue@info{#1}}

\newcommand{\page@extent@info}{%
  \thepage--\pageref{LastPage}}

\newcommand{\totalpage}{%
  \pageref{LastPage}}

\def\jourinf{Volume~\vol@info, Number~\issue@info, \page@extent@info, \year@info}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Page Styles %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\ps@titlepage{%
     %%%\addtolength\topmargin{27\p@}%
  \let\@evenhead\relax
  \let\@evenfoot\relax
  \def\@oddhead{\copyrightnotice}%
  \def\@oddfoot{\hfill\thepage\hfill}%
  \def\authormark##1{\def\leftmark{##1}}%
  \def\titlemark##1{\markboth{##1}{##1}}}

\def\ps@headings{%
  \let\@oddfoot\@empty%
  \let\@evenfoot\@empty%
  \def\@evenhead{\fontsize{11}{13}\selectfont\rlap{\thepage}\hfil{\leftmark}\hfil}%
  \def\@oddhead{\fontsize{11}{13}\selectfont\hfil{\rightmark}\hfil\llap{\thepage}}%
  \def\authormark##1{\def\leftmark{##1}}%
  \def\titlemark##1{\markboth{##1}{##1}}}


\newcommand{\copyrightnotice}{%
  \vbox to 12\baselineskip{\vskip-2.7pt\vfill\fontsize{8}{9.5}\selectfont%
\ifcag
  \leftline{\textsc{Communications in}\hfill \vphantom{(}\aucopyright@info}%
  \leftline{\textsc{Analysis and Geometry}}%
  \leftline{{\jourinf}}
\else
\ifcis
  \leftline{\textsc{Communications in Information and Systems}\hfill \vphantom{(}\aucopyright@info}%
  \leftline{{\jourinf}}
\else
\ifcntp
  \leftline{\textsc{Communications in}\hfill \vphantom{(}\aucopyright@info}%
  \leftline{\textsc{Number Theory and Physics}}%
  \leftline{{\jourinf}}
\else
\ifjsg
  \leftline{\textsc{journal of}\hfill \vphantom{(}\aucopyright@info}%
  \leftline{\textsc{symplectic geometry}}%
  \leftline{{\jourinf}}
\else
\ifatmp
  \leftline{ADV.~THEOR.~MATH.~PHYS.\hfill \vphantom{(}\aucopyright@info}%
  \leftline{{\jourinf}}%
\else
\ifmrl
  \leftline{Math. Res. Lett.\hfill \vphantom{(}\aucopyright@info}%
  \leftline{{\jourinf}}%
\else
\ifpamq
  \leftline{Pure and Applied Mathematics Quarterly\hfill \vphantom{(}\aucopyright@info}%
  \leftline{{\jourinf}}%
\fi
\fi
\fi
\fi
\fi
\fi
\fi
}}%





\DeclareOption{makeidx}{}

\input{amsgen.sty}

\ExecuteOptions{leqno,centertags,a4paper,centre,portrait,%
  11pt,twoside,onecolumn,crop,final}
\ProcessOptions\relax

\RequirePackage{crop}

\if@compatibility
  \def\@tempa{\RequirePackage{amstex}\relax}
\else
  \@ifclasswith{\@classname}{nomath}{%
    \let\@tempa\relax
  }{%
    \def\@tempa{\RequirePackage{amsmath}\relax}%
  }%
\fi
\@tempa % load amstex.sty or amsmath.sty

\providecommand\numberwithin[2]{%
  \@ifundefined{c@#1}{\@nocounterr{#1}}{%
    \@ifundefined{c@#2}{\@nocounterr{#2}}{%
    \@addtoreset{#1}{#2}%
    \toks@\@xp\@xp\@xp{\csname the#1\endcsname}%
    \@xp\xdef\csname the#1\endcsname
      {\@xp\@nx\csname the#2\endcsname
       .\the\toks@}}}}
\if@compatibility
\else
  \@ifclasswith{\@classname}{noamsfonts}{%
    % amsfonts package is not wanted
  }{%
    % amsfonts package IS wanted; test whether a recent enough version
    % seems to be installed
    \begingroup \fontencoding{U}\fontfamily{msa}\try@load@fontshape\endgroup
    \global\@xp\let\csname U+msa\endcsname\relax % reset
    \@ifundefined{U/msa/m/n}{%
      \ClassError{\@classname}{%
  Package `amsfonts' not installed, or version too old?\MessageBreak
  Unable to get font info for the `msam' fonts in the expected form%
      }{%
  The amsfonts package will not be loaded, to avoid probable\MessageBreak
  incompatibility problems. You can (a) use the `noamsfonts'
      documentclass\MessageBreak
  option next time, or (b) check that the amsfonts package is
      installed\MessageBreak
  correctly, and is not too old to be compatible.%
      }%
    }{%
      \RequirePackage{amsfonts}[1995/01/01]\relax
    }%
  }
\fi % end yesamsfonts branch

\ifhyp  %%%%%%%%%%%%%%%%%%%%%% If using hypertex macros
\newcommand{\hyper@quote}{\string"}
\edef\hyper@hash{\string#}
\edef\hyperhash{\string#}
\newcommand{\hyper@link}[2]{%
\special{html:<a href=\hyper@quote#1\hyper@quote>}#2\special{html:</a>}}
\newcommand{\hyper@anchor}[1]{%
\special{html:<a name=\hyper@quote#1\hyper@quote>}\special{html:</a>}}
\newcommand{\anchor@ref}[2]{\hyper@link{\hyper@hash#1}{\mbox{#2}}}
\newcommand{\anchor@longref}[2]{\hyper@link{\hyper@hash#1}{#2}}
\else  %%%%%%%%%%%%%%%%%%%%%%% If not using hypertex macros
\newcommand{\hyper@link}[2]{#2}
\edef\hyperhash{}
\newcommand{\hyper@anchor}[1]{}
\newcommand{\anchor@ref}[2]{\mbox{#2}}
\newcommand{\anchor@longref}[2]{#2}
\fi    %%%%%%%%%%%%%%%%%%%%%%% End of conditional for for hypertex

\ifyandy
\def\bluetext#1{\special{color push}\special{color rgb 0 0 1}#1\special{color pop}}
\newcount\height
\newcount\width
\long\def\anchor@ref#1#2{\leavevmode\setbox0\hbox{#2}\height=\ht0\width=\wd0%
\special{button: \the\width\space \the\height\space #1}\bluetext{\box0}}
\long\def\anchor@longref#1#2{\leavevmode\setbox0\hbox{#2}\height=\ht0\width=\wd0%
\special{button: \the\width\space \the\height\space #1}\bluetext{\unhbox0}}
\def\hyper@anchor#1{\special{mark: #1}}
\def\hyper@link#1#2{\leavevmode\setbox0\hbox{#2}\height=\ht0\width=\wd0%
\special{button: \the\width\space \the\height\space #1}\bluetext{\unhbox0}}
\fi   %%%%%%%%%%%%%%%%%%%% End of conditional for yandy

\newcommand{\bib@link}[2]{\anchor@ref{bibcite#1}{#2}}
\newcommand{\bib@anchor}[1]{\hyper@anchor{bibcite#1}}
\newcommand{\hyperlink}[2]{\hyper@link{#1}{#2}}
\newcommand{\hlabel}[1]{\hyper@anchor{#1}}
\newcommand{\shlabel}[1]{\hyper@anchor{#1}{#1}}
\newcommand{\href}[2]{\anchor@ref{#1}{#2}}
\newcommand{\shref}[1]{\anchor@ref{#1}{#1}}
\newcommand{\shyperlink}[1]{\hyper@link{#1}{#1}}

%%%@ Here are hypertex versions of various macros defined in the format
%\def\@citex[#1]#2{%
%  \let\@citea\@empty
%  \@cite{\@for\@citeb:=#2\do
%    {\@citea\def\@citea{,\penalty\@m\,}%
%     \edef\@citeb{\expandafter\@iden\@citeb}%
%     \if@filesw\immediate\write\@auxout{\string\citation{\@citeb}}\fi
%     \@ifundefined{b@\@citeb}{{\reset@font\bfseries ?}%
%       \G@refundefinedtrue\@latex@warning
%       {Citation `\@citeb' on page \thepage \space undefined}}%
%     {\hbox{\bib@link{\@citeb}{\csname b@\@citeb\endcsname}}}}}{#1}}

\def\@bibitem#1{\item\if@filesw \immediate\write\@auxout
       {\string\bibcite{#1}{\the\value{\@listctr}}}\fi%
     \hyper@anchor{bibcite#1}\ignorespaces}

\def\@lbibitem[#1]#2{\item[\@biblabel{\bib@anchor{#2}#1}\hfill]\if@filesw
      {\let\protect\noexpand
       \immediate
       \write\@auxout{\string\bibcite{#2}{#1}}}\fi\ignorespaces}

\newcommand{\@noref}[1]{%
  \G@refundefinedtrue
  \nfss@text{\reset@font\bfseries ??}%
  \@latex@warning{Reference `#1' on page \thepage\space undefined}%
}

\def\old@setref#1#2#3{\ifx#1\relax
    \protect\@noref{#3}%
  \else
    \protect\textup{\expandafter#2#1\hbox{}}%
  \fi}

\def\page@setref#1#2#3{\ifx#1\relax
    \protect\@noref{#3}%
  \else
   \anchor@ref{page\expandafter#2#1}{\protect\textup{\expandafter#2#1\hbox{}}}%
  \fi}


\def\label#1{\@bsphack
  \protected@write\@auxout{}%
         {\string\newlabel{#1}{{\@currentlabel}{\thepage}}}%
  \@esphack\hyper@anchor{#1}}


\def\oldpageref#1{\expandafter\old@setref\csname r@#1\endcsname
                                   \@secondoftwo{#1}}


\def\pageref#1{\expandafter\page@setref\csname r@#1\endcsname
                                   \@secondoftwo{#1}}

\newcounter{totfootns}

\newcommand{\uppercasenonmath}[1]{\toks@\@emptytoks
  \@xp\@skipmath\@xp\@empty#1$$%
  \edef#1{\@nx\@upprep\the\toks@}}%

\newcommand{\today}{%
  \relax\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}

\def\title{\@ifnextchar[{\@title@wst@}{\@title@nst@}}
\def\@title@wst@[#1]{\titlemark{#1}\@title@assign@}
\def\@title@nst@#1{\titlemark{#1}\@title@assign@{#1}}
\def\@title@assign@#1{\def\@title{#1}}

\def\author{\@ifnextchar[{\@author@wst@}{\@author@nst@}}
\def\@author@wst@[#1]{\authormark{#1}\@author@assign@}
\def\@author@nst@#1{\authormark{#1}\@author@assign@{#1}}
\def\@author@assign@#1{\gdef\@author{#1}}

\let\finalcomment\@empty

\let\@date\@empty
\newcommand\recdate[1]{\gdef\@recdate{#1}}
\let\@recdate\@empty

\def\dedicatory#1{\def\@dedicatory{#1}}
\let\@dedicatory=\@empty

\def\keywords#1{\def\@keywords{#1}}
\let\@keywords=\@empty

\def\subjclass#1{\def\@subjclass{#1}}
\let\@subjclass=\@empty

\def\commby#1{\def\@commby{(Communicated by #1)}}
\let\@commby=\@empty

\def\translator#1{%
  \ifx\@empty\@translators \def\@translators{#1}%
  \else\g@addto@macro\@translators{\and#1}\fi}
\let\@translators=\@empty
\def\@settranslators{\par\begingroup
  \addvspace{6\p@\@plus9\p@}%
  \hbox to\columnwidth{\hss\normalfont\normalsize
    Translated by %
    \andify\@translators %\uppercasenonmath\@translators
    \@translators}
  \endgroup}


\newcommand\maketitle{\par%
   \begingroup%
    \thispagestyle{titlepage}%
    \global\@topnum\z@%Prevents figures from going at top of page.
    \@maketitle%
      \let\footnotesize\small
 % \let\footnoterule\relax
 % \let \footnote \thanks
  \endgroup%
  \@afterindentfalse%
  \@afterheading%
%  \setcounter{footnote}\z@%
  \global\let\@maketitle\relax%
  \global\let\@thanks\@empty%
  \global\let\maketitle\relax%
  \global\let\thanks\relax}%

\def\@maketitle{%
  \vspace*{17pt}%
  \begingroup
    \centering
    {\fontsize{17}{22}\selectfont
      {\bfseries\@title}%
      \par}%
    \vspace{10pt}%
      \begingroup
      \ifx\@empty\@author
      \else
      {\fontsize{11}{13}\selectfont\sc\@author}%
      \fi
      \endgroup
       \begingroup
      \ifx\@empty\@dedicatory
      \else
      \vskip1pc
      {\fontsize{10}{12}\selectfont\it\@dedicatory}%
      \fi
      \endgroup
      \par%
  \vspace*{8pt}
  \@setabstract
  \normalsize
  \if@titlepage
    \newpage
  \else
    \dimen@12\p@ \advance\dimen@-\baselineskip
    \vskip\dimen@ plus 14\p@\relax
  \fi
  \endgroup
  \vspace{1pc plus 6\p@}}

%\usepackage{lastpage}

\def\lastpage@putlabel{\addtocounter{page}{-1}%
   \immediate\write\@auxout{\string
   \newlabel{LastPage}{{}{\thepage}}}%
   \addtocounter{page}{1}}

\AtEndDocument{
   \message{Setting LastPage}
   \clearpage\lastpage@putlabel
}

\@ifundefined{ISSN}{\def\ISSN{0000-0000}}{}
\newcommand\PII[1]{\def\@PII{#1}}
\PII{S \ISSN(XX)0000-0}
\newcommand{\abstractname}{Abstract}
\newcommand{\keywordsname}{Key words and phrases}
\newcommand{\subjclassname}{Mathematics Subject
     Classification}
\def\@tempb{jsg}
\ifx\@classname\@tempb
  \newcommand{\datename}{Received}
\else
  \newcommand{\datename}{Received}
\fi

\def\@setauthors{%
  \begingroup
  \trivlist
  \centering \@topsep24\p@\relax
  \bf{
  \advance\@topsep by -\baselineskip
  \item\relax
  \andify\author \scshape
  \leavevmode\author }
  \endtrivlist
  \endgroup}

\def\@setdate{\noindent\footnotesize\datename\ \@date}
\def\@setfinalcomment{\noindent\footnotesize\scshape\finalcomment}
\def\setsubjclass{%
  \indent{\itshape\subjclassname.}\enspace\@subjclass\@addpunct.}
\def\setkeywords{%
  {\itshape \keywordsname.}\enspace \@keywords\@addpunct.}

\newbox\abstractbox

\newenvironment{abstract}{%
  \ifx\maketitle\relax
    \ClassWarning{\@classname}{Abstract should precede
      \protect\maketitle; reported}%
  \fi
  \global\setbox\abstractbox=\vtop \bgroup
  \normalfont\footnotesize
  \list{}{\labelwidth\z@
    \leftmargin3pc \rightmargin\leftmargin
    \listparindent\normalparindent \itemindent\z@
    \parsep\z@ \@plus\p@
    \let\fullwidthdisplay\relax
    }%
  \item[\noindent]}{%
  \endlist\egroup
  \ifx\@setabstract\relax \@setabstracta \fi}

\def\@setabstract{\@setabstracta \global\let\@setabstract\relax}
\def\@setabstracta{%
  \ifvoid\abstractbox
  \else
    \skip@25\p@ %plus 10\p@ \advance\skip@-\lastskip
    \advance\skip@-\baselineskip \vskip\skip@
    \box\abstractbox
    \prevdepth\z@ % because \abstractbox is a vtop
  \fi
}

\def\endtitlepage{\newpage}
\def\labelenumi{\theenumi)}
\def\theenumi{\@arabic\c@enumi}
\def\labelenumii{\theenumii)}
\def\theenumii{\@alph\c@enumii}
\def\p@enumii{\theenumi}
\def\labelenumiii{(\theenumiii)}
\def\theenumiii{\@roman\c@enumiii}
\def\p@enumiii{\theenumi(\theenumii)}
\def\labelenumiv{(\theenumiv)}
\def\theenumiv{\@Alph\c@enumiv}
\def\p@enumiv{\p@enumiii\theenumiii}
\def\labelitemi{$\m@th\bullet$}
\def\labelitemii{\bfseries --}% \upshape already done by \itemize
\def\labelitemiii{$\m@th\ast$}
\def\labelitemiv{$\m@th\cdot$}
\newenvironment{verse}{\let\\\@centercr
  \list{}{\itemsep\z@ \itemindent -1.5em\listparindent\itemindent
  \rightmargin\leftmargin \advance\leftmargin 1.5em}\item[]%
}{%
  \endlist
}
\let\endverse=\endlist % for efficiency

\newenvironment{quotation}{\list{}{%
    \leftmargin3pc \listparindent\normalparindent
    \itemindent\z@
    \rightmargin\leftmargin \parsep\z@ \@plus\p@}%
  \item[]%
}{%
  \endlist
}
\let\endquotation=\endlist % for efficiency

\newenvironment{quote}{%
  \list{}{\rightmargin\leftmargin}\item[]%
}{%
  \endlist
}
\let\endquote=\endlist % for efficiency

\def\trivlist{\parsep\parskip\@nmbrlistfalse
  \@trivlist \labelwidth\z@ \leftmargin\z@
  \itemindent\z@
  \let\@itemlabel\@empty
  \def\makelabel##1{\upshape##1}}

\renewenvironment{enumerate}{%
  \ifnum \@enumdepth >3 \@toodeep\else
      \advance\@enumdepth \@ne
      \edef\@enumctr{enum\romannumeral\the\@enumdepth}\list
      {\csname label\@enumctr\endcsname}{\usecounter
        {\@enumctr}\def\makelabel##1{\hss\llap{\upshape##1}}}\fi
}{%
  \endlist
}
\let\endenumerate=\endlist % for efficiency

\renewenvironment{itemize}{%
  \ifnum\@itemdepth>3 \@toodeep
  \else \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \list{\csname\@itemitem\endcsname}%
      {\def\makelabel##1{\hss\llap{\upshape##1}}}%
  \fi
}{%
  \endlist
}
\let\enditemize=\endlist % for efficiency

\newcommand{\descriptionlabel}[1]{\hspace\labelsep \upshape\bfseries #1:}
\newenvironment{description}{\list{}{%
  \advance\leftmargini6\p@ \itemindent-12\p@
  \labelwidth\z@ \let\makelabel\descriptionlabel}%
}{
  \endlist
}

\let\enddescription=\endlist % for efficiency
\let\upn=\textup

\AtBeginDocument{%
\newcommand\thepage{\arabic{page}}
\input glyphtounicode
\pdfgentounicode=1
\setlength\parindent{18pt}
  \settowidth\leftmargini{\labelenumi\hskip\labelsep}%
  \advance\leftmargini by \normalparindent
  \settowidth\leftmarginii{\labelenumii\hskip\labelsep}%
  \advance\leftmarginii by 6pt
  \settowidth\leftmarginiii{\labelenumiii\hskip\labelsep}%
  \advance\leftmarginiii by 6pt
  \settowidth\leftmarginiv{\labelenumiv\hskip\labelsep}%
  \advance\leftmarginiv by 10pt
  \leftmarginv=10pt
  \leftmarginvi=10pt
  \leftmargin=\leftmargini
  \labelsep=5pt
  \labelwidth=\leftmargini \advance\labelwidth-\labelsep
  \@listi}

\pagestyle{headings}


\newskip\listisep
\listisep\smallskipamount
\def\@listI{\leftmargin\leftmargini \parsep\z@skip
  \topsep 8pt \setlength{\itemsep}{6pt}
  \listparindent\normalparindent}
\let\@listi\@listI
\def\@listii{\leftmargin\leftmarginii
  \labelwidth\leftmarginii \advance\labelwidth-\labelsep
  \topsep\z@skip \parsep\z@skip \partopsep\z@skip \itemsep\z@skip}
\def\@listiii{\leftmargin\leftmarginiii
  \labelwidth\leftmarginiii \advance\labelwidth-\labelsep}
\def\@listiv{\leftmargin\leftmarginiv
  \labelwidth\leftmarginiv \advance\labelwidth-\labelsep}
\def\@listv{\leftmargin\leftmarginv
  \labelwidth\leftmarginv \advance\labelwidth-\labelsep}
\def\@listvi{\leftmargin\leftmarginvi
  \labelwidth\leftmarginvi \advance\labelwidth-\labelsep}


\def\@startsection#1#2#3#4#5#6{%
 \if@noskipsec \leavevmode \fi
 \par \@tempskipa #4\relax
 \@afterindenttrue
 \ifdim \@tempskipa <\z@ \@tempskipa -\@tempskipa \@afterindentfalse\fi
 \if@nobreak \everypar{}\else
     \addpenalty\@secpenalty\addvspace\@tempskipa\fi
 \@ifstar{\@dblarg{\@sect{#1}{\@m}{#3}{#4}{#5}{#6}}}%
         {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}

\def\@secnumfont{\bfseries}

\setcounter{tocdepth}{1}
\newcounter{toclink}\setcounter{toclink}{\m@ne}

\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
%    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
\ifappend
\ifnum #2=1
\protected@edef\@svsec{\appendixname~\@seccntformat{#1}\relax}%
\else
\protected@edef\@svsec{\@seccntformat{#1}\relax}%
\fi
\else
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
\fi
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M
          \ifnum #2>1\relax
             {#8}%
          \else
            {#8}%
          \fi
        \@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
\ifappend
\ifnum #2=1
    \addcontentsline{toc}{#1}{\appendixname~%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
\else
 \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
\fi
\else
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
\fi
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8.}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}

\newcounter{part}
\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\renewcommand\thepart          {\Roman{part}}
\renewcommand\thesection       {\arabic{section}}
\renewcommand\thesubsection    {\thesection.\arabic{subsection}}
\renewcommand\thesubsubsection {\thesubsection.\arabic{subsubsection}}
\renewcommand\theparagraph     {\thesubsubsection.\arabic{paragraph}}
\setcounter{secnumdepth}{3}

\def\partname{Part}

\newcommand\part{%
   \if@noskipsec \leavevmode \fi
   \par
   \addvspace{4ex}%
   \@afterindentfalse
   \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne
      \refstepcounter{part}%
      \addcontentsline{toc}{section}{\partname\nobreakspace\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >\m@ne
        \centering\Large\bfseries \partname\nobreakspace\thepart .\hspace{1ex}
     \fi
     \Large\bfseries #2%
     \par}%
    \nobreak
    \vskip 3ex
    \@afterheading}
\def\@spart#1{%
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \bfseries #1\par}%
     \nobreak
     \vskip 3ex
     \@afterheading}


%\def\part{\@startsection{section}{0}%
%\z@{-14pt plus -2.5pt minus -2pt}{14pt}%% % \z@{\linespacing\@plus\linespacing}{.5\linespacing}%
%  {\normalfont\Large\bfseries\centering\mathversion{bold}}}

\def\specialsection{\@startsection{section}{1}%
  \z@{\linespacing\@plus\linespacing}{.5\linespacing}%
  {\normalfont\Large\bfseries\raggedright}}


\def\section{\renewcommand{\@seccntformat}[1]{{{\csname the##1\endcsname.\enspace}}}
\@startsection{section}{1}%
  \z@{-14pt plus -2.5pt minus -2pt}{14pt}%
  {\normalfont\large\bfseries\centering\mathversion{bold}}}

\def\subsection{
\@startsection{subsection}{2}%
  \z@{-14.9pt plus -2.5pt minus -2pt}{14pt}%
  {\normalfont\bfseries\centering\mathversion{bold}}}

\def\subsubsection{
\@startsection{subsubsection}{3}{\z@}
{-13pt plus -2.5pt minus -10pt}{-1em}%
  {\normalfont\bf\mathversion{bold}%%added by Saravanan,M.
}}

\def\paragraph{\@startsection{paragraph}{4}%
  \z@\z@{-\fontdimen2\font}{}%
  \normalfont\itshape}

\def\subparagraph{\@startsection{subparagraph}{5}%
  \z@\z@{-\fontdimen2\font}%
  \normalfont\itshape}

\newif\ifappend % Are we in the Appendix?
\def\appendix{%
\normalsize\par%
\c@section\z@ \c@subsection\z@
 \@addtoreset{figure}{section}%
 \@addtoreset{table}{section}%
  \def\thesection{\@Alph\c@section}%
  \def\thesubsection{\@Alph\c@section.\@arabic\c@subsection}%
  \def\thesubsubsection{\@Alph\c@section.\@arabic\c@subsection.\@arabic\c@subsubsection}%
  \def\theequation{\@Alph\c@section.\@arabic\c@equation}%
  \def\thefigure{\@Alph\c@section\@arabic\c@figure}%
  \def\thetable{\@Alph\c@section\@arabic\c@table}%
  \setcounter{equation}\z@
  \appendtrue}

\def\appendixname{Appendix}

\newcommand{\@pnumwidth}{1.6em}
\newcommand{\@tocrmarg}{2.6em}
\setcounter{tocdepth}{1}
\def\@starttoc#1#2{\begingroup
  \par\removelastskip\vskip\z@skip
  \makeatletter
  \@input{\jobname.#1}%
  \if@filesw
    \@xp\newwrite\csname tf@#1\endcsname
    \immediate\@xp\openout\csname tf@#1\endcsname \jobname.#1\relax
  \fi
  \global\@nobreakfalse \endgroup
  \addvspace{20\p@\@plus14\p@}%
  \let\tableofcontents\relax
  }
\def\contentsname{}
\def\listfigurename{List of Figures}
\def\listtablename{List of Tables}
\def\tableofcontents{\@starttoc{toc}\contentsname}
\def\listoffigures{\@starttoc{lof}\listfigurename}
\def\listoftables{\@starttoc{lot}\listtablename}

\AtBeginDocument{%
  \@for\@tempa:=-1,0,1,2,3\do{%
    \@ifundefined{r@tocindent\@tempa}{%
      \@xp\gdef\csname r@tocindent\@tempa\endcsname{0pt}}{}%
  }%
}
\def\@writetocindents{%
  \begingroup
  \@for\@tempa:=-1,0,1,2,3\do{%
    \immediate\write\@auxout{%
      \string\newlabel{tocindent\@tempa}{%
        \csname r@tocindent\@tempa\endcsname}}
  }%
  \endgroup}%
\AtEndDocument{\@writetocindents}

\let\indentlabel\@empty

\def\@tochangmeasure#1{\sbox\z@{#1}%
  \ifdim\wd\z@>\csname r@tocindent\@toclevel\endcsname\relax
    \@xp\xdef\csname r@tocindent\@toclevel\endcsname{\the\wd\z@}%
  \fi
  }

\def\@toclevel{0}

\def\@tocline#1#2#3#4#5#6#7{\relax
  \ifnum #1>\c@tocdepth % then omit
  \else
    \par \addpenalty\@secpenalty\addvspace{#2}%
    \begingroup \hyphenpenalty\@M
    \@ifempty{#4}{%
      \@tempdima\csname r@tocindent\number#1\endcsname\relax
    }{%
      \@tempdima#4\relax
    }%
    \parindent\z@ \leftskip#3\relax \advance\leftskip\@tempdima\relax
    \rightskip\@pnumwidth plus1em \parfillskip-\@pnumwidth
    #5\leavevmode\hskip-\@tempdima \mathversion{bold} {\bfseries #6}\relax
    \hfil\hbox to\@pnumwidth{\@tocpagenum{\bfseries #7}}\par
    \nobreak
    \endgroup
  \fi}

\def\@tocpagenum#1{\hss{\mdseries #1}}

\def\@tocwrite#1{\@xp\@tocwriteb\csname toc#1\endcsname{#1}}


\def\@tocwriteb#1#2#3{%
  \begingroup
    \def\@tocline##1##2##3##4##5##6{%
      \ifnum##1>\c@tocdepth
      \else \sbox\z@{##5\let\indentlabel\@tochangmeasure##6}\fi}%
    \csname l@#2\endcsname{#1{\csname#2name\endcsname}{\@secnumber}{}}%
  \endgroup
  \addcontentsline{toc}{#2}%
    {\protect#1{\csname#2name\endcsname}{\@secnumber}{#3}}}

\def\l@section{\@tocline{1}{12pt}{0pt}{18pt}{}}

\newcommand{\tocsection}[3]{%
  \indentlabel{\@ifnotempty{#2}{\ignorespaces#1 #2\textbf{.}\quad}}#3}

\def\l@subsection{\@tocline{2}{12pt}{18pt}{24pt}{}}
\let\tocsubsection\tocsection
\def\l@subsubsection{\@tocline{3}{2pt}{3.5pc}{3pc}{}}
\let\tocparagraph\tocsection
\let\tocsubsubsection\tocsection
\def\l@part{\@tocline{-1}{12pt plus2pt}{0pt}{}{\bfseries}}
\let\tocpart\tocsection
\def\l@chapter{\@tocline{0}{8pt plus1pt}{0pt}{}{}}
\let\tocchapter\tocsection
\let\tocappendix\tocchapter
\def\l@figure{\@tocline{0}{3pt plus2pt}{0pt}{}{}}
\let\l@table=\l@figure

\def\refname{References}

\def\bibname{Bibliography}

\def\bibliographystyle#1{%
   \if@filesw\immediate\write\@auxout
    {\string\bibstyle{#1}}\fi
        \def\@tempa{#1}%
        \def\@tempb{amsplain}%
        \def\@tempc{}%
        \ifx\@tempa\@tempb
                \def\@biblabel##1{##1.}%
                \def\bibsetup{}%
        \else
                \def\bibsetup{\labelsep6\p@}%
        \ifx\@tempa\@tempc
                \def\@biblabel##1{}%
                \def\bibsetup{\labelwidth\z@ \leftmargin24\p@
                \itemindent-24\p@
                          \labelsep\z@ }%
        \fi
\fi}


\newenvironment{thebibliography}[1]{%
  \@xp\section\@xp*\@xp{\refname}%
  \normalfont\labelsep .5em\relax
  \renewcommand\theenumiv{\arabic{enumiv}}\let\p@enumiv\@empty
  \list{\@biblabel{\theenumiv}}{\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth \advance\leftmargin\labelsep
    \setlength{\itemsep}{6.75pt}
    \usecounter{enumiv}}%
  \sloppy \clubpenalty\@M \widowpenalty\clubpenalty
  \sfcode`\.=\@m
}{%
  \def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
  \endlist
}

\def\bysame{\leavevmode\hbox to3em{\hrulefill}\thinspace}

\def\newblock{}

\newcommand\MR[1]{\relax\ifhmode\unskip\spacefactor3000 \space\fi
  \def\@tempa##1:##2:##3\@nil{%
    \ifx @##2\@empty##1\else\textbf{##1:}##2\fi}%
  \MRhref{#1}{MR \@tempa#1:@:\@nil}}

\newcommand\URL{\begingroup
  \def\@sverb##1{%
    \def\@tempa####1##1{\@URL{####1}\egroup\endgroup}%
    \@tempa}%
  \verb}

\let\URLhref\@gobble

\def\@URL#1{\URLhref{#1}#1}

\newif\if@restonecol

\def\@makefnmark{$^{\@thefnmark}$}%
\renewcommand\footnoterule{\begingroup\leftskip\z@\noindent
  \rule{12pc}{0.5\p@}\vspace{6\p@}\endgroup}

\newcommand\@makefntext[1]{%
  \begingroup
    \footnotesize
    \setlength\parindent{1em}%
    \@makefnmark\ignorespaces #1%
  \endgroup}
  
\def\openfootnote#1{{\def\@makefnmark{}\footnotetext[0]{#1}}}

\hfuzz=1pt \vfuzz=\hfuzz
\def\sloppy{\tolerance9999 \emergencystretch 3em\relax}

\setcounter{topnumber}{4}
\setcounter{bottomnumber}{4}
\setcounter{totalnumber}{4}
\setcounter{dbltopnumber}{4}

\renewcommand{\topfraction}{.97}
\renewcommand{\bottomfraction}{.97}
\renewcommand{\textfraction}{.03}
\renewcommand{\floatpagefraction}{.9}
\renewcommand{\dbltopfraction}{.97}
\renewcommand{\dblfloatpagefraction}{.9}

\setlength{\floatsep}{22pt plus 4pt minus 2pt}
\setlength{\textfloatsep}{22pt plus 4pt minus 2pt}
\setlength{\intextsep}{12pt plus 6pt minus 4pt}
\setlength{\dblfloatsep}{22pt plus 4pt minus 2pt}
\setlength{\dbltextfloatsep}{15pt plus 8pt minus 5pt}
\setlength{\@fptop}{0pt}% removed ``plus 1fil''
\setlength{\@fpsep}{8pt}% removed ``plus 2fil''
\setlength{\@fpbot}{0pt plus 1fil}
\setlength{\@dblfptop}{0pt}% removed ``plus 1fil''
\setlength{\@dblfpsep}{8pt}% removed ``plus 2fil''
\setlength{\@dblfpbot}{0pt plus 1fil}

\newcommand{\fps@figure}{tbp}
\newcommand{\fps@table}{tbp}
\newcounter{figure}

\def\@captionheadfont{\normalfont}
\def\@captionfont{\normalfont}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\ \thefigure}
\def\figurename{Figure}

\newenvironment{figure}{%
  \@float{figure}%
}{%
  \end@float
}

\newcounter{table}

\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\ \thetable}
\def\tablename{Table}

\newenvironment{table}{%
  \@float{table}%
}{%
  \end@float
}

\def\@floatboxreset{\global\@minipagefalse \centering}

\long\def\@makecaption#1#2{%
  \setbox\@tempboxa\vbox{\color@setgroup
    \advance\hsize-2\captionindent\noindent
    \@captionfont\@captionheadfont#1\@xp\@ifnotempty\@xp
        {\@cdr#2\@nil}{:\@captionfont\upshape\enspace#2}%
    \unskip\kern-2\captionindent\par
    \global\setbox\@ne\lastbox\color@endgroup}%
  \ifhbox\@ne % the normal case
    \setbox\@ne\hbox{\unhbox\@ne\unskip\unskip\unpenalty\unkern}%
  \fi
  \ifdim\wd\@tempboxa=\z@ % this means caption will fit on one line
    \setbox\@ne\hbox to\columnwidth{\hss\kern-2\captionindent\box\@ne\hss}%
  \else % tempboxa contained more than one line
    \setbox\@ne\vbox{\unvbox\@tempboxa\parskip\z@skip
        \noindent\unhbox\@ne\advance\hsize-2\captionindent\par}%
\fi
  \ifnum\@tempcnta<64 % if the float IS a figure...
    \addvspace\abovecaptionskip
    \moveright\captionindent\box\@ne
  \else % if the float IS NOT a figure...
    \moveright\captionindent\box\@ne
    \nobreak
    \vskip\belowcaptionskip
  \fi
\relax
}

\newskip\abovecaptionskip\abovecaptionskip=12pt \relax
\newskip\belowcaptionskip\belowcaptionskip=12pt \relax
\newdimen\captionindent \captionindent=0pc

\RequirePackage{amsthm}[1996/09/24]

\def\@swapped#1#2{#2%
  \@ifnotempty{#1}{\@addpunct{.}\quad#1\unskip}}

\def\thmhead@plain#1#2#3{%
\thm@headsep=8pt\relax
  \thmname{#1}\thmnumber{\@ifnotempty{#1}{ }\@upn{#2}}%
  \thmnote{ \textmd{\bfseries (#3)}}}

\def\swappedhead@plain#1#2#3{%
  \thmnumber{\@upn{#2}}\thmname{\@ifnotempty{#2}{. }#1}%
  \thmnote{ \textmd{\bfseries (#3)}}}

\def\th@plain{%
  \let\thmhead\thmhead@plain \let\swappedhead\swappedhead@plain
  \thm@preskip 0.9\baselineskip\@plus.2\baselineskip\@minus.2\baselineskip
  \thm@postskip\thm@preskip
  \itshape}

\def\th@definition{%
  \let\thmhead\thmhead@plain \let\swappedhead\swappedhead@plain
  \thm@preskip 0.9\baselineskip\@plus.2\baselineskip\@minus.2\baselineskip
  \thm@postskip\thm@preskip
  \upshape}

\def\th@remark{%
%  \thm@headfont{\scshape}% heading font bold
  \let\thmhead\thmhead@plain \let\swappedhead\swappedhead@plain
  \thm@preskip 0.9\baselineskip\@plus.2\baselineskip\@minus.2\baselineskip
  \thm@postskip\thm@preskip
  \upshape}

\if@compatibility
\let\@newpf\proof \let\proof\relax \let\endproof\relax
\newenvironment{pf}{\@newpf[\proofname]}{\qed\endtrivlist}
\newenvironment{pf*}[1]{\@newpf[#1]}{\qed\endtrivlist}
\fi

\def\nonbreakingspace{\unskip\nobreak\ \ignorespaces}

\def~{\protect\nonbreakingspace}

\def\@biblabel#1{\@ifnotempty{#1}{[#1]}}

\def\@cite#1#2{{%
  \m@th\upshape\mdseries[{#1\if@tempswa, #2\fi}]}}
\@ifundefined{cite }{%
  \expandafter\let\csname cite \endcsname\cite
  \edef\cite{\@nx\protect\@xp\@nx\csname cite \endcsname}%
}{}


\def\fullwidthdisplay{\displayindent\z@ \displaywidth\columnwidth}

\edef\@tempa{\noexpand\fullwidthdisplay\the\everydisplay}
\everydisplay\expandafter{\@tempa}
\newcommand\seename{see also}%
\newcommand\see[2]{{\em \seename\/} #1}%
\newcommand\printindex{\@input{\jobname.ind}}%

\DeclareRobustCommand\textprime{\leavevmode
  \raise.8ex\hbox{\check@mathfonts\the\scriptfont2 \char48 }}

\def\calclayout{
\setlength{\textheight}{39\@bls}
\addtolength\textheight{\topskip}
\setlength\headheight{35.5\p@}          % height of running head
\setlength\topmargin{32.6\p@}            % top margin 3pc, 9pt
\addtolength\topmargin{-6\p@}         %
\addtolength\topmargin{-1in}         % subtract out the 1 inch driver margin
\setlength\topskip{8\p@}            % height of first line of text%% {10\p@}
\setlength\headsep{30\p@}          % space below running head --
\addtolength\headsep{-\topskip}      %   base to base with first line of text
\setlength{\textwidth}{30pc}

\setlength\oddsidemargin{83pt}
\addtolength\oddsidemargin{-1in}    % subtract out the 1 inch driver margin
\setlength\@tempdima{\paperwidth}
\addtolength\@tempdima{-\textwidth}
\addtolength\@tempdima{-83pt}
\setlength\evensidemargin{\@tempdima}
\addtolength\evensidemargin{-1in}
\relax}

\calclayout % initialize

\newcommand{\authnames}[1]{\iffin\def\authornames{#1}\fi}
\newcommand{\beginningpage}[1]{\iffin\setcounter{page}{#1}\def\beginpage{#1}\fi}


\renewenvironment{proof}[1][\proofname]{\par
  \normalfont
  \topsep6\p@\@plus6\p@ \trivlist
  \item[\hskip\labelsep\itshape
    #1\@addpunct{.}]\ignorespaces
}{%
  \qed\endtrivlist
}

\RequirePackage{amssymb}
\renewcommand{\openbox}{\leavevmode
  \hbox to .77778em{\hfil${\square}$\hfil}}

\newcommand{\papnum}[1]{\def\papernum{#1}}

\medmuskip=4mu%
\thickmuskip=5mu%

\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301

\clubpenalty 10000
\widowpenalty 10000
\frenchspacing

\displaywidowpenalty 100
\predisplaypenalty   10000
\postdisplaypenalty  2500

\interlinepenalty 0

\brokenpenalty 10000

\lefthyphenmin=3
\righthyphenmin=3

\newcommand{\email}[1]{{\footnotesize {\it E-mail address}: {\tt #1\vphantom{y}}}}
\newcommand{\emails}[2]{{\footnotesize {\it E-mail address}: {\tt #1}; {\tt #2\vphantom{y}}}}

\newcommand{\received}[1]{\vbox{\vspace*{14pt}Received\ #1}}
\newcommand{\accepted}[1]{\vbox{Accepted\ #1}}

\def\address#1{\begingroup\setlength{\parindent}{0pt}%
\vspace*{15pt}
\fontsize{10}{8}\selectfont\sc #1
\endgroup}



\usepackage[pdfpagelabels=true]{hyperref}
\usepackage[sort&compress]{natbib}
\bibpunct{[}{]}{,}{n}{}{;}

\Year{2023}

\def\toprule{\hline}
\def\midrule{\hline\noalign{\vskip3pt}}
\def\botrule{\hline\noalign{\vskip7pt}}
\def\tabnote#1#2#3{\multicolumn{#1}{@{}#2@{}}{#3}}


\newcommand{\clearemptydoublepage}{\clearpage{\thispagestyle{empty}\cleardoublepage}}
\AtEndDocument{%
\clearemptydoublepage
}

\newcommand\blfootnote[1]{%
  \begingroup
  \renewcommand\thefootnote{}\footnote{#1}%
  \addtocounter{footnote}{-1}%
  \endgroup
}

\endinput
