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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{kvoptions}
\RequirePackage{geometry}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\SetupKeyvalOptions{
  family=kspt,
  prefix=kspt@
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
\ifx\kspt@titlefile\@empty
  \if@mastertitle \renewcommand*{\kspt@titlefile}{csse-master.rtx} \fi
\fi
\AtEndOfClass{\input{\kspt@titlefile}}

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
\fi

% Default settings

% \institution{Санкт-Петербургский государственный политехнический университет}
% \faculty{Факультет технической кибернетики}
% \department{Кафедра компьютерных систем и программных технологий}

% \city{Санкт-Петербург}
% \date{\number\year}
