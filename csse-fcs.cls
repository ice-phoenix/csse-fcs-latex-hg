%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LaTeX class for dissertations
%
% Designed for SPbSPU, FCS, CSSE department
%
% Created by: Marat Akhin (akhin@kspt.ftk.spbstu.ru)
% Based on: `disser` package
% Distrubuted under: LPPL 1.3+
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{csse-fcs}[2012/09/18 CSSE FCS dissertation class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{kvoptions}
\RequirePackage{geometry}
\RequirePackage{nomencl}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\SetupKeyvalOptions{
  family=csse,
  prefix=csse@
}
\DeclareStringOption{titlefile}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\if@afivepaper\@afivepapertrue
\newif\if@afourpaper\@afourpaperfalse
\DeclareOption{a5paper}{
  \@afivepapertrue
  \@afourpaperfalse
}
\DeclareOption{a4paper}{
  \@afivepaperfalse
  \@afourpapertrue
}
\if@afivepaper
  \PassOptionsToClass{a5paper,10pt}{disser}
\fi
\if@afourpaper
  \PassOptionsToClass{a4paper,14pt}{disser}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\if@mastertitle\@mastertitletrue
\DeclareOption{master}{
  \@mastertitletrue
}
\ifx\csse@titlefile\@empty
  \if@mastertitle \renewcommand*{\csse@titlefile}{csse-master.rtx} \fi
\fi
\AtEndOfClass{\input{\csse@titlefile}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\PassOptionsToClass{
  twoside,
  titlepage,
  openright,
  onecolumn
}{disser}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{disser}}

\ProcessKeyvalOptions{kspt}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass{disser}[2011/11/29]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\if@afivepaper
  \renewcommand\@approved{
    \begin{tabbing}
      \hspace{5.5cm}\={\approved}\\
      \>\appos\\[1ex]
      \>\makebox[5cm][r]{\hrulefill\ \@apname}\\[1ex]
      \>\makebox[1cm][r]{<<\hrulefill>>}
      \makebox[4cm][r]{\hrulefill\ \@date\,\yearname}
    \end{tabbing}
  }
  \geometry{
    paper=a5paper,
    nohead=true,
    includefoot=true,
    left=18mm,
    right=18mm,
    top=18mm,
    bottom=18mm,
    footskip=10mm
  }
  \setlength{\fieldhshift}{5cm}
  \setlength{\parindent}{0.7cm}
  \singlespacing
\fi

\if@afourpaper
  \geometry{
    paper=a4paper,
    nohead=true,
    includefoot=true,
    left=25mm,
    right=25mm,
    top=25mm,
    bottom=25mm,
    footskip=15mm
  }
  \setlength{\fieldhshift}{8.5cm}
  \onehalfspacing
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\blankpagecontent[1]{
  \gdef\@blankpagecontent{#1}
}
\blankpagecontent{}
\newcommand\makeblankpage{
  \ifx\@blankpagecontent
    \empty
  \else
    \begin{center}
      \@blankpagecontent
    \end{center}
  \fi
  \thispagestyle{empty}
  \clearpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\csseabstractname{%
  \CYRR\CYRE\CYRF\CYRE\CYRR\CYRA\CYRT
}
\newcommand\stats@report{%
  \CYRO\cyrt\cyrch\cyre\cyrt%
}
\newcommand\stats@page{%
  \cyrs\cyrt\cyrr.%
}
\newcommand\stats@fig{%
  \cyrr\cyri\cyrs.%
}
\newcommand\stats@table{%
  \cyrt\cyra\cyrb\cyrl.%
}
\newcommand\stats@cite{%
  \cyri\cyrs\cyrt.%
}
\newcommand\stats@appendix{%
  \cyrp\cyrr\cyri\cyrl.%
}
\newcommand\stats[5]{%
  \stats@report%
  \ifx&#1&\empty%
  \else{, #1~\stats@page}%
  \fi%
  \ifx&#2&\empty%
  \else{, #2~\stats@fig}%
  \fi%
  \ifx&#3&\empty%
  \else{, #3~\stats@table}%
  \fi%
  \ifx&#4&\empty%
  \else{, #4~\stats@cite}%
  \fi%
  \ifx&#5&\empty%
  \else{, #5~\stats@appendix}%
  \fi%
}

\newcommand\pagecount[1]{%
  \gdef\@pagecount{#1}
}\pagecount{}
\newcommand\figcount[1]{%
  \gdef\@figcount{#1}
}\figcount{}
\newcommand\tablecount[1]{%
  \gdef\@tablecount{#1}
}\tablecount{}
\newcommand\citecount[1]{%
  \gdef\@citecount{#1}
}\citecount{}
\newcommand\appendixcount[1]{%
  \gdef\@appendixcount{#1}
}\appendixcount{}

\newcommand\abstractcontent[1]{%
  \gdef\@abstractcontent{#1}
}\abstractcontent{}

\newcommand\makeabstract{%
  \clearpage
  \thispagestyle{empty}%
  %
  \@makeschapterhead{\csseabstractname}%
  \@afterheading%
  %
  \begin{center}
  \stats{%
    \@pagecount}{%
    \@figcount}{%
    \@tablecount}{%
    \@citecount}{%
    \@appendixcount%
  }
  \end{center}
  %
  \begin{center}
    \MakeUppercase{\@keywords}
  \end{center}
  %
  \@abstractcontent
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Default settings

\institution{{\cyr\CYRS\cyra\cyrn\cyrk\cyrt-\CYRP\cyre\cyrt\cyre\cyrr\cyrb\cyru\cyrr\cyrg\cyrs\cyrk\cyri\cyrishrt\ \cyrg\cyro\cyrs\cyru\cyrd\cyra\cyrr\cyrs\cyrt\cyrv\cyre\cyrn\cyrn\cyrery\cyrishrt\ \cyrp\cyro\cyrl\cyri\cyrt\cyre\cyrh\cyrn\cyri\cyrch\cyre\cyrs\cyrk\cyri\cyrishrt\ \cyru\cyrn\cyri\cyrv\cyre\cyrr\cyrs\cyri\cyrt\cyre\cyrt}}
\faculty{{\cyr\CYRF\cyra\cyrk\cyru\cyrl\cyrsftsn\cyrt\cyre\cyrt\ \cyrt\cyre\cyrh\cyrn\cyri\cyrch\cyre\cyrs\cyrk\cyro\cyrishrt\ \cyrk\cyri\cyrb\cyre\cyrr\cyrn\cyre\cyrt\cyri\cyrk\cyri}}
\department{{\cyr\CYRK\cyra\cyrf\cyre\cyrd\cyrr\cyra\ \cyrk\cyro\cyrm\cyrp\cyrsftsn\cyryu\cyrt\cyre\cyrr\cyrn\cyrery\cyrh\ \cyrs\cyri\cyrs\cyrt\cyre\cyrm\ \cyri\ \cyrp\cyrr\cyro\cyrg\cyrr\cyra\cyrm\cyrn\cyrery\cyrh\ \cyrt\cyre\cyrh\cyrn\cyro\cyrl\cyro\cyrg\cyri\cyrishrt}}

\city{{\cyr\CYRS\cyra\cyrn\cyrk\cyrt-\CYRP\cyre\cyrt\cyre\cyrr\cyrb\cyru\cyrr\cyrg}}
\date{\number\year}
