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
%% Builds on `beamer` class
%% Inspired by Morten Larsen's Frederiksberg theme

\ProvidesClass{bimer}[2015/04/10 v0.3 imeTeX]
\NeedsTeXFormat{LaTeX2e}
\LoadClass{beamer}

%% Packages
	% Basic Packages
	\usepackage{cmap}				% Extra mathematical symbols
	\usepackage[utf8]{inputenc}		% UTF8 encoding
	\usepackage[T1]{fontenc}		% Font encoding
	\usepackage{hyperref}			% Hyperlinks and URLs
	\usepackage{graphicx}			% Include grafics
	\usepackage{lmodern}			% Standard font
	\usepackage{amsthm}				% Proof Environment
	\usepackage{amsfonts}			% Math Fonts
	\usepackage{tikz}				% Drawing
	
	% Main Packages
	%\usepackage{ime-style}			% Extra functionalities
	\usepackage[alf]{abntex2cite}	% ABNT References styles
	
	% Extra Packages
	\usepackage{physics}			% Physics Notations
%%

%% Content Variables
	\newcommand{\bimer@institutecontext}{\hfill}
	\newcommand{\context}[1]{\renewcommand{\bimer@institutecontext}{#1}}
	
	% Institute Specification
	\newcommand{\bimer@shortinstitute}{instituto militar de engenharia}
	\newcommand{\bimer@institutedepartment}{seção de ensino básico}
	\newcommand{\bimer@institutequarterlogo}{QEMquarter}
	
	% Images
	\pgfdeclareimage[height=.078\paperwidth]{title_UL_figure}{IMEfront}
	\pgfdeclareimage[height=.090\paperwidth]{title_UR_figure}{IMEsymbol}
	\pgfdeclareimage[width=.375\paperwidth]{title_LR_figure}{\bimer@institutequarterlogo}
%%

%% Class Options
	\DeclareOptionBeamer{comp}{\renewcommand{\bimer@institutedepartment}{engenharia de computação}}
	\DeclareOptionBeamer{elo}{\renewcommand{\bimer@institutedepartment}{engenharia eletrônica}}
	\DeclareOptionBeamer{ele}{\renewcommand{\bimer@institutedepartment}{engenharia elétrica}}
	\DeclareOptionBeamer{tele}{\renewcommand{\bimer@institutedepartment}{engenharia de telecomunicações}}
	\DeclareOptionBeamer{mat}{\renewcommand{\bimer@institutedepartment}{engenharia de materiais}}
	\DeclareOptionBeamer{qui}{\renewcommand{\bimer@institutedepartment}{engenharia química}}
	\DeclareOptionBeamer{fc}{\renewcommand{\bimer@institutedepartment}{engenharia de fortificação e construção}}
	\DeclareOptionBeamer{mec}{\renewcommand{\bimer@institutedepartment}{engenharia mecânica}}
	
	\ProcessOptionsBeamer
%%

%% Main
	\newcommand{\printFrontMatter}{
		\frame[plain]\titlepage
	}
	
	\newcommand{\printBackMatter}{
		% nada necessário
	}


\mode<presentation>

%% Header
	% Set header text font, size, color and uppercase it.
	\newcommand{\formatheader}[1]{{%
		\color{white}%
		\rmfamily\scshape\mdseries\fontsize{7.2}{7.2pt}\selectfont{#1}%
	}}
	
	% Isolated header template
	\newcommand{\printHeader}{{%
		{\color[gray]{0.4}\vrule height.028\paperwidth width\paperwidth}%
		\rlap{\raisebox{.0088\paperwidth}[0pt][0pt]{\hskip-.976\paperwidth\formatheader{\bimer@institutedepartment}}}%
		\llap{\raisebox{.0088\paperwidth}[0pt][0pt]{\formatheader{\bimer@shortinstitute}\hspace*{0.024\paperwidth}}}%
	}}
	
	% Activate Everywhere
	\setbeamertemplate{headline}{\printHeader}
%%

%% Title Page
	\setbeamertemplate{title page}
	{%
		% Header
		\rlap{% Force start in right margin
			\hskip-\Gm@lmargin% Ignore default left margin alignment
			\printHeader% Insert Header Manually (must be used in plain frame)
		}%
		% Upper Left Figure
		\rlap{% Force start in left margin
			\hskip-\Gm@lmargin% Ignore default left margin alignment
			\pgfuseimage{title_UL_figure}% Inserts the UL figure
		}%
        % Presentation Context
        \vskip-.015\paperwidth% Invades the UL figure a little
        \sffamily\fontsize{8}{8pt}\upshape\mdseries\bimer@institutecontext\par% Inserts Context at default margin
        % Context Line and Logo
		\vskip-.075\paperwidth% Invades the UL figure a lot
		\rlap{% Force start in left margin, ignoring Presentation Context
			\hskip-\Gm@lmargin% Ignore default left  margin alignment
			\begin{pgfpicture}{0}{-.0005\paperwidth}{\paperwidth}{.0005\paperwidth}% Thin figure for our line
				\pgfpathrectangle{\pgfpoint{0}{.0005\paperwidth}}{\pgfpoint{\paperwidth}{.0005\paperwidth}}% Thin rectangle
				\pgfusepathqfill% Fill the rectangle, painting the line
			\end{pgfpicture}%
			\hskip-.115\paperwidth% Invades the lign horizontaly
        	\raisebox{-3pt}{% Invades the lign verticaly
        		\pgfuseimage{title_UR_figure}%  Inserts the UR figure
        	}%
        }%
		\vskip0pt plus 1filll% Fill vertical space with weight 1
        %% Presentation Info
        \parbox{\textwidth}{% Title Content
			{\usebeamerfont{title}\usebeamercolor[fg]{title}\inserttitle\par}%
			{\usebeamerfont{subtitle}\vskip.1\baselineskip\usebeamercolor[fg]{subtitle}\insertsubtitle\par}%
			{\usebeamerfont{author}\vskip\baselineskip\usebeamercolor[fg]{author}\insertauthor\par}%
			{\usebeamerfont{institute}\usebeamercolor[fg]{institute}\insertinstitute\par}%
			{\usebeamercolor[fg]{titlegraphic}\inserttitlegraphic\par}%
        }
        \vskip0pt plus 2filll% Fill vertical space with weight 2
        % Lower Right Figure
        \makebox[\linewidth][l]{% A box with no margin restrictions (avoid anoying warnings)
	        \raisebox{0pt}[0pt][0pt]{% A box which doesn't actually take space (makes vertical fills above work)
	        	\hskip-\Gm@rmargin% Ignore default margin alignment
				\hskip\paperwidth% Skip to the end of the page
				\llap{% Position the figure before the end of page
					\pgfuseimage{title_LR_figure}% Insert LR figure
				}%
			}%
		}%
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