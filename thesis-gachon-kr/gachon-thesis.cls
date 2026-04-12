%% gachon-thesis.cls
%% 가천대학교 일반대학원 학위논문 (이공·자연계열) LaTeX 문서클래스
%% 근거: (국문)학위논문 작성지침.pdf

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gachon-thesis}[2026/04/12 Gachon University Thesis Class]

\LoadClass[11pt,twoside,openright]{book}

% ---------------------------------------------------------------
% 용지 및 여백 — B5 (190 mm x 260 mm)
% 위 20 / 아래 15 / 좌우 25 / 머리말 10 / 꼬리말 15 / 제본 0
% ---------------------------------------------------------------
\RequirePackage[
  paperwidth=190mm,
  paperheight=260mm,
  top=20mm,
  bottom=15mm,
  left=25mm,
  right=25mm,
  headheight=10mm,
  headsep=4mm,
  footskip=15mm,
  bindingoffset=0mm
]{geometry}

% ---------------------------------------------------------------
% 한글 조판 (XeLaTeX / LuaLaTeX)
% ---------------------------------------------------------------
\RequirePackage[hangul]{kotex}
\RequirePackage{fontspec}

% ---------------------------------------------------------------
% 수식, 그림, 표, 캡션
% ---------------------------------------------------------------
\RequirePackage{amsmath,amssymb}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{array}
\RequirePackage{caption}
\captionsetup{font={small},labelfont={bf},labelsep=period}

% ---------------------------------------------------------------
% 줄간격 (본문 180~200%)
% ---------------------------------------------------------------
\RequirePackage{setspace}
\setstretch{1.9}

% ---------------------------------------------------------------
% 문단 들여쓰기 (2칸 ≈ 2em)
% ---------------------------------------------------------------
\RequirePackage{indentfirst}
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt}

% ---------------------------------------------------------------
% 본문 / 각주 글자 크기
% ---------------------------------------------------------------
\renewcommand{\normalsize}{\fontsize{11pt}{20pt}\selectfont}
\renewcommand{\footnotesize}{\fontsize{9pt}{11pt}\selectfont}

% ---------------------------------------------------------------
% 장/절/항 제목 서식 (이공계열 번호 체계)
%   제1장  →  1.1  →  1.1.1  →  (1)  →  ①
% ---------------------------------------------------------------
\RequirePackage{titlesec}
\RequirePackage{titletoc}

% 장: "제N장 서 론" 16pt 진하게, 중앙 정렬
\titleformat{\chapter}[block]
  {\filcenter\normalfont\fontsize{16pt}{20pt}\selectfont\bfseries}
  {제\thechapter 장}
  {1em}
  {}
\titlespacing*{\chapter}{0pt}{30pt}{24pt}

% 장*: 번호 없는 장 (국문초록, 목차, 참고문헌 등)
\titleformat{name=\chapter,numberless}[block]
  {\filcenter\normalfont\fontsize{16pt}{20pt}\selectfont\bfseries}
  {}{0pt}{}
\titlespacing*{name=\chapter,numberless}{0pt}{30pt}{24pt}

% 절: "1.1 제목" 14pt 진하게
\titleformat{\section}
  {\normalfont\fontsize{14pt}{18pt}\selectfont\bfseries}
  {\thesection}
  {0.75em}
  {}
\titlespacing*{\section}{0pt}{16pt}{8pt}

% 항: "1.1.1 제목" 12pt 진하게
\titleformat{\subsection}
  {\normalfont\fontsize{12pt}{16pt}\selectfont\bfseries}
  {\thesubsection}
  {0.5em}
  {}
\titlespacing*{\subsection}{0pt}{12pt}{6pt}

% 세부항: "(1) 제목" 11pt 진하게
\renewcommand{\thesubsubsection}{(\arabic{subsubsection})}
\titleformat{\subsubsection}
  {\normalfont\fontsize{11pt}{15pt}\selectfont\bfseries}
  {\thesubsubsection}
  {0.5em}
  {}
\titlespacing*{\subsubsection}{0pt}{10pt}{4pt}

% 최하위: "① 제목" 11pt 진하게 (runin)
\newcommand{\circlednum}[1]{%
  \ifcase#1\or①\or②\or③\or④\or⑤\or⑥\or⑦\or⑧\or⑨\or⑩\or⑪\or⑫\or⑬\or⑭\or⑮\fi}
\renewcommand{\theparagraph}{\circlednum{\value{paragraph}}}
\titleformat{\paragraph}[runin]
  {\normalfont\fontsize{11pt}{15pt}\selectfont\bfseries}
  {\theparagraph}
  {0.5em}
  {}
\titlespacing*{\paragraph}{0pt}{6pt}{0.75em}

% ---------------------------------------------------------------
% 목차 / 표목차 / 그림목차 서식
% ---------------------------------------------------------------
% 장: "제N장 ... 쪽" 13pt 진하게
\titlecontents{chapter}
  [0pt]
  {\addvspace{1.2em}\normalfont\fontsize{13pt}{16pt}\selectfont\bfseries}
  {\makebox[5.5em][l]{제\thecontentslabel 장}}
  {}
  {\titlerule*[0.5pc]{.}\contentspage}

% 절: "1.1 ... 쪽" 11pt
\titlecontents{section}
  [3.5em]
  {\addvspace{0.3em}\normalfont\fontsize{11pt}{14pt}\selectfont}
  {\contentslabel{3em}}
  {\hspace*{-3em}}
  {\titlerule*[0.5pc]{.}\contentspage}

% 항: "1.1.1 ..." 11pt
\titlecontents{subsection}
  [6em]
  {\normalfont\fontsize{11pt}{14pt}\selectfont}
  {\contentslabel{3.2em}}
  {\hspace*{-3.2em}}
  {\titlerule*[0.5pc]{.}\contentspage}

% ---------------------------------------------------------------
% 머리말/꼬리말
% ---------------------------------------------------------------
\RequirePackage{fancyhdr}
\pagestyle{plain}  % 쪽번호만 하단 중앙

% ---------------------------------------------------------------
% 하이퍼링크 (PDF 북마크, 인쇄본에서는 색 제거)
% ---------------------------------------------------------------
\RequirePackage[hidelinks,bookmarks=true,unicode=true]{hyperref}

% ---------------------------------------------------------------
% 한글 로컬라이제이션
% ---------------------------------------------------------------
\AtBeginDocument{%
  \renewcommand{\contentsname}{목\quad 차}%
  \renewcommand{\listtablename}{표\quad 목\quad 차}%
  \renewcommand{\listfigurename}{그\,림\,목\,차}%
  \renewcommand{\bibname}{참고문헌}%
  \renewcommand{\appendixname}{부\quad 록}%
  \renewcommand{\figurename}{그림}%
  \renewcommand{\tablename}{표}%
}

% ---------------------------------------------------------------
% 표/그림 번호를 "장-일련번호"로 (예: 표 2-1, 그림 2-1)
% ---------------------------------------------------------------
\renewcommand{\thetable}{\thechapter-\arabic{table}}
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}

\endinput
