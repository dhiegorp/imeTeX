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
%% Discussion about this library can be done at compime16@gmail.com
%%
%% Based on ime-abntex2 class by Jan Segre
%%
%% Builds on abnTeX2
%% Further information about abnTeX2 are available on http://abntex2.googlecode.com/

\ProvidesClass{imetex}[2015/04/10 v0.3 imeTeX]
\NeedsTeXFormat{LaTeX2e}
\LoadClass{abntex2}

%% Packages
	% Basic Packages
	\usepackage{ime-style}
	\usepackage[utf8]{inputenc}   % Codificação de caracteres especiais
	\usepackage[alf]{abntex2cite} % Citações padrão ABNT
	\usepackage{graphicx}         % Inclusão de gráficos

	% Other Packages
	\usepackage{amsthm}				% Proof Environment
	\usepackage{amsfonts}			% Math Fonts
	\usepackage{cmap}             % Mapear caracteres especiais no PDF
	\usepackage{lmodern}          % Usa a fonte Latin Modern
	\usepackage[T1]{fontenc}      % Selecao de codigos de fonte.
	\usepackage{lastpage}         % Usado pela Ficha catalográfica
	\usepackage{indentfirst}      % Indenta o primeiro parágrafo de cada seção.
	\usepackage{color}            % Controle das cores
	\usepackage{hyperref}			% Hyperlinks and URLs
%%

%% Variable Commands
	\providecommand{\printFrontMatter}{}
%%

%% Class Options
	% Class Notes (notas de aula) : default option
	\DeclareOption{notas}{
		\renewcommand{\printFrontMatter}
		{
			\frontmatter
			\printCover
			\mainmatter
		}
	}
	
	% Homework Assignments and Reports (Trabalhos e Relatórios)
	\DeclareOption{trab}{
		\renewcommand{\printFrontMatter}
		{
			\frontmatter
			\printCover
			\mainmatter
		}
	}

	% Scientific Publication (Iniciação Científica)
		\DeclareOption{inci}{
		\renewcommand{\printFrontMatter}
		{
			\frontmatter
			\printCover
			\mainmatter
		}
	}
	
	% Final Thesis (Projeto de Fim de Curso)
	\DeclareOption{pfc}{
		\renewcommand{\printFrontMatter}
		{
			\frontmatter
			\printTitle
			\printCover
			\printCatalog
			\mainmatter
		}	
	}
	
	\ExecuteOptions{notas}
	\ProcessOptions
%%

%% Useful Fields
	% Authors (Autores)
	\newcommand{\imetex@authorName}{
		\theauthor
	}
	\providecommand{\imetex@coauthorName}{}
	\newcommand{\coauthor}[1]{
		\renewcommand{\imetex@coauthorName}{#1}
	}
	
	% Advisors (Orientadores)
	\providecommand{\imetex@advisorName}{}
	\providecommand{\imetex@advisorTitle}{}
	\providecommand{\imetex@advisorInstitution}{}
	\newcommand{\advisor}[3]{
		\renewcommand{\imetex@advisorName}{#1}
		\renewcommand{\imetex@advisorTitle}{#2}
		\renewcommand{\imetex@advisorInstitution}{#3}
	}
	\providecommand{\imetex@coadvisorName}{}
	\providecommand{\imetex@coadvisorTitle}{}
	\providecommand{\imetex@coadvisorInstitution}{}
	\newcommand{\coadvisor}[3]{
		\renewcommand{\imetex@coadvisorName}{#1}
		\renewcommand{\imetex@coadvisorTitle}{#2}
		\renewcommand{\imetex@coadvisorInstitution}{#3}
	}
	
	% (Banca Examinadora)
	% TODO
	
	% Preamble (Preâmbulo)
	\providecommand{\imetex@preamble}{}
	\newcommand{\preamble}[1]{\renewcommand{\imetex@preamble}{#1}	}
%%

%% Necessary abnTeX2 Specializations

%%

%% Main Commands
	% Cover Page (Capa)
	\newcommand{\printCover}
	{{
		\centering
		\ABNTEXchapterfont
		\small
		
		MINISTÉRIO DA DEFESA\\
		EXÉRCITO BRASILEIRO\\
		DEPARTAMENTO DE CIÊNCIA E TECNOLOGIA\\
		INSTITUTO MILITAR DE ENGENHARIA\\
		(Real Academia de Artilharia, Fortificação e Desenho/1792)\\
		CURSO DE GRADUAÇÃO EM ENGENHARIA DE COMPUTAÇÃO\\
		
		\vspace*{5cm}
		
		\ABNTEXsectionfontsize
		\theauthor\\
		
		\vspace*{5cm}
		
		\ABNTEXchapterfontsize
		\thetitle\\
		
		\vfill
		\large
		Rio de Janeiro\\
		\thedate\\
		
		\clearpage
	}}
	
	% Title Page (Folha de Rosto)
	\newcommand{\printTitle}
	{
		\begin{center}
			\ABNTEXchapterfont
			\Large
			Instituto Militar de Engenharia\\
			\vspace*{2cm}
			\theauthor\\
			\vspace*{4cm}
			\thetitle\\
			\vspace*{3cm}
		\end{center}

		\hspace{.45\textwidth}
		\begin{minipage}{.5\textwidth}
			\SingleSpacing
			\par \thepreamble
			\par \ifNoText{\imetex@advisorName}{Orientador: \imetex@advisorName\ - \imetex@advisorTitle}
			\par \ifNoText{\imetex@coadvisorName}{Co-orientador: \imetex@coadvisorName\ - \imetex@coadvisorTitle}
		\end{minipage}

		\vspace*{\fill}
		
		\begin{center}
			\large
			Rio de Janeiro\\
			\thedate\\
		\end{center}
		
		\clearpage
	}
	
	% Catalog Page (Ficha Catalográfica)
	\newcommand{\printCatalog}
	{{
		\thispagestyle{empty}
		\normalsize
		
		{
			\noindent
			c\thedate\\
		}
		
		\vspace{5mm}
		{
			\noindent
			INSTITUTO MILITAR DE ENGENHARIA\\
			Praça General Tibúrcio, 80 - Praia Vermelha\\
			Rio de Janeiro-RJ CEP 22290-270
		}
		
 		\vspace{10mm}
		Este exemplar é de propriedade do Instituto Militar de Engenharia, que poderá incluí-lo em base de dados,
		armazenar em computador, microfilmar ou adotar qualquer forma de arquivamento.

		\vspace{10mm}
		É permitida a menção, reprodução parcial ou integral e a transmissão entre bibliotecas deste trabalho, sem
		modificação de seu texto, em qualquer meio que esteja ou venha a ser fixado, para pesquisa acadêmica,
		comentários e citações, desde que sem finalidade comercial e que seja feita a referência bibliográfica
		completa.

		\vspace{10mm}
		Os conceitos expressos neste trabalho são de responsabilidade do(s) autor(es) e do(s) orientador(es).

		\vspace{10mm}
		\noindent
		\hspace{4.5cm}
		\framebox[11.5cm]
		{
			\footnotesize
			\begin{minipage}{12cm}
				\vspace*{1mm}
				\parbox[t]{2cm}{\hspace{4mm} }
				\parbox[t]{9.5cm}{\noindent }\\
				\parbox[t]{2cm}{\hspace{4mm} }
				\parbox[t]{9.5cm}{\noindent \hspace{4mm}  /{\let\\=, \theauthor}; orientados por \imprimirorientador\ - Rio de Janeiro: Instituto Militar de Engenharia, \thedate.}\\
				\parbox[t]{2cm}{\ }
				\parbox[t]{9.5cm}{\noindent \hspace{4mm}}\\
				[\baselineskip]
				\parbox[t]{2cm}{\ }
				\parbox[t]{9.5cm}{\noindent \hspace{4mm} \pageref{LastPage}p. : il.} \\
				[\baselineskip]
				\parbox[t]{2cm}{\ }
				\parbox[t]{9.5cm}{\noindent \hspace{4mm}  - Instituto Militar de Engenharia \vspace{1mm} - Rio de Janeiro, \thedate. } \\
				[\baselineskip]
				\parbox[t]{2cm}{\ }
				\parbox[t]{9.5cm}{\noindent \hspace{4mm} }\\
			\end{minipage}
		}

		\clearpage
	}}
	
	%% Bibliography (Bibliografia)
	\newcommand{\printBackMatter}
	{
		\backmatter
		\pagestyle{plain}
		%\bibliography{bibliography}
	}
%%