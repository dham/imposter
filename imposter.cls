%% 
%% This is file `imposter.cls'
%% 
%% Copyright (C) 1997-2004 Gerlinde Kettl and Matthias Weiser
%%               2005 Delft University of Technology, David Ham
%%               2007 Imperial College London, David Ham
%%
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.2
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.2 or later is part of all distributions of LaTeX
%% version 1999/12/01 or later.
%%
%% Problems, bugs and comments to 
%% David.Ham@imperial.ac.uk
%% 
\ProvidesClass{imposter}[2007/09/04 v0.1 Improved poster class]
\NeedsTeXFormat{LaTeX2e}[1995/06/01]
\LoadClass{article}

\newif\ifportrait
\newif\ifdraft

\DeclareOption{landscape}{
\portraitfalse
\setlength{\paperwidth}{1189mm}
\setlength{\paperheight}{841mm}
\setlength{\textwidth}{1189mm}
\setlength{\textheight}{841mm}
}
\DeclareOption{portrait}{
\portraittrue
\setlength{\paperwidth}{841mm}
\setlength{\paperheight}{1189mm}
\setlength{\textwidth}{841mm}
\setlength{\textheight}{1189mm}
}
\DeclareOption{draft}{
\drafttrue
}
\DeclareOption{final}{
\draftfalse
}
\DeclareOption*{\PackageWarning{imposter}{Unknown Option \CurrentOption}}
\ExecuteOptions{portrait,final}
\ProcessOptions\relax

\RequirePackage{a0size}
\RequirePackage{color}
\RequirePackage{pstricks}
\RequirePackage{graphicx}
\RequirePackage{ifthen}
\RequirePackage{calc}

% %% Set no margins.

\setlength{\headheight}{0 cm}
\setlength{\headsep}{0 cm}
\setlength{\topmargin}{0 cm}
\setlength{\oddsidemargin}{0 cm}
\setlength{\hoffset}{-1in}
\setlength{\voffset}{-1in}
 
%{\fontsize{12}{14}\selectfont}
%{\fontsize{14.4}{18}\selectfont}   
\renewcommand{\tiny}{\fontsize{17.28}{22}\selectfont}
\renewcommand{\scriptsize}{\fontsize{20.74}{25}\selectfont}
\renewcommand{\footnotesize}{\fontsize{24.88}{30}\selectfont}
\renewcommand{\small}{\fontsize{29.86}{37}\selectfont}

\renewcommand{\normalsize}{\fontsize{35.83}{45}\selectfont}
\renewcommand{\large}{\fontsize{43}{54}\selectfont}
\renewcommand{\Large}{\fontsize{51.6}{64}\selectfont}
\renewcommand{\LARGE}{\fontsize{61.92}{77}\selectfont}
\renewcommand{\huge}{\fontsize{74.3}{93}\selectfont}
\renewcommand{\Huge}{\fontsize{89.16}{112}\selectfont}
\newcommand{\veryHuge}{\fontsize{107}{134}\selectfont}
\newcommand{\VeryHuge}{\fontsize{107}{134}\selectfont}
\newcommand{\VERYHuge}{\fontsize{107}{134}\selectfont}

\setlength\smallskipamount{6pt plus 2pt minus 2pt}
\setlength\medskipamount{12pt plus 4pt minus 4pt}
\setlength\bigskipamount{24pt plus 8pt minus 8pt}

\setlength\abovecaptionskip{25pt}
\setlength\belowcaptionskip{0pt}
\setlength\abovedisplayskip{25pt plus 6pt minus 15 pt}
\setlength\abovedisplayshortskip{0pt plus 6pt}
\setlength\belowdisplayshortskip{13pt plus 7pt minus 6pt}
\setlength\belowdisplayskip\abovedisplayskip

\renewcommand{\familydefault}{\sfdefault}\normalsize

% These are just changed for colour.
\renewcommand\section{\@startsection 
                             {section}{1}{0mm}                        % name, level, indent
                             {-\baselineskip}                         % beforeskip
			     {0.5\baselineskip}                       % afterskip
                             {\normalfont\large\bfseries\color{postercolor}\IMsectionstyle}}
\renewcommand\subsection{\@startsection
                             {subsection}{2}{0mm}                     % name, level, indent
                             {-\baselineskip}                         % beforeskip
			     {0.5\baselineskip}                       % afterskip
                             {\normalfont\bfseries\color{postercolor}\IMsubsectionstyle}}

% No section numbers.
\setcounter{secnumdepth}{-2}

% Prepare to save the poster contents.
\newsavebox{\posterbox}

% The substitutable components.
\newcommand{\IMtitle}{}
\newcommand{\IMauthor}{}
\newcommand{\IMaddress}{}
\newcommand{\IMdepartment}{}
\newcommand{\IMinstitution}{}
\newcommand{\IMurl}{}
\newcommand{\IMgroup}{Applied Modelling and Computation Group}
\newcommand{\IMproject}{Imperial College Ocean Model}
\providecommand{\title}[1]{#1}
\providecommand{\author}[1]{#1}
\providecommand{\address}[1]{#1}
\providecommand{\department}[1]{#1}
\providecommand{\institution}[1]{#1}
\providecommand{\email}[1]{#1}
\providecommand{\url}[1]{#1}
\providecommand{\group}[1]{#1}
\providecommand{\project}[1]{#1}
\renewcommand{\title}[1]{\renewcommand{\IMtitle}{#1}}
\renewcommand{\author}[1]{\renewcommand{\IMauthor}{#1}}
\renewcommand{\address}[1]{\renewcommand{\IMaddress}{#1}}
% Email is an alias for address. This is for backward compatibility.
\renewcommand{\email}[1]{\renewcommand{\IMaddress}{#1}}
\renewcommand{\department}[1]{\renewcommand{\IMdepartment}{#1}}
\renewcommand{\institution}[1]{\renewcommand{\IMinstitution}{#1}}
\renewcommand{\url}[1]{\renewcommand{\IMurl}{#1}}
\renewcommand{\group}[1]{\renewcommand{\IMgroup}{#1}}
\renewcommand{\project}[1]{\renewcommand{\IMproject}{#1}}

% Colours for the title. Which of these are used and what their default
% values depends on the poster style.
\newcommand{\IMtitlecolor}{}
\providecommand{\titlecolor}[2]{#1}
\renewcommand{\titlecolor}[2]{\renewcommand{\IMtitlecolor}{#2}
                              \definecolor{titlecolor}{#1}{#2}}
\newcommand{\IMtitlebackcolor}{}
\providecommand{\titlebackcolor}[2]{#1}
\renewcommand{\titlebackcolor}[2]{\renewcommand{\IMtitlebackcolor}{#2}
                                  \definecolor{titlebackcolor}{#1}{#2}}
\newcommand{\IMtitleframecolor}{}
\providecommand{\titleframecolor}[2]{#1}
\renewcommand{\titleframecolor}[2]{\renewcommand{\IMtitleframecolor}{#1}
                                   \definecolor{titleframecolor}{#1}{#2}}

% Colour for things which are not by definition TU blue.
% This defaults to TU Blue.
\newcommand{\IMpostercolor}{}
\providecommand{\postercolor}[2]{#1}
\renewcommand{\postercolor}[2]{
% Only change colours which have not already been set.
\definecolor{postercolor}{#1}{#2}
\ifthenelse{\equal{\IMtitlebackcolor}{}}{\definecolor{titlebackcolor}{#1}{#2}}{}
\ifthenelse{\equal{\IMtitleframecolor}{}}{\definecolor{titleframecolor}{#1}{#2}}{}
\renewcommand{\IMpostercolor}{#2}}

% Default to TU Blue
\definecolor{postercolor}{cmyk}{1,0,0,0}

% Commands enabling customisation of section headers.
\newcommand{\IMsectionstyle}{}
\providecommand{\sectionstyle}[1]{#1}
\renewcommand{\sectionstyle}[1]{\renewcommand{\IMsectionstyle}{#1}}
\newcommand{\IMsubsectionstyle}{}
\providecommand{\subsectionstyle}[1]{#1}
\renewcommand{\subsectionstyle}[1]{\renewcommand{\IMsubsectionstyle}{#1}}

% Primary logo
\newcommand{\IMlogo}{}
\newcommand{\IMlogodim}{[]}
\providecommand{\logo}[2][]{#1}
\renewcommand{\logo}[2][]{\renewcommand{\IMlogo}{#2}\renewcommand{\IMlogodim}{[#1]}}

% Commands enabling the insertion of additional logos.
\newcommand{\IMlogoa}{}
\newcommand{\IMlogoadim}{[]}
\providecommand{\logoa}[2][]{#1}
\renewcommand{\logoa}[2][]{\renewcommand{\IMlogoa}{#2}\renewcommand{\IMlogoadim}{[#1]}}
\newcommand{\IMlogob}{}
\providecommand{\logob}[1]{#1}
\renewcommand{\logob}[1]{\renewcommand{\IMlogob}{#1}}


% Select your poster style.
\newcommand{\IMposterstyle}{\tudelftstyleposter}
\newcommand{\IMposterargs}{}
\newcommand{\posterstyle}[2][]
{\renewcommand{\IMposterargs}{#1}
  \ifthenelse{\equal{#2}{tudelftstyle}}
  {\renewcommand{\IMposterstyle}{\tudelftstyleposter}}
  {\ifthenelse{\equal{#2}{block}}
    {\renewcommand{\IMposterstyle}{\blockstyleposter}}
    {\ifthenelse{\equal{#2}{icstyle}}
      {\renewcommand{\IMposterstyle}{\icstyleposter}
        \icstyleposterprehook}
      {\ifthenelse{\equal{#2}{amcgstyle}}
        {\renewcommand{\IMposterstyle}{\amcgstyleposter}
          \amcgstyleposterprehook}
        {\ifthenelse{\equal{#2}{granthamstyle}}
          {\renewcommand{\IMposterstyle}{\granthamstyleposter}
            \granthamstyleposterprehook}
          {\ifthenelse{\equal{#2}{tudelftlandscape}}
            {\renewcommand{\IMposterstyle}{\tudelftlandscapestyleposter}}
            {\ClassError{imposter}{#2 is not a valid poster style.}
              {Valid poster styles are block and housestyle.}
            }
          }
        }
      }
    }
  }
}

% Some utility routines for poster styles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Frame style header.
\newcommand{\hsframehead}{
 \ifthenelse{\equal{\IMtitlecolor}{}}
   {\definecolor{titlecolor}{named}{Black}}{}
 \ifthenelse{\equal{\IMtitlebackcolor}{}}
   {\definecolor{titlebackcolor}{named}{White}}{}

% Box in top right hand corner.
\psframe[dimen=inner, fillstyle=solid,fillcolor=titleframecolor]
(753,1101)(841,1189)

% Title frame
\psframe[dimen=outer, linewidth=4, fillstyle=solid,
fillcolor=titlebackcolor, linecolor=titleframecolor]
(100,1066)(784,1147)

\rput[l](110,1105){\parbox{664mm}{\huge\bfseries\color{titlecolor}\IMtitle}}

% Author
\rput(420.5,1039){\large\IMauthor}
}

% Plain style header
\newcommand{\hsplainhead}{
  \ifthenelse{\equal{\IMtitlecolor}{}}
  {\definecolor{titlecolor}{named}{Black}}{}
  
  % Title
  \rput(420.5,1132){\parbox{781mm}
    {\huge\bfseries\color{titlecolor}\centering\IMtitle}}
  
  % Author
  \rput(420.5,1059){\large\IMauthor}
}

% Block style header
\newcommand{\hsblockhead}{
 \ifthenelse{\equal{\IMtitlecolor}{}}
   {\definecolor{titlecolor}{named}{Black}}{}
 \ifthenelse{\equal{\IMtitleframecolor}{}}
   {\definecolor{titleframecolor}{named}{Black}}{}

% Title block
\psframe[dimen=inner, fillstyle=solid, fillcolor=titlebackcolor, 
linecolor=titleframecolor](10,1039)(831,1179)

\rput(420.5,1132){\parbox{781mm}
{\huge\bfseries\color{titlecolor}\centering\IMtitle}}

% Author
\rput(420.5,1059){\large\color{titlecolor}\IMauthor}
}

% Poster styles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\tudelftstyleposter}
{
\ifthenelse{\equal{\IMposterargs}{block}}{\hsblockhead}{
\ifthenelse{\equal{\IMposterargs}{plain}}{\hsplainhead}{
\hsframehead}}

% Bottom block
% Force white background on bottom block.
\psframe[dimen=inner, fillstyle=solid,fillcolor=white, linecolor=white]
(0,0)(1189,145)

\psframe[dimen=inner, fillstyle=solid,fillcolor=postercolor, linecolor=postercolor]
(0,0)(1189,25)

\psframe[dimen=inner, fillstyle=solid,fillcolor=postercolor, linecolor=postercolor]
(0,27)(1189,59)

% Black line
\psline[linewidth=1, linecolor=black](0,145)(1189,145)

% University logo
\ifthenelse{\equal{\IMlogo}{}}{}{\rput(622,102)
{\includegraphics[height=86mm]{\IMlogo}}}

\rput(622,48){\bfseries\color{white}\IMinstitution}

% Department or research centre name
\rput(220,48){\bfseries\IMdepartment}

% Any other logos.
%\rput(220,102)
%{\includegraphics[height=80mm]{delfin_colour.eps}}


% Author address
\rput(420.5,13){\parbox{821mm}{\centering\small\IMaddress}}

% The main text body
\rput[tl](10,1014){\usebox{\posterbox}}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\blockstyleposter}
{
 \ifthenelse{\equal{\IMtitlecolor}{}}
   {\definecolor{titlecolor}{named}{Black}}{}
 \ifthenelse{\equal{\IMtitleframecolor}{}}
   {\definecolor{titleframecolor}{named}{Black}}{}

% Title block
\psframe[dimen=inner, fillstyle=solid, fillcolor=titlebackcolor,
linecolor=titleframecolor]
(10,1012)(831,1124)

\rput(420.5,1079){\parbox{664mm}
{\huge\bfseries\color{titlecolor}\centering\IMtitle}}

% Author frame
\rput(420.5,1032){\large\color{titlecolor}\centering\IMauthor}

% IM logo
\ifthenelse{\equal{\IMlogo}{}}{}{\rput[l](20,1156.5)
{\includegraphics[height=65mm]{\IMlogo}}}

% Department or research centre name
\rput[br](821,1136.4){\huge\IMdepartment}

% Author address
\rput(420.5,13){\parbox{821mm}{\centering\small\IMaddress}}

% The main text body
\rput[tl](10,984){\usebox{\posterbox}}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\icstyleposterprehook}
{
  \ifthenelse{\equal{\IMtitlecolor}{}}
   {\definecolor{titlecolor}{cmyk}{.89,.44,0,.45}}{}
 \ifthenelse{\equal{\IMtitleframecolor}{}}
   {\definecolor{titleframecolor}{cmyk}{.4,.25,0,.25}}{}
   \definecolor{titlebackcolor}{cmyk}{0,0,0,0}
 \ifthenelse{\equal{\IMpostercolor}{}}
   {\definecolor{postercolor}{cmyk}{.89,.44,0,.45}}{}
}

\newcommand{\icstyleposter}
{
  \newcounter{icvpos}
  \setcounter{icvpos}{0}
  \newcounter{icvoffset}
  \setcounter{icvoffset}{0}
  
  % Logos
  
  % Storage box for logos.
  \newsavebox{\logobox}
  \newsavebox{\logoabox}
  
  % Default logo size.
  % 
  \ifthenelse{\equal{\IMlogodim}{[]}}{\renewcommand{\IMlogodim}{[height=40mm]}}{}
  \savebox{\logobox}{\ifthenelse{\equal{\IMlogo}{}}{}{
      \expandafter\includegraphics\IMlogodim{\IMlogo}}}
%  \rput[tl](20,1169){\usebox{\logobox}}
  
  \ifthenelse{\equal{\IMlogoadim}{[]}}{\renewcommand{\IMlogoadim}{[height=40mm]}}{}
  \savebox{\logoabox}{\ifthenelse{\equal{\IMlogoa}{}}{}{
      \expandafter\includegraphics\IMlogoadim{\IMlogoa}}}
%   \rput[tr](821,1000){\usebox{\logobox}}
%   \rput[tr](821,1000){\expandafter\includegraphics\IMlogodim{\IMlogo}}
  
  \newlength{\iclogolen}
  \newlength{\iclogoalen}
  \newlength{\iclogowidth}
  \newlength{\iclogoheight}
  
  \setlength{\iclogolen}{\widthof{\usebox{\logobox}}}
  \setlength{\iclogoalen}{\widthof{\usebox{\logoabox}}}
  \ifthenelse{\lengthtest{\iclogolen > \iclogoalen}}
  {
    \setlength{\iclogowidth}{\iclogolen}
  }{
    \setlength{\iclogowidth}{\iclogoalen}
  }
  
  \setlength{\iclogolen}{\heightof{\usebox{\logobox}}}
  \setlength{\iclogoalen}{\heightof{\usebox{\logoabox}}}
  \ifthenelse{\lengthtest{\iclogolen > \iclogoalen}}
  {
    \setlength{\iclogoheight}{\iclogolen}
  }{
    \setlength{\iclogoheight}{\iclogoalen}
  }
  
  \newlength{\icheadingwidth}
  \setlength{\icheadingwidth}{821mm-40mm-\iclogowidth*2}
  
  \newsavebox{\icheadingbox}
  
  \savebox{\icheadingbox}{\parbox{\icheadingwidth}{
      \centering
      % Title
      {\huge\bfseries\color{titlecolor}\IMtitle}
      % Author name
      \ifthenelse{\equal{\IMauthor}{}}{}
      {\\\large\color{titlecolor}\IMauthor}
      % Department or research centre name
      \ifthenelse{\equal{\IMdepartment}{}}{}
      {\\\large\color{titlecolor}\IMdepartment}
      % Institution name
      \ifthenelse{\equal{\IMinstitution}{}}{}
      {\\\large\color{titlecolor}\centering\IMinstitution}
    }}
  
 % Title block
  \rput[t](420.5,1179){\parbox{841mm}{
      \centering
      \psframebox[framesep=1cm,linecolor=titleframecolor]{
      \parbox{\iclogowidth}{\centering\usebox{\logobox}}
      \usebox{\icheadingbox}
      \parbox{\iclogowidth}{\centering\usebox{\logoabox}}
    }\\
    \vspace{1cm}
    \usebox{\posterbox}      
  }}

%  % The main text body 	 
%  \rput[tl](10,1065){\usebox{\posterbox}}

%  % The main text body
%  \addtocounter{icvpos}{-10}
%  \rput[tl](10,\theicvpos){

% Author address
\rput(420.5,13){\parbox{821mm}{\centering\small\IMaddress}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\amcgstyleposterprehook}
{
  \ifthenelse{\equal{\IMtitlecolor}{}}
  {\definecolor{titlecolor}{rgb}{.07,.05,.66}}{}
  \ifthenelse{\equal{\IMtitleframecolor}{}}
  {\definecolor{titleframecolor}{cmyk}{.4,.25,0,.25}}{}
  \definecolor{titlebackcolor}{cmyk}{0,0,0,0}
  \ifthenelse{\equal{\IMpostercolor}{}}
  {\definecolor{postercolor}{rgb}{.07,.05,.66}}{}
  \definecolor{amcgdarkblue}{rgb}{.07,.05,.66}
  \definecolor{amcglightblue}{rgb}{.27,.8,1}
}

\newcommand{\amcgstyleposter}
{
  \newcounter{icvpos}
  \setcounter{icvpos}{0}
  \newcounter{icvoffset}
  \setcounter{icvoffset}{0}
  
  % Logos
  
  % Storage box for logos.
  \newsavebox{\logobox}
  \newsavebox{\logoabox}
  
  % Default logo size.
  % 
  \ifthenelse{\equal{\IMlogodim}{[]}}{\renewcommand{\IMlogodim}{[height=40mm]}}{}
  \savebox{\logobox}{\ifthenelse{\equal{\IMlogo}{}}{}{
      \expandafter\includegraphics\IMlogodim{\IMlogo}}}
%  \rput[tl](20,1169){\usebox{\logobox}}
  
  \ifthenelse{\equal{\IMlogoadim}{[]}}{\renewcommand{\IMlogoadim}{[height=40mm]}}{}
  \savebox{\logoabox}{\ifthenelse{\equal{\IMlogoa}{}}{}{
      \expandafter\includegraphics\IMlogoadim{\IMlogoa}}}
%   \rput[tr](821,1000){\usebox{\logobox}}
%   \rput[tr](821,1000){\expandafter\includegraphics\IMlogodim{\IMlogo}}
  
  \newlength{\iclogolen}
  \newlength{\iclogoalen}
  \newlength{\iclogowidth}
  \newlength{\iclogoheight}
  
  \setlength{\iclogolen}{\widthof{\usebox{\logobox}}}
  \setlength{\iclogoalen}{\widthof{\usebox{\logoabox}}}
  \ifthenelse{\lengthtest{\iclogolen > \iclogoalen}}
  {
    \setlength{\iclogowidth}{\iclogolen}
  }{
    \setlength{\iclogowidth}{\iclogoalen}
  }
  
  \setlength{\iclogolen}{\heightof{\usebox{\logobox}}}
  \setlength{\iclogoalen}{\heightof{\usebox{\logoabox}}}
  \ifthenelse{\lengthtest{\iclogolen > \iclogoalen}}
  {
    \setlength{\iclogoheight}{\iclogolen}
  }{
    \setlength{\iclogoheight}{\iclogoalen}
  }
  
  \newlength{\icheadingwidth}
  \ifthenelse{\lengthtest{\textwidth > \textheight}}{
    % Landscape
    \setlength{\icheadingwidth}{1169mm-40mm-\iclogowidth*2}
  }{
    \setlength{\icheadingwidth}{821mm-40mm-\iclogowidth*2}
  }
  \newsavebox{\icheadingbox}
  
  \savebox{\icheadingbox}{\parbox{\icheadingwidth}{
      \centering
      % Title
      {\huge\bfseries\color{titlecolor}\IMtitle}
      % Author name
      \ifthenelse{\equal{\IMauthor}{}}{}
      {\\\large\color{titlecolor}\IMauthor}
      % Department or research centre name
      \ifthenelse{\equal{\IMdepartment}{}}{}
      {\\\large\color{titlecolor}\IMdepartment}
      % Institution name
      \ifthenelse{\equal{\IMinstitution}{}}{}
      {\\\large\color{titlecolor}\centering\IMinstitution}
    }}
  
 % Title block
  \ifportrait{\rput[t](420.5,1179){\parbox{841mm}{
      \centering
      \psframebox[framesep=1cm,linecolor=titleframecolor]{
      \parbox{\iclogowidth}{\centering\usebox{\logobox}}
      \usebox{\icheadingbox}
      \parbox{\iclogowidth}{\centering\usebox{\logoabox}}
    }\\
    \vspace{1cm}
    \usebox{\posterbox}      
  }}}\else{\rput[t](594.5,831){\parbox{1189mm}{
    \centering
    \psframebox[framesep=1cm,linecolor=titleframecolor]{
      \parbox{\iclogowidth}{\centering\usebox{\logobox}}
      \usebox{\icheadingbox}
      \parbox{\iclogowidth}{\centering\usebox{\logoabox}}
    }\\
    \vspace{1cm}
    \usebox{\posterbox}}}}\fi

%  % The main text body 	 
%  \rput[tl](10,1065){\usebox{\posterbox}}

%  % The main text body
%  \addtocounter{icvpos}{-10}
%  \rput[tl](10,\theicvpos){

% Author address
%\rput(420.5,13){\parbox{821mm}{\centering\small\IMaddress}}
% Amcg band at the bottom
 \ifthenelse{\equal{\IMposterargs}{narrow}}{
   \ifportrait{
     \psframe[dimen=inner, fillstyle=solid,fillcolor=amcgdarkblue, linecolor=amcgdarkblue,linewidth=.2,cornersize=absolute,linearc=0.0,framesep=0.5]
     (0,0)(841,70)
     \rput[bl](0,0){\includegraphics[height=70mm]{AMCG.eps}}
     \rput[br](836,17.5){\includegraphics[width=160mm]{imperial_white_on_clear_background_logo.eps}}
     \rput[c](420.5,47){\centering\large\color{white}\bfseries\IMaddress}
     \rput[c](420.5,23){\centering\large\color{white}\bfseries\IMurl}    
   }\else{
     \psframe[dimen=inner, fillstyle=solid,fillcolor=amcgdarkblue, linecolor=amcgdarkblue,linewidth=.2,cornersize=absolute,linearc=0.0,framesep=0.5]
     (0,0)(1189,70)
     \rput[bl](0,0){\includegraphics[height=70mm]{AMCG.eps}}
     \rput[br](1184,16){\includegraphics[width=160mm]{imperial_white_on_clear_background_logo.eps}}
     \rput[c](780,47){\centering\large\color{white}\bfseries\IMaddress}
     \rput[c](780,23){\centering\large\color{white}\bfseries\IMurl}    
     \rput[l](120,47){\LARGE\color{amcglightblue}\bfseries\IMgroup}
     \rput[l](120,23){\LARGE\color{white}\bfseries\IMproject}
   }\fi
 }{
  \psframe[dimen=inner, fillstyle=solid,fillcolor=amcgdarkblue, linecolor=amcgdarkblue,linewidth=.2,cornersize=absolute,linearc=0.0,framesep=0.5]
  (0,0)(1189,100)
  \rput[bl](0,0){\includegraphics[height=100mm]{AMCG.eps}}
  \ifthenelse{\equal{\IMgroup}{}\and\equal{\IMproject}{}}{
    \ifportrait{
     \rput[c](420.5,70){\centering\large\color{white}\bfseries\IMaddress}
     \rput[c](420.5,30){\centering\large\color{white}\bfseries\IMurl}    
   }\else{
     \rput[c](594.5,70){\centering\large\color{white}\bfseries\IMaddress}
     \rput[c](594.5,30){\centering\large\color{white}\bfseries\IMurl}    
   }\fi
  }{
    \rput[l](170,70){\Huge\color{amcglightblue}\bfseries\IMgroup}
    \rput[l](170,30){\Huge\color{white}\bfseries\IMproject}
    \ifportrait{
      }\else{
        \ifthenelse{\equal{\IMaddress}{}\and\equal{\IMurl}{}}{
          \rput[br](1184,23){\includegraphics[height=60mm]{imperial_white_on_clear_background_logo.eps}}
        }{
          \rput[c](1000,70){\centering\large\color{white}\bfseries\IMaddress}
          \rput[c](1000,30){\centering\large\color{white}\bfseries\IMurl}
          
        }
      }\fi
  }
}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\granthamstyleposterprehook}
{
  \ifthenelse{\equal{\IMtitlecolor}{}}
  {\definecolor{titlecolor}{cmyk}{.4,.25,0,.25}}{}
  \ifthenelse{\equal{\IMtitleframecolor}{}}
  {\definecolor{titleframecolor}{RGB}{0,164,139}}{}
  \definecolor{titlebackcolor}{cmyk}{0,0,0,0}
  \ifthenelse{\equal{\IMpostercolor}{}}
  {\definecolor{postercolor}{RGB}{0,164,139}}{}
  \definecolor{granthamgreen}{RGB}{0,164,139}
  \definecolor{granthamlightgreen}{cmyk}{.3,.0,.05,.18}
}

\newcommand{\granthamstyleposter}
{
  \newcounter{icvpos}
  \setcounter{icvpos}{0}
  \newcounter{icvoffset}
  \setcounter{icvoffset}{0}
  
  % Logos
  
  % Storage box for logos.
  \newsavebox{\logobox}
  \newsavebox{\logoabox}
  
  % Default logo size.
  % 
  \ifthenelse{\equal{\IMlogodim}{[]}}{\renewcommand{\IMlogodim}{[height=40mm]}}{}
  \savebox{\logobox}{\ifthenelse{\equal{\IMlogo}{}}{}{
      \expandafter\includegraphics\IMlogodim{\IMlogo}}}
%  \rput[tl](20,1169){\usebox{\logobox}}
  
  \ifthenelse{\equal{\IMlogoadim}{[]}}{\renewcommand{\IMlogoadim}{[height=40mm]}}{}
  \savebox{\logoabox}{\ifthenelse{\equal{\IMlogoa}{}}{}{
      \expandafter\includegraphics\IMlogoadim{\IMlogoa}}}
%   \rput[tr](821,1000){\usebox{\logobox}}
%   \rput[tr](821,1000){\expandafter\includegraphics\IMlogodim{\IMlogo}}
  
  \newlength{\iclogolen}
  \newlength{\iclogoalen}
  \newlength{\iclogowidth}
  \newlength{\iclogoheight}
  
  \setlength{\iclogolen}{\widthof{\usebox{\logobox}}}
  \setlength{\iclogoalen}{\widthof{\usebox{\logoabox}}}
  \ifthenelse{\lengthtest{\iclogolen > \iclogoalen}}
  {
    \setlength{\iclogowidth}{\iclogolen}
  }{
    \setlength{\iclogowidth}{\iclogoalen}
  }
  
  \setlength{\iclogolen}{\heightof{\usebox{\logobox}}}
  \setlength{\iclogoalen}{\heightof{\usebox{\logoabox}}}
  \ifthenelse{\lengthtest{\iclogolen > \iclogoalen}}
  {
    \setlength{\iclogoheight}{\iclogolen}
  }{
    \setlength{\iclogoheight}{\iclogoalen}
  }
  
  \newlength{\icheadingwidth}
  \ifthenelse{\lengthtest{\textwidth > \textheight}}{
    % Landscape
    \setlength{\icheadingwidth}{1169mm-40mm-\iclogowidth*2}
  }{
    \setlength{\icheadingwidth}{821mm-40mm-\iclogowidth*2}
  }
  \newsavebox{\icheadingbox}
  
  \savebox{\icheadingbox}{\parbox{\icheadingwidth}{
      \centering
      % Title
      {\huge\bfseries\color{titlecolor}\IMtitle}
      % Author name
      \ifthenelse{\equal{\IMauthor}{}}{}
      {\\\large\color{titlecolor}\IMauthor}
      % Department or research centre name
      \ifthenelse{\equal{\IMdepartment}{}}{}
      {\\\large\color{titlecolor}\IMdepartment}
      % Institution name
      \ifthenelse{\equal{\IMinstitution}{}}{}
      {\\\large\color{titlecolor}\centering\IMinstitution}
    }}
  
 % Title block
  \ifportrait{\rput[t](420.5,1179){\parbox{841mm}{
      \centering
      \psframebox[framesep=1cm,linecolor=titleframecolor]{
      \parbox{\iclogowidth}{\centering\usebox{\logobox}}
      \usebox{\icheadingbox}
      \parbox{\iclogowidth}{\centering\usebox{\logoabox}}
    }\\
    \vspace{1cm}
    \usebox{\posterbox}      
  }}}\else{\rput[t](594.5,831){\parbox{1189mm}{
    \centering
    \psframebox[framesep=1cm,linecolor=titleframecolor]{
      \parbox{\iclogowidth}{\centering\usebox{\logobox}}
      \usebox{\icheadingbox}
      \parbox{\iclogowidth}{\centering\usebox{\logoabox}}
    }\\
    \vspace{1cm}
    \usebox{\posterbox}}}}\fi

%  % The main text body 	 
%  \rput[tl](10,1065){\usebox{\posterbox}}

%  % The main text body
%  \addtocounter{icvpos}{-10}
%  \rput[tl](10,\theicvpos){

% Author address
%\rput(420.5,13){\parbox{821mm}{\centering\small\IMaddress}}
% Grantham band at the bottom
 \ifthenelse{\equal{\IMposterargs}{narrow}}{
   \ifportrait{
     \psframe[dimen=inner, fillstyle=solid,fillcolor=granthamgreen, linecolor=granthamgreen,linewidth=.2,cornersize=absolute,linearc=0.0,framesep=0.5]
     (0,0)(841,70)
     \rput[bl](0,0){\includegraphics[height=70mm]{Grantham_cmyk.eps}}
     \rput[br](836,17.5){\includegraphics[width=160mm]{imperial_white_on_clear_background_logo.eps}}
     \rput[c](420.5,47){\centering\large\color{white}\bfseries\IMaddress}
     \rput[c](420.5,23){\centering\large\color{white}\bfseries\IMurl}    
   }\else{
     \psframe[dimen=inner, fillstyle=solid,fillcolor=granthamgreen, linecolor=granthamgreen,linewidth=.2,cornersize=absolute,linearc=0.0,framesep=0.5]
     (0,0)(1189,70)
     \rput[bl](0,0){\includegraphics[height=70mm]{Grantham_cmyk.eps}}
     \rput[br](1184,16){\includegraphics[width=160mm]{imperial_white_on_clear_background_logo.eps}}
     \rput[c](780,47){\centering\large\color{white}\bfseries\IMaddress}
     \rput[c](780,23){\centering\large\color{white}\bfseries\IMurl}    
     \rput[l](120,47){\LARGE\color{granthamgreen}\bfseries\IMgroup}
     \rput[l](120,23){\LARGE\color{white}\bfseries\IMproject}
   }\fi
 }{
  \psframe[dimen=inner, fillstyle=solid,fillcolor=granthamgreen, linecolor=granthamgreen,linewidth=.2,cornersize=absolute,linearc=0.0,framesep=0.5]
  (0,0)(1189,100)
  \rput[bl](0,0){\includegraphics[height=100mm]{Grantham_cmyk.eps}}
  \ifthenelse{\equal{\IMgroup}{}\and\equal{\IMproject}{}}{
    \ifportrait{
     \rput[c](420.5,70){\centering\large\color{white}\bfseries\IMaddress}
     \rput[c](420.5,30){\centering\large\color{white}\bfseries\IMurl}    
   }\else{
     \rput[c](594.5,70){\centering\large\color{white}\bfseries\IMaddress}
     \rput[c](594.5,30){\centering\large\color{white}\bfseries\IMurl}    
   }\fi
  }{
    \rput[l](170,70){\Huge\color{granthamgreen}\bfseries\IMgroup}
    \rput[l](170,30){\Huge\color{white}\bfseries\IMproject}
    \ifportrait{
      }\else{
        \ifthenelse{\equal{\IMaddress}{}\and\equal{\IMurl}{}}{
          \rput[br](1184,23){\includegraphics[height=60mm]{imperial_white_on_clear_background_logo.eps}}
        }{
          \rput[c](1000,70){\centering\large\color{white}\bfseries\IMaddress}
          \rput[c](1000,30){\centering\large\color{white}\bfseries\IMurl}
          
        }
      }\fi
  }
}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\tudelftlandscapestyleposter}
{
 \ifthenelse{\equal{\IMtitlecolor}{}}
   {\definecolor{titlecolor}{named}{Black}}{}
 \ifthenelse{\equal{\IMtitleframecolor}{}}
   {\definecolor{titleframecolor}{named}{Black}}{}

% Title block
\rput(594.5,770){\parbox{664mm}
{\huge\bfseries\color{titlecolor}\centering\IMtitle}}

% Author frame
\rput(594.5,737){\large\color{titlecolor}\centering\IMauthor}

% IM logo
% \rput[bl](20,1134)
% {\includegraphics[bb=0 -24 124 30,width=110mm]{tulogo3.eps}}
\ifthenelse{\equal{\IMlogo}{}}{}{\rput[b](970,717)
{\includegraphics[height=104mm]{\IMlogo}}}

\ifthenelse{\equal{\IMlogoa}{}}{}{\rput[b](220,717)
{\includegraphics[height=104mm]{\IMlogoa}}}

% Bottom block
% Force white background on bottom block.
\psframe[dimen=inner, fillstyle=solid,fillcolor=white, linecolor=white]
(0,0)(1189,59)

\psframe[dimen=inner, fillstyle=solid,fillcolor=postercolor, linecolor=postercolor]
(0,0)(1189,25)

\psframe[dimen=inner, fillstyle=solid,fillcolor=postercolor, linecolor=postercolor]
(0,27)(1189,59)


\rput(970,48){\bfseries\color{white}\IMinstitution}

% Department or research centre name
\rput(220,48){\bfseries\IMdepartment}

% Author address
\rput(594.5,13){\parbox{1169mm}{\centering\small\IMaddress}}

% The main text body
\rput[tl](10,689){\usebox{\posterbox}}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtBeginDocument{
  \ifportrait\special{papersize=841mm,1189mm}\else\special{papersize=1189mm,841mm}\fi
  \pagestyle{empty}
  \begin{lrbox}{\posterbox}\ifportrait\begin{minipage}{821mm}\else\begin{minipage}{1169mm}\fi}

\AtEndDocument{
  \end{minipage}\end{lrbox}
\noindent\ifportrait\begin{pspicture}(0,0)(84.1,118.9)\else\begin{pspicture}(0,0)(118.9,84.1)\fi
\psset{unit=.1cm, linecolor=postercolor}
\IMposterstyle
\end{pspicture}
}



\endinput
%% 
%% End of file `imposter.cls'.







