%    This file is part of Edible Food Book, a CC-nc-by-sa-3.0 book.
%    Copyright (C) 2013  Abdelkrime Aries <kariminfo0@gmail.com>
%
%    This program is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with this program.  If not, see <http://www.gnu.org/licenses/>.

\NeedsTeXFormat{LaTeX2e} %[2009/09/24]
\ProvidesClass{imgBook}[2013/02/15 Create an image book]
\LoadClass[12pt]{book}

\RequirePackage[utf8]{inputenc}
\RequirePackage[arabic,french,english]{babel}
\RequirePackage{CJKutf8}

\RequirePackage{multirow}
\RequirePackage{array}

\RequirePackage{tikz}
\RequirePackage{environ}
\RequirePackage{cmap}
\RequirePackage{ruby}

\RequirePackage{fancyhdr} 


\if@compatibility\else
\DeclareOption{a4paper}{%
\setlength{\paperheight}{297mm}%
\setlength{\paperwidth}{210mm}%
}


%when the user use a not existing option
\DeclareOption*{%
}
\fi
\ProcessOptions\relax

\setlength{\textwidth}{6.5in}
\setlength{\textheight}{8in}
\pagenumbering{arabic} % needed even though this class will not show page numbers


\newcommand{\jp}[1]{ %
\begin{CJK}{UTF8}{min} %
#1
\end{CJK} %
}

%\newcounter {nmblines}
%\setcounter{nmblines}{1}

% Category counter
\newcounter {catcount}
\setcounter{catcount}{0}

\newcommand\Block[1]{%
%\setlength\fboxsep{0pt} \setlength\fboxrule{0.1pt}% delete
%\mbox{ %delete
\begin{minipage}[c][\dimexpr0.3333333\textheight-2pt\relax][c]{\dimexpr.5\textwidth-10pt\relax}
\centering
#1
\end{minipage}%
%  } %delete
}


\newtoks\@image
\@image={}
\newtoks\@licenceimg
\@licenceimg={}
\newtoks\@imgdir
\@imgdir={}
\newtoks\@artxt
\@artxt={}
\newtoks\@japtxt
\@japtxt={}
\newtoks\@engtxt
\@engtxt={}
\newtoks\@frtxt
\@frtxt={}


\newenvironment{element}
{
%\clearpage
\@image={ }
\@japtxt={ }
\@artxt={ }
\@frtxt={ }
\@engtxt={ }
}
{
\noindent
%\hrule
\Block{\the\@image}\hfill%
\Block{
\the\@artxt
\the\@japtxt
\the\@engtxt
\the\@frtxt
}%
\vfill
}

\NewEnviron{category}
{

%\if@twoside
%  \ifodd\c@page
%  	\hbox{}\newpage
%  	\if@twocolumn
%  		\hbox{}%
%  	\newpage
%  	\fi
%  \fi
%\fi
%\newpage
\cleardoublepage

%\@image={ }
\@japtxt={ }
\@artxt={ }
\@frtxt={ }
\@engtxt={ }
\@imgdir={ }
\addtocounter{catcount}{1}
\thispagestyle{empty} 

\BODY

\noindent
\begin{tikzpicture}
\addref
\renewcommand{\addref}{}

\node[anchor=north west,minimum width=\textwidth,minimum height=4cm,fill=blue] (RB) at (current page.north west){};

\node[anchor=north west,minimum width=3cm,minimum height=3cm,fill=yellow] at ([shift={(0.5cm,3.5cm)}] RB.south west){
	\begin{minipage}[t!]{3cm}
        \begin{center}
        {\fontsize{60pt}{1em}\selectfont\bf \textcolor{blue}{\arabic{catcount}}}
        \end{center}
    \end{minipage}
};

\node[anchor=north west,minimum width=\textwidth,minimum height=8cm,fill=blue] at ([shift={(0cm,-10cm)}] RB.south west){};

\node[anchor=north west,draw=red,minimum width=15cm, minimum height=8cm,fill=red!80, very thick, rectangle, rounded corners, inner sep=10pt, inner ysep=20pt, rotate=10] at ([shift={(0cm,-4cm)}] RB.south west){
	\begin{minipage}[t!]{14cm}
        \begin{center}
        \the\@artxt \\
        \the\@japtxt \\
        \the\@engtxt \\
        \the\@frtxt
        \end{center}
    \end{minipage}
};
\end{tikzpicture}

%\newpage\hbox{}
%\addtocounter{page}{-1}

}

\newcommand{\bookTitle}
{

\begin{titlepage}
%%\hrule
%%\vspace{3pt}
%%\hrule
\addcontentsline{toc}{part}{\the\@engtxt}
\begin{tikzpicture}[remember picture,overlay]

  \node[anchor=north west,minimum width=\textwidth + 2.5cm,minimum height=8cm,fill=blue,text=black] (RB) at (current page.north west){};
  
  \node[anchor=north west,minimum width=\textwidth,minimum height=10cm,fill=blue] (RC) at ([shift={(2.5cm,-9cm)}] RB.south west){}; 
  
  \node[anchor=north west,minimum width=\textwidth] at ([shift={(2.4cm,0.15cm)}] RB.south west) {\the\@image}; 
  
  \node[text=yellow,anchor=north west,minimum width=\textwidth] at ([shift={(2.5cm,5.5cm)}] RB.south west){
  \hfill
  \the\@artxt
  \hfill
  };
  
  \node[text=yellow,anchor=north west,minimum width=\textwidth] at ([shift={(2.5cm,4cm)}] RB.south west){
  \hfill
  \the\@japtxt
  \hfill
  };
    
  \node[text=yellow,anchor=north west,minimum width=18cm] at ([shift={(2.5cm,3cm)}] RB.south west){
  \hfill
  \the\@engtxt
  \hfill
  };
  
  \node[text=yellow,anchor=north west,minimum width=18cm] at ([shift={(2.5cm,2cm)}] RB.south west){
    \hfill
    \the\@frtxt
    \hfill
    };
    
  \node[text=white,text width=8cm,anchor=north west, align=right] at ([shift={(4.5cm,1.8cm)}] RC.south west){
  2013
  \copyright \
  \AR{عبد الكريم عريس}
  };
  
  \node[text=white,text width=8cm,anchor=north west, align=right] at ([shift={(4.5cm,1.2cm)}] RC.south west){
  2013
  \copyright \ Abdelkrime Aries
    };
    
   \node[text=white,text width=8cm,anchor=north west] at ([shift={(13cm,2cm)}] RC.south west){
   \the\@licenceimg
   };
\end{tikzpicture}

\end{titlepage}
\cleardoublepage
}


\immediate\newwrite\auttable

\AtBeginDocument{%
\openout\auttable=authors.tex

\write\auttable{\@backslashchar begin{longtable}{lll}}
\write\auttable{\@backslashchar textbf{\@backslashchar Large image} & \@backslashchar textbf{\@backslashchar Large owner} & \@backslashchar textbf{\@backslashchar Large License} \@backslashchar\@backslashchar}
%\write\auttable{\@backslashchar endhead}
}

\AtEndDocument{%
\immediate\closeout\auttable
}

\newcommand{\writeinfo}[3]{
\write\auttable{#1 & #2 & #3 \@backslashchar\@backslashchar}
}

\newcommand{\writecatinfo}[1]{
\write\auttable{&& \@backslashchar\@backslashchar}
\write\auttable{\@backslashchar multicolumn{3}{l}{#1} \@backslashchar\@backslashchar\@backslashchar hline}
}

%\newif\iffirst\firsttrue



\newcommand{\imgdir}[1]
{
\@imgdir={#1}
}

\newcommand{\setimg}[3]
{
\IfFileExists{\the\@imgdir #1}{
 \@image={\includegraphics[width=6.5cm]{\the\@imgdir #1}} %
  \writeinfo{#1}{#2}{#3}
 }{
 \@image={No image} %
 }
}



\newcommand{\bookimg}[3]
{
\IfFileExists{#1}{
 \@image={\noindent\includegraphics[width=\textwidth]{#1}  \writeinfo{cover.jpg}{#2}{#3}} %
 }{
 \@image={} %
 }
}

\newcommand{\licenceimg}[3]
{

\IfFileExists{#1}{
 \@licenceimg={\includegraphics{#1}} %
 }{
 \@licenceimg={} %
 }
 
}

\newcommand{\authorsthanks}{%
  \immediate\write\auttable{\@backslashchar end{longtable}}
  \immediate\closeout\auttable
  \hrule
  \begin{flushright}
  {\huge Pictures' credits:}
  \end{flushright}
  \vspace{1cm}
  
  \noindent
 \input{authors}
}


\newcommand{\artxt}[1]
{
\@artxt={[AR] \AR{\textcortoba{#1}}\\}
%\index[ar]{#1}
}

\newcommand{\artitle}[1]
{
\@artxt={\Huge  \AR{\textgranada{#1}}}
%\index[ar]{#1}
}

\newcommand{\japtxt}[1]
{
\@japtxt={[JP] \jp{#1}\\}
}

\newcommand{\japtitle}[1]
{
\@japtxt={\Huge \jp{#1}}
}

\newcommand{\engtxt}[1]
{
\@engtxt={[EN] #1\\}
%\index[en]{#1}
}

\newcommand{\engtitle}[1]
{
\@engtxt={\Huge #1}
}

\newcommand{\frtxt}[1]
{
\@frtxt={[FR] #1\\}
%\index[fr]{#1}
}

\newcommand{\frtitle}[1]
{
\@frtxt={\Huge #1}
%\index[fr]{#1}
}


\newcommand{\addref}{}
%----------------------------------

\renewcommand{\chapter}[1]{
\renewcommand{\addref}{
\phantomsection
%\addcontentsline{toc}{chapter}{\arabic{catcount} - \the\@chaptitle}
\addcontentsline{toc}{chapter}{#1}
\writecatinfo{#1}
}

}



%============================FRONTMATTER

\renewcommand{\frontmatter}{
\pagenumbering{roman}
\pagestyle{empty}
%\fancyfoot{} 
%\fancyhead{} 
}

%\fancypagestyle{plain}{
%  \fancyhead{}
%  \fancyfoot{}
%  \renewcommand{\headrulewidth}{0pt}
%}

%==========================MAINMATTER


\renewcommand{\mainmatter}{

\cleardoublepage

\pagenumbering{arabic}

\pagestyle{fancy}                       % Sets fancy header and footer
\fancyfoot{}                            % Delete current footer settings
\renewcommand{\headrulewidth}{0pt}

\fancyhead[E]{
\begin{tikzpicture}[remember picture,overlay,shift={(current page.north west)}]
        \node[anchor=north west, minimum width=\textwidth+1.5cm, minimum height=1cm,fill=red] at (0,0){};
        \node[anchor=east,xshift=.1\textwidth+1.5cm, yshift=-1cm,rectangle, rounded corners=10pt,minimum width=2cm, inner sep=6pt, fill=blue]
              {\large \color{white}\thepage};
\end{tikzpicture}
} 

\fancyhead[O]{
\begin{tikzpicture}[remember picture,overlay,shift={(current page.north west)}]
\begin{scope}[xshift= 2.5cm]
 \node[anchor=north west, minimum width=\textwidth+1.5cm, minimum height=1cm,fill=red] at (0,0){};
        \node[anchor=west,xshift=.9\textwidth, yshift=-1cm,rectangle, rounded corners=10pt,minimum width=2cm, inner sep=6pt, fill=blue]
              {\large \color{white}\thepage};
\end{scope}
\end{tikzpicture}
} 
}

%=========Backmatter
\renewcommand{\backmatter}{
\cleardoublepage
\pagestyle{empty} 
%\pagenumbering{roman}
}