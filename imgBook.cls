%    This file is part of Edible Food Book, a CC-by-sa-3.0 book.
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