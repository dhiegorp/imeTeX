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
	\newcommand{\bimer@institutecontext}{}
	\newcommand{\context}[1]{\renewcommand{\bimer@institutecontext}{#1}}
	
	% Institute Specification
	\newcommand{\bimer@shortinstitute}{instituto militar de engenharia}
	\newcommand{\bimer@institutedepartment}{seção de ensino básico}
	\newcommand{\bimer@institutequarterlogo}{QEMquarter}
	
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
		\frame[plain] \titlepage
	}
	
	\newcommand{\printBackMatter}{
		% nada necessário
	}


\mode<presentation>

%% Header
	% Set header text font, size, color and uppercase it.
	\newcommand{\formatheader}[1]{{%
		\color{white}%
		\fontencoding{T1}\fontfamily{ugm}\fontshape{n}\fontseries{bx}\fontsize{5.4}{5.4pt}\selectfont%
		\uppercase\expandafter{#1}%
		%\rmfamily\scshape\mdseries\fontsize{7.2}{7.2pt}\selectfont{#1}
	}}
	
	% Isolated header template
	\newcommand{\printHeader}{{%
		{\color[gray]{0.4}\vrule height.028\paperwidth width\paperwidth}%
		\rlap{\raisebox{.0088\paperwidth}[0pt][0pt]{\hskip-.976\paperwidth\formatheader{\bimer@institutedepartment}}}%
		\llap{\raisebox{.0088\paperwidth}[0pt][0pt]{\formatheader{\bimer@shortinstitute}\hspace*{0.024\paperwidth}}}%
	}}
	
	% Activate Everywhere
	\setbeamertemplate{headline}{{\printHeader}}

%% Title Page (Dangerous Zone)
	\setbeamertemplate{title page}
	{%
		\global\beamer@frametopskip=0pt plus 1fill\relax
		% Upper Left Figure (IME)
		\raisebox{-0.11\paperwidth}[0pt][0pt]{\rlap{\hskip-\Gm@lmargin%
          \pgfdeclareimage[height=.078\paperwidth]{IMEfront}{IMEfront}%
          \pgfuseimage{IMEfront}}%
		}%
        % Manualy insert header
        \raisebox{-.028\paperwidth}[0pt][0pt]{\rlap{\hskip-\Gm@lmargin\printHeader}}%
        % Lower Right Figure
        \raisebox{-\paperheight}[0pt][0pt]{%
        	\hskip-\Gm@lmargin
			\rlap{\hskip\paperwidth
				\pgfdeclareimage[width=.375\paperwidth]{quarter}{\bimer@institutequarterlogo}%
				\llap{\pgfuseimage{quarter}}%
			}%
        }%
        % Presentation context (User Defined)
        {\vskip.09\paperwidth\usebeamercolor[fg]{titlepage head}%
        	\sffamily\fontsize{8}{8pt}\upshape\mdseries
        	\bimer@institutecontext\par%
        }%
        % Context Line and Logo
		{\setlength{\beamer@rightsidebar}{.1138\paperwidth}\vskip-.075\paperwidth\hskip-\Gm@lmargin\rlap{%
			\begin{pgfpicture}{0pt}{-.0005\paperwidth}{\paperwidth}{.0005\paperwidth}%
			\begingroup
			{\color{black}%
				\pgfpathrectangle{\pgfpoint{0pt}{-.0005\paperwidth}}{\pgfpoint{\paperwidth}{.0005\paperwidth}}\pgfusepathqfill%
			}%
			\endgroup
			\end{pgfpicture}%
			\hskip-.5\beamer@rightsidebar\hskip-.0325\paperwidth
        	\raisebox{-.0055\paperwidth}{%
        		\pgfdeclareimage[height=.09\paperwidth]{IMEsymbol}{IMEsymbol}%
        		\pgfuseimage{IMEsymbol}%
        	}%
        }}%
		\vskip0pt plus 1filll%
        %% Presentation Info
        \parbox{\textwidth}{
			{\usebeamerfont{title}\usebeamercolor[fg]{title}\inserttitle\par}%
			{\usebeamerfont{subtitle}\vskip.1\baselineskip\usebeamercolor[fg]{subtitle}\insertsubtitle\par}%
			{\usebeamerfont{author}\vskip\baselineskip\usebeamercolor[fg]{author}\insertauthor\par}%
			{\usebeamerfont{institute}\usebeamercolor[fg]{institute}\insertinstitute\par}%
			{\usebeamercolor[fg]{titlegraphic}\inserttitlegraphic\par}
        }
        \vskip0pt plus 2filll
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