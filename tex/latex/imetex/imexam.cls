%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `author-maintained'.
%%
%% The Current Maintainer of this work is Victor Chaves, vvb.chaves+dev@gmail.com
%%
%% Builds on `exam` class by Philip S. Hirschhorn (http://www-math.mit.edu/~psh/#ExamCls)

\ProvidesClass{imexam}[2015/04/10 imeTeX]
\NeedsTeXFormat{LaTeX2e}
\LoadClass[addpoints]{exam}

%% Necessary Packages
	\usepackage[utf8]{inputenc}   % Codificação de caracteres especiais
%%

%% Main
	\newcommand{\printCover}{{
		\begin{coverpages}
			Capa
		\end{coverpages}
	}}
	
	\newcommand{\printFirstPageHeader}{{
		\noindent
		\fbox{
			\begin{minipage}[c][4cm][t]{\textwidth}
				Cabeçalho
			\end{minipage}
		}
		\vspace{0.5cm}
	}}
	
	\newcommand{\printFrontMatter}{
		\printCover
		\printFirstPageHeader
		\begin{questions}
	}
	
	\newcommand{\printGradeTable}{
		\begin{center}
			\combinedgradetable		
		\end{center}
	}
	
	\newcommand{\printBackMatter}{
		\end{questions}
		\vfill
		\printGradeTable
	}
%%

%% `exam.cls` Personalization
	% First Page Header
	\pagestyle{foot}
	
	% Page Counter Footer
	\cfoot{Página \thepage\ de \numpages}
	
	% Brackets around question points
	\bracketedpoints
	
	% Adds up the question value
	\qformat{\textbf{Questão \thequestion}\quad [\totalpoints~pontos]\hfill}
	
	% 'points' in portuguese
	\pointpoints{ponto}{pontos}
	
	% 'Solution' in portuguese
	\renewcommand{\solutiontitle}{\noindent\textbf{Solução:}\enspace}
	
	% Grades Table in portuguese
	\cvqword{Questão}
	\cvpword{Valor}
	\cvbpword{Bônus}
	\cvsword{Pontos}
	\cvtword{Total}
%%