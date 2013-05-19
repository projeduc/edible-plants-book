%Creatd By: Abdelkrime ARIES

\NeedsTeXFormat{LaTeX2e} %[2009/09/24]
\ProvidesClass{imgBook}[2013/02/15 Create an image book]
\LoadClass{book}

\RequirePackage[utf8]{inputenc}
\RequirePackage[arabic,french,english]{babel}
\RequirePackage{CJKutf8}

\RequirePackage{multirow}
\RequirePackage{array}


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

\newcounter {nmblines}
\setcounter{nmblines}{1}

\newcommand\Block[1]{%
%\setlength\fboxsep{0pt} \setlength\fboxrule{0.1pt}% delete
%\mbox{ delete
\begin{minipage}[c][\dimexpr0.3333333\textheight-2pt\relax][c]{\dimexpr.5\textwidth-10pt\relax}
\centering
#1
\end{minipage}%
  %} delete
}


\newtoks\@image
\@image={}
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
\Block{\the\@image}\hfill%
\Block{
\the\@artxt
\the\@japtxt
\the\@engtxt
\the\@frtxt
}%
\vfill
}

\newread\tempread
\immediate\newwrite\tempfile

\AtBeginDocument{%
\openout\tempfile=\jobname.aut
}

\AtEndDocument{%
\immediate\closeout\tempfile
}

%\newif\iffirst\firsttrue

\newcommand{\setimg}[3]
{

\IfFileExists{#1}{
 \@image={\includegraphics[width=6.5cm]{#1}} %
 \write\tempfile{#2}
 }{
 \@image={No image} %
 }

%\iffirst
%\openout\tempfile=\jobname.aut
%\firstfalse
%\fi


%\immediate\closeout\tempfile
%image creator name #2
%image licence #3
}

\newcommand{\authorsthanks}{%
  \immediate\closeout\tempfile
  
  %\def\oneline{}%

%  \openin\tempread=img.aut
  \openin\tempread=\jobname.aut

  \loop
    \read\tempread to \oneline
    \unless\ifeof\tempread%
    \oneline, 
  \repeat
  
  \closein\tempread
%  \immediate\openout\arqEscreveSiglas=\jobname.losg
}


\newcommand{\artxt}[1]
{
\@artxt={[AR] \AR{\textcortoba{#1}}\\}
%\index[ar]{#1}

}

\newcommand{\japtxt}[1]
{
\@japtxt={[JP] \jp{#1}\\}
}

\newcommand{\engtxt}[1]
{
\@engtxt={[EN] #1\\}
%\index[en]{#1}
}

\newcommand{\frtxt}[1]
{
\@frtxt={[FR] #1\\}
%\index[fr]{#1}
}