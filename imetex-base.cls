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

\ProvidesClass{imetex-base}[2015/03/19 v0.2 imeTeX]
\NeedsTeXFormat{LaTeX2e}
\LoadClass{abntex2}

%% Package Dependencies
	% Basic Packages
	\usepackage[utf8]{inputenc}   % Codificação de caracteres especiais
	\usepackage[alf]{abntex2cite} % Citações padrão ABNT
	\usepackage{graphicx}         % Inclusão de gráficos

	% Other Packages
	\usepackage{cmap}             % Mapear caracteres especiais no PDF
	\usepackage{lmodern}          % Usa a fonte Latin Modern
	\usepackage[T1]{fontenc}      % Selecao de codigos de fonte.
	\usepackage{lastpage}         % Usado pela Ficha catalográfica
	\usepackage{indentfirst}      % Indenta o primeiro parágrafo de cada seção.
	\usepackage{color}            % Controle das cores
%%

%% Useful Fields
	% Advisors (Orientadores)
	\providecommand{\advisorName}{}
	\providecommand{\advisorTitle}{}
	\providecommand{\advisorInstitution}{}
	\newcommand{\advisor}[3]{
		\renewcommand{\advisorName}{#1}
		\renewcommand{\advisorTitle}{#2}
		\renewcommand{\advisorInstitution}{#3}
	}
	\providecommand{\coadvisorName}{}
	\providecommand{\coadvisorTitle}{}
	\providecommand{\coadvisorInstitution}{}
	\newcommand{\coadvisor}[3]{
		\renewcommand{\coadvisorName}{#1}
		\renewcommand{\coadvisorTitle}{#2}
		\renewcommand{\coadvisorInstitution}{#3}
	}
	
	% Preamble (Preâmbulo)
	\providecommand{\thepreamble}{}
	\newcommand{\preamble}[1]{\renewcommand{\thepreamble}{#1}	}
%%

%% Necessary abnTeX2 Specializations

%%

%% Main Commands
	% Make All
	\newcommand{\makeall}
	{
		% override me, please
	}

	% Cover Page (Capa)
	\newcommand{\makeCover}
	{
		\begin{titlingpage}
			\center
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
			\vspace*{1cm}
		\end{titlingpage}
		\clearpage
	}
	
	% Title Page (Folha de Rosto)
	\newcommand{\makeTitle}
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
			\par \IfNoText{\advisorName}{Orientador: \advisorName\ - \advisorTitle}
			\par \IfNoText{\coadvisorName}{Co-orientador: \coadvisorName\ - \coadvisorTitle}
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
	\newcommand{\makeCatalog}
	{
		\begin{fichacatalografica}
		\let\footnotesize\small
		\let\footnoterule\relax
		\let\footnote\thanks
		\noindent
		\normalsize
		c\thedate
		
		INSTITUTO MILITAR DE ENGENHARIA\\
		Praça General Tibúrcio, 80 - Praia Vermelha\\
		Rio de Janeiro-RJ CEP 22290-270
		
 		\vspace{10mm}
		Este exemplar é de propriedade do Instituto Militar de Engenharia, que poderá incluí-lo em base de dados,
		armazenar em computador, microfilmar ou adotar qualquer forma de arquivamento.

		\vspace{10mm}
		\indent
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
				\parbox[t]{9.5cm}{\noindent \hspace{4mm}  /{\let\\=, \imprimirautor}; orientados por \imprimirorientador\ - Rio de Janeiro: Instituto Militar de Engenharia, \the\year{}.}\\
				\parbox[t]{2cm}{\ }
				\parbox[t]{9.5cm}{\noindent \hspace{4mm}}\\
				[\baselineskip]
				\parbox[t]{2cm}{\ }
				\parbox[t]{9.5cm}{\noindent \hspace{4mm} \pageref{LastPage}p. : il.} \\
				[\baselineskip]
				\parbox[t]{2cm}{\ }
				\parbox[t]{9.5cm}{\noindent \hspace{4mm}  - Instituto Militar de Engenharia \vspace{1mm} - Rio de Janeiro, \the\year{}. } \\
				[\baselineskip]
				\parbox[t]{2cm}{\ }
				\parbox[t]{9.5cm}{\noindent \hspace{4mm} }\\
			\end{minipage}
		}

		\end{fichacatalografica}
		\clearpage
	}
%%

%% Useful Commands
\makeatletter
	\newcommand{\IfNoText}[2]
	{
		\sbox0{#1}
		\ifdim\wd0=0pt
		\else
			{#2}
		\fi
	}
\makeatother
%%