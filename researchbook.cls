\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{researchbook}[07/01/2023 researchbook template]

%basic package
\LoadClass[twoside]{book}

%default format is a5
\RequirePackage[ a5paper
    ,hmargin={2cm,0.5in}
    ,vmargin={2.5cm,2cm},
    marginparwidth=1.5cm
]{geometry}



%using xcolor with svg mode for the section color
\RequirePackage[svgnames]{xcolor}

% for equations Typesetting 
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{witharrows}




% to customize header & footer
\RequirePackage{fancyhdr}
\pagestyle{fancy}

% tikz for graphs
\RequirePackage{tikz}

%used for the chapter style
\usetikzlibrary{calc} 

% chapter & section customization
\RequirePackage[sf,bf]{titlesec}

\titleformat{\section}
  {\normalfont\bfseries\Large\color{DarkRed}}
  {\thesection.}
  {1em}
  {}

\titleformat{\subsection}
  {\normalfont\bfseries\large\color{black}}
  {\thesubsection.}
  {1em}
  {}



\titleformat{\chapter}[display]
{}
{\hfill \tikz[remember picture] \node[] (nr) {\fontsize{20}{70}\selectfont\color{black}\textsc{Chapter~~} \fontsize{60}{70}\selectfont\color{black}\thechapter};
\begin{tikzpicture}[overlay,remember picture]
\coordinate (rightborder) at ($(nr)+(100,0)$);
\coordinate (right) at ($(nr.east) + (0.5,0)$);
\draw[line width=4.5em] (right) -- (rightborder);
\end{tikzpicture}}
{-1ex}
{\filleft\fontsize{30}{50}\selectfont}
[\vspace{-1ex}\minitoc]

\titleformat{name=\chapter,numberless}[display]
{\normalfont\huge}
{}
{0pt}
{\titlerule\vspace{0.2cm}}
[\vspace{0.2cm}\titlerule]

\titlespacing{\chapter}{0pt}{-30pt}{-20pt}
\titlespacing{name=\chapter,numberless}{0pt}{-30pt}{0pt}




%for table of content per chapter
\RequirePackage{minitoc}


%customize link colors for the table of content
\definecolor{linkcolor}{rgb}{0,0,0.6} % définition de la couleur des liens pdf
\RequirePackage[ 
    pdftex,colorlinks=true,
    pdfstartview=ajustementV,
    linkcolor= linkcolor,
    citecolor= linkcolor,
    urlcolor= linkcolor,
    hyperindex=true,
    hyperfigures=false]{hyperref}
    


% Book cover libs
\usetikzlibrary{ shapes.geometric }
\usetikzlibrary{calc}
\RequirePackage{anyfontsize}

%%%% custom cover


\newcommand{\customcover}[4]{

  
  \pagestyle{empty}
    
  \begin{tikzpicture}[remember picture,overlay]
    %%%%%%%%%%%%%%%%%%%% Background %%%%%%%%%%%%%%%%%%%%%%%%
    \fill[FireBrick] (current page.south west) rectangle (current page.north east);
    
    
    \foreach \i in {2.5,3,...,12}
    {
      \node[rounded corners,FireBrick!60,draw,regular polygon,regular polygon sides=6, minimum size=\i cm,ultra thick] 
        at ($(current page.west)+(2.5,-5)$) {} ;
    }
    
    %%%%%%%%%%%%%%%%%%%% Background Polygon %%%%%%%%%%%%%%%%%%%% 
    \foreach \i in {0.5,1,...,13}
    {
      \node[rounded corners,FireBrick!60,draw,regular polygon,regular polygon sides=6, minimum size=\i cm,ultra thick] 
        at ($(current page.north west)+(2.5,0)$) {} ;
    }
    
    \foreach \i in {0.5,1,...,13}
    {
    \node[rounded corners,FireBrick!90,draw,regular polygon,regular polygon sides=6, minimum size=\i cm,ultra thick] 
      at ($(current page.north east)+(0,-8)$) {} ;
    }
    
    
    \foreach \i in {4,4.5,...,12}
    {
    \node[FireBrick!85,rounded corners,draw,regular polygon,regular polygon sides=6, minimum size=\i cm,ultra thick] 
      at ($(current page.south east)+(-0.2,-0.45)$) {} ;
    }
    
    
    %%%%%%%%%%%%%%%%%%%% Title of the Report %%%%%%%%%%%%%%%%%%%% 
    \node[left,FireBrick!5,minimum width=0.625*\paperwidth,minimum height=3cm, rounded corners] 
      at ($(current page.north east)+(0,-7.5)$)
    {
    {\fontsize{25}{30} \selectfont \bfseries #1}
    };
    
    %%%%%%%%%%%%%%%%%%%% Subtitle %%%%%%%%%%%%%%%%%%%% 
    \node[left,FireBrick!10,minimum width=0.625*\paperwidth,minimum height=2cm, rounded corners] 
      at ($(current page.north east)+(0,-9)$)
    {
    {\huge \textit{#2}}
    };
    
    %%%%%%%%%%%%%%%%%%%% Author Name %%%%%%%%%%%%%%%%%%%% 
    \node[left,FireBrick!5,minimum width=0.625*\paperwidth,minimum height=2cm, rounded corners] 
      at ($(current page.north east)+(0,-11)$)
    {
    {\Large \textsc{#3}}
    };
    
    %%%%%%%%%%%%%%%%%%%% Year %%%%%%%%%%%%%%%%%%%% 
    \node[rounded corners,fill=FireBrick!70,text =FireBrick!5,regular polygon,regular polygon sides=6, minimum size=2.5 cm,inner sep=0,ultra thick] at ($(current page.west)+(2.5,-5)$) {\LARGE \bfseries #4};
    
  \end{tikzpicture}
  
  
  
  \newpage
  
  
}




%%%% thm environments



\RequirePackage[listings]{tcolorbox}
\tcbuselibrary{listings,theorems,skins,hooks}

%\newtcbtheorem[⟨init options⟩]{⟨name⟩}{⟨display name⟩}{⟨options⟩}{⟨prefix⟩}

\newtcbtheorem[number within=section]{tcdefinition}{Definition}%
{colback=green!5,colframe=green!35!black,fonttitle=\bfseries,
separator sign={\ $\blacktriangleright$}}{def}

\newtcbtheorem[number within=section]{tctheorem}{Theorem}%
{colback=red!5,colframe=red!35!black,fonttitle=\bfseries,
separator sign={\ $\blacktriangleright$}}{thm}

\newtcolorbox{marker}[1][]{enhanced,
  before skip balanced=2mm,after skip balanced=3mm,
  boxrule=0.4pt,left=5mm,right=2mm,top=1mm,bottom=1mm,
  colback=yellow!50,
  colframe=yellow!20!black,
  sharp corners,rounded corners=southeast,arc is angular,arc=3mm,
  underlay={%
    \path[fill=tcbcolback!80!black] ([yshift=3mm]interior.south east)--++(-0.4,-0.1)--++(0.1,-0.2);
    \path[draw=tcbcolframe,shorten <=-0.05mm,shorten >=-0.05mm] ([yshift=3mm]interior.south east)--++(-0.4,-0.1)--++(0.1,-0.2);
    \path[fill=yellow!50!black,draw=none] (interior.south west) rectangle node[white]{\Huge\bfseries !} ([xshift=4mm]interior.north west);
    },
  drop fuzzy shadow,#1}