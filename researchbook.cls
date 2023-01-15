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

% to customize header & footer
\RequirePackage{fancyhdr}
\pagestyle{fancy}

%using xcolor with svg mode for the section color
\RequirePackage[svgnames]{xcolor}

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