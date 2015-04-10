%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%%
%% The Current Maintainer of this work is Victor Chaves, vvb.chaves+dev@gmail.com
%%
%% Builds on `beamer` class

\ProvidesClass{bimer}[2015/04/10 v0.3 imeTeX]
\NeedsTeXFormat{LaTeX2e}
\LoadClass{beamer}

%% Package Dependencies
	\RequirePackage{tikz}
%%

%% Necessary Packages
	% Codificação de caracteres especiais
	\usepackage[utf8]{inputenc}
%%

%% Variables
	\newcommand{\institutedepartment}{}
%%

%% Class Options
	\DeclareOptionBeamer{comp}{\renewcommand{\institutedepartment}{Engenharia de Computação}}
	
	\ProcessOptionsBeamer
%%

\mode<presentation>

%% Inner Theme
	\setbeamertemplate{title page}
	{
	}
	
	\newcommand{\formatheader}[1]
	{%
		\color{white}%
		\fontencoding{T1}\fontfamily{ugm}\fontshape{n}\fontseries{bx}\fontsize{5.4}{5.4pt}\selectfont%
		\expandafter\uppercase\expandafter{#1}%
	}
	
	\setbeamertemplate{headline}
	{
		\nointerlineskip%
		{\color{gray}\vrule height.028\paperwidth width\paperwidth}%
		\rlap{\raisebox{.0088\paperwidth}[0pt][0pt]{\hskip-.976\paperwidth\formatheader{\institutedepartment}}}%
		\llap{\raisebox{.0088\paperwidth}[0pt][0pt]{\formatheader{\beamer@shortinstitute}\hspace*{0.024\paperwidth}}}
	}
%%

%% Outer Theme
	\setbeamertemplate{frametitle}
	{
	}
%%

%% Color Theme
%%

%% Font Theme
%%

\mode<all>