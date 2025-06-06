%----------------------------------------------------------------------------------------
%	CLASS OPTIONS AND REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\ProvidesClass{cv_12}[2014/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\usepackage[hmargin=1.25cm, vmargin=0.75cm]{geometry} % Specifies horizontal and vertical page margins
\usepackage[hidelinks]{hyperref} % Required for links

%----------------------------------------------------------------------------------------
%	COLORS
%----------------------------------------------------------------------------------------

\usepackage[usenames,dvipsnames,svgnames]{xcolor} % Required for custom colors

\definecolor{primary}{HTML}{2b2b2b} % The primary document color for content text
\definecolor{headings}{HTML}{2E4053} % The color of the large sections
\definecolor{subheadings}{HTML}{1A5276} % The color of subsections and places worked/studied
\definecolor{date}{HTML}{666666} % The color used for the Last Updated text at the top right
\definecolor{bar_light}{HTML}{FDF2E9} % The light color used for the bar
\definecolor{bar_dark}{HTML}{F5CBA7} % The dark color used for the bar

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\usepackage{fontspec} % Required for specifying custom fonts in XeLaTeX

\setmainfont[Color=primary, Path=fonts/Lato/,BoldItalicFont=Lato-Italic,BoldFont=Lato-Regular,ItalicFont=Lato-LightItalic]{Lato-Light} % The primary font for content text; defines bold, italic and bold-italic as well

\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path=fonts/Raleway/static/]{Raleway-ExtraLight} % The font used where \sfffamily is called

%----------------------------------------------------------------------------------------
%	LAST UPDATED COMMAND
%----------------------------------------------------------------------------------------

\usepackage[absolute]{textpos} % Required for positioning the Last Updated text at the top right of the page
\usepackage[UKenglish]{isodate} % Prints the Last Updated date in UK English format

\setlength{\TPHorizModule}{0.01\paperwidth} % Sets the units for the horizontal position used in the \begin{textblock} argument
\setlength{\TPVertModule}{0.01\paperwidth} % Sets the units for the vertical position used in the \begin{textblock} argument
\newcommand{\lastupdated}{ % Create a new command for printing the Last Updated text
\begin{textblock}{25}(76,2) % The position of the Last Updated text on the page (75% of the page across, 2% down)
\color{date}\fontspec[Path = fonts/Raleway/static/]{Raleway-ExtraLight}\fontsize{8pt}{10pt}\selectfont % Text styling of the text
Updated on \today % Last Updated text
\end{textblock}}

%----------------------------------------------------------------------------------------
%	MAIN HEADING COMMAND
%----------------------------------------------------------------------------------------

\newcommand{\namesection}[3]{ % Defines the command for the main heading
    \color{subheadings}
    \centering{ % Center the name
        \fontsize{38pt}{58pt} % Font size
        \fontspec[Path = fonts/Lato/]{Lato-Thin}\selectfont #1 % First name font
        \fontspec[Path = fonts/Lato/]{Lato-Light}\selectfont #2 % Last name font
    } \\
    \vspace{5pt} % Whitespace between the name and contact information
    \centering{ % Center the contact information
        \fontspec[Path = fonts/Raleway/static/]{Raleway-Light}\fontsize{12pt}{14pt}\selectfont #3
    } % Contact information font
    \noindent\makebox[\linewidth]{\color{subheadings}\rule{\paperwidth}{0.4pt}} % Horizontal rule
    \vspace{-8pt} % Reduce whitespace after the rule slightly
}

%----------------------------------------------------------------------------------------
%	SECTION TITLE STYLING AND SPACING
%----------------------------------------------------------------------------------------

\usepackage{titlesec} % Required for customizing section/subsection/etc titles

\titlespacing{\section}{0pt}{0pt}{0pt} % Removes the spacing around the main section titles
\titlespacing{\subsection}{0pt}{0pt}{0pt} % Removes the spacing around the subsections
\newcommand{\sectionspace}{\vspace{8pt}} % Defines a command to add a set amount of space after sections and subsections

\titleformat{\section}{ % Customize the large section titles
\color{headings}\fontspec[Path = fonts/Lato/]{Lato-Light}\fontsize{16pt}{24pt}\selectfont\raggedright\uppercase}{}{0em}{}

\titleformat{\subsection}{ % Customize the subsections and places worked/studied titles
\color{subheadings}\fontspec[Path = fonts/Lato/]{Lato-Regular}\fontsize{10pt}{10pt}\selectfont\uppercase}{}{0em}{}

\newcommand{\runsubsection}[1]{ % Used for creating subsections where a description is required on the same line
\color{subheadings}\fontspec[Path = fonts/Lato/]{Lato-Light}\fontsize{9pt}{9pt}\selectfont\uppercase {#1} \normalfont}

\newcommand{\descript}[1]{ % Used for describing the subsection either on the same line or underneath
\color{subheadings}\raggedright\fontspec[Path = fonts/Raleway/static/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont {#1 \\} \normalfont}

\newcommand{\location}[1]{ % Used for specifying a duration and/or location under a subsection
\color{headings}\raggedright\fontspec[Path = fonts/Raleway/static/]{Raleway-Medium}\fontsize{9pt}{11pt}\selectfont {#1 \\} \normalfont}

%----------------------------------------------------------------------------------------
%	ITEMS STYLING AND SPACING
%----------------------------------------------------------------------------------------

\newenvironment{tightitemize} % Defines the tightitemize environment which modifies the itemize environment to be more compact
{\vspace{-\topsep}\begin{itemize}\itemsep1pt \parskip0pt \parsep0pt}
{\end{itemize}\vspace{-\topsep}}

%----------------------------------------------------------------------------------------
%	PAGE COUNTER COMMAND
%----------------------------------------------------------------------------------------

\usepackage{lastpage}

\setlength{\TPHorizModule}{0.01\paperwidth} % Sets the units for the horizontal position used in the \begin{textblock} argument
\setlength{\TPVertModule}{0.01\paperwidth} % Sets the units for the vertical position used in the \begin{textblock} argument
\newcommand{\pagecounter}{ % Create a new command for printing the Last Updated text
\begin{textblock}{10}(89,4) % The position of the Last Updated text on the page (75% of the page across, 2% down)
\color{date}\fontspec[Path = fonts/Raleway/static/]{Raleway-ExtraLight}\fontsize{8pt}{10pt}\selectfont % Text styling of the text
Page \thepage\ of \pageref{LastPage}
\end{textblock}}

%----------------------------------------------------------------------------------------
%	.NET COMMAND
%----------------------------------------------------------------------------------------

\newcommand{\dotnet}{.NET}

%----------------------------------------------------------------------------------------
%	RATING
%----------------------------------------------------------------------------------------

\usepackage{tabularx}
\usepackage{tikz}

\newcommand\Mark[2][5]{%
  \rlap{\tikz[baseline=(current bounding box.south)]{
        \shade[left color=bar_light, right color=bar_dark]
               (0,0) rectangle ++(#1*#2/100,0.3);
    }%
  }%
}

%----------------------------------------------------------------------------------------

