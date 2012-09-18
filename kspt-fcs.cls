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
\ProvidesClass{kspt-fcs}[2012/09/18 CSSE FCS dissertation class]

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
  \PassOptionsToClass{a4paper14pt}{disser}
\fi

\PassOptionsToClass{
  twoside,
  titlepage,
  openright,
  onecolumn
}{disser}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{disser}}
\ProcessOptions\relax

\LoadClass{disser}[2011/11/29]

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
\fi
