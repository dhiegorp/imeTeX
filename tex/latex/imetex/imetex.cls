%% This work may be distributed and/or modified under the 
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status 'author-maintained'.
%%
%% The Current Maintainer of this work is Victor Chaves, vvb.chaves@gmail.com
%%
%% Builds on abnTeX2
%% Further information about abnTeX2 are available on http://abntex2.googlecode.com/

\ProvidesClass{imetex}[2015/08/02 imeTeX]
\NeedsTeXFormat{LaTeX2e}
\LoadClass[oneside]{abntex2}

\AtBeginDocument{\makeindex}

%% Dependencies
	%% Core Packages
	\usepackage{cmap}				% Extra mathematical symbols
	\usepackage[utf8]{inputenc}		% UTF8 encoding
	\usepackage[T1]{fontenc}		% Font encoding
	\usepackage{hyperref}			% Hyperlinks and URLs
	\usepackage{graphicx}			% Include grafics
	\usepackage{lmodern}			% Standard font
	\usepackage{amsthm}				% Proof Environment
	\usepackage{amsfonts}			% Math Fonts
	\usepackage{etoolbox}			% Booleans, Hooks & Advanced Stuff
	\usepackage[alf]{abntex2cite}	% ABNT References styles

	% Utility Packages
	\usepackage{ime-style}			% Extra functionalities
	\usepackage{physics}			% Physics Notations
	\usepackage{lastpage}			% Usado pela Ficha catalográfica
	\usepackage{indentfirst}		% Indent the first paragraph (not required by ABNT)
	\usepackage[figure,table,lstlisting]{totalcount}
%%

%% Class Variables
	% Conditionals
	\newbool{coverRequired}
	\newbool{titleRequired}
	\newbool{catalogRequired}
	\newbool{approvalRequired}
	\newbool{dedicationProvided}
	\newbool{thanksProvided}
	\newbool{epigraphProvided}
	\newbool{abstractRequired}
	\newbool{translatedAbstractRequired}
	\newbool{listOfFiguresWanted}
	\newbool{listOfTablesWanted}
	\newbool{listOfCodesWanted}
	\newbool{listOfAbbreviationsWanted}
	\newbool{listOfSymbolsWanted}
	\newbool{tableOfContentsRequired}
	
	% Information
	\providecommand{\imetex@department}{}
%%

%% Class Options
	% Laboratory Reports (Labs & Práticas)
	\DeclareOption{lab}{
		\booltrue{coverRequired}
		\booltrue{tableOfContentsRequired}
	}

	% Scientific Reports (TD/IP & PIBITI/PIBIC)
	\DeclareOption{inci}{
		\booltrue{coverRequired}
		\booltrue{titleRequired}
		\booltrue{abstractRequired}
		\booltrue{tableOfContentsRequired}
	}
	
	% Final Thesis (Projeto de Fim de Curso)
	\DeclareOption{pfc}{
		\booltrue{coverRequired}
		\booltrue{titleRequired}
		\booltrue{catalogRequired}
		\booltrue{approvalRequired}
		\booltrue{abstractRequired}
		\booltrue{translatedAbstractRequired}
		\booltrue{tableOfContentsRequired}
	}
	
	% Optional Elements
	\DeclareOption{lof}{
		\booltrue{listOfFiguresWanted}
	}
	\DeclareOption{lot}{
		\booltrue{listOfTablesWanted}
	}
	\DeclareOption{loa}{
		\booltrue{listOfAbbreviationsWanted}
	}
	\DeclareOption{loc}{
		\booltrue{listOfCodesWanted}
	}
	
	% Department
	\DeclareOption{comp}{\renewcommand{\imetex@department}{Seção De Engenharia De Computação / SE8}}
	\DeclareOption{elo}{\renewcommand{\imetex@department}{Seção De Engenharia Eletrônica / SE3}}
	\DeclareOption{ele}{\renewcommand{\imetex@department}{Seção De Engenharia Elétrica / SE3}}
	\DeclareOption{tele}{\renewcommand{\imetex@department}{Seção De Engenharia De Telecomunicações / SE3}}
	\DeclareOption{mat}{\renewcommand{\imetex@department}{Seção De Engenharia De Materiais / SE?}}
	\DeclareOption{qui}{\renewcommand{\imetex@department}{Seção De Engenharia Química / SE?}}
	\DeclareOption{fc}{\renewcommand{\imetex@department}{Seção De Engenharia De Fortificação e Construção / SE?}}
	\DeclareOption{mec}{\renewcommand{\imetex@department}{Seção De Engenharia Mecânica / SE?}}

	\ProcessOptions
%%

%% Main Commands
	% Front Matter
	\AfterEndPreamble{
		\frontmatter
		\ifbool{coverRequired}{
			\printCover
		}{}
		\ifbool{titleRequired}{
			\printTitle
		}{}
		\ifbool{catalogRequired}{
			\printCatalog
		}{}
		\ifbool{approvalRequired}{
			\printApproval
		}{}
		\ifbool{dedicationProvided}{
			\printDedication
		}{}
		\ifbool{thanksProvided}{
			\printThanks
		}{}
		\ifbool{epigraphProvided}{
			\printEpigraph
		}{}
		\ifbool{listOfFiguresWanted}{
			\iftotalfigures
				\printListOfFigures
			\fi
		}{}
		\ifbool{listOfTablesWanted}{
			\iftotaltables
				\printListOfTables
			\fi
		}{}
		\ifbool{listOfCodesWanted}{
			\iftotallstlistings
				\printListOfCodes
			\fi
		}{}
		\ifbool{listOfAbbreviationsWanted}{
			\printListOfAbbreviations
		}{}
		\ifbool{listOfSymbolsWanted}{
			\printListOfSymbols
		}{}
		\ifbool{abstractRequired}{
			\printAbstract
		}{}
		\ifbool{translatedAbstractRequired}{
			\printTranslatedAbstract
		}{}
		\ifbool{tableOfContentsRequired}{
			\printTableOfContents
		}{}
		\mainmatter
	}
	
	% Back Matter
	\AtEndDocument{
		\backmatter
		\pagestyle{plain}
		\printBibliography
	}
%%

%% Useful Fields
	% Document Details
	\providecommand{\imetex@title}{}
	\renewcommand{\title}[1]{
		\renewcommand{\imetex@title}{#1}
	}
	\providecommand{\imetex@subtitle}{}
	\newcommand{\subtitle}[1]{
		\renewcommand{\imetex@subtitle}{#1}
	}

	% Authors
	\providecommand{\imetex@authorName}{}
	\renewcommand{\author}[1]{
		\renewcommand{\imetex@authorName}{#1}
	}
	\providecommand{\imetex@coauthorName}{}
	\newcommand{\coauthor}[1]{
		\renewcommand{\imetex@coauthorName}{#1}
	}
	
	% Advisors
	\providecommand{\imetex@advisorName}{}
	\providecommand{\imetex@advisorTitle}{}
	\newcommand{\advisor}[2][]{
		\renewcommand{\imetex@advisorTitle}{#1}
		\renewcommand{\imetex@advisorName}{#2}
	}
	\providecommand{\imetex@coadvisorName}{}
	\providecommand{\imetex@coadvisorTitle}{}
	\newcommand{\coadvisor}[2][]{
		\renewcommand{\imetex@coadvisorTitle}{#1}
		\renewcommand{\imetex@coadvisorName}{#2}
	}
	
	% (Banca Examinadora)
	%TODO
	
	% Preamble (Preâmbulo)
	\providecommand{\imetex@preamble}{}
	\newcommand{\preamble}[1]{
		\renewcommand{\imetex@preamble}{#1}
	}
	
	% Abstract (Resumo)
	\providecommand{\imetex@abstract}{}
	\renewcommand{\abstract}[1]{
		\renewcommand{\imetex@abstract}{#1}
	}
	
	% Referências
	\providecommand{\imetex@bibliography}{}
	\newcommand{\references}[1]{
		\renewcommand{\imetex@bibliography}{#1}
	}
%%

%% Textual Elements
	% Cover Page (Capa)
	\newcommand{\printCover}
	{{
		\centering
		\ABNTEXchapterfont
		\small
		\imetex@governmentFiliation\\
		\imetex@department
		
		\vspace*{5cm}
		
		\ABNTEXsectionfontsize
		\imetex@authorName\\
		
		\vspace*{5cm}
		
		\ABNTEXchapterfontsize
		\ifNotEmpty{\imetex@title}{\imetex@title\\}
		
		\vfill
		
		\large
		Rio de Janeiro\\
		\thedate		
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
			\imetex@authorName\\
			\vspace*{4cm}
			\ifNotEmpty{\imetex@title}{\imetex@title\\}
			\vspace*{3cm}
		\end{center}

		\hspace{.45\textwidth}
		\begin{minipage}{.5\textwidth}
			\SingleSpacing
			\par \imetex@preamble
			\par \ifNotEmpty{\imetex@advisorName}{Orientador: \imetex@advisorName\ - \imetex@advisorTitle}
			\par \ifNotEmpty{\imetex@coadvisorName}{Co-orientador: \imetex@coadvisorName\ - \imetex@coadvisorTitle}
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
				\parbox[t]{9.5cm}{\noindent \hspace{4mm}  /{\let\\=, \imetex@authorName}; orientados por \imetex@advisorName - Rio de Janeiro: Instituto Militar de Engenharia, \thedate.}\\
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
	
	% Approval Page (folha de aprovação)
	\newcommand{\printApproval}{
		%TODO
	}
	
	% Dedication Page (dedicatória)
	\newcommand{\printDedication}{
		%TODO
	}
	
	% Thanks Page (agradecimentos)
	\newcommand{\printThanks}{
		%TODO
	}
	
	% Epigraph (epígrafe)
	\newcommand{\printEpigraph}{
		%TODO
	}
	
	% Table of Contents (Sumário)
	\newcommand{\printTableOfContents}{
		\tableofcontents*
		\clearpage
	}
	
	% List of Figures (Lista de figuras)
	\newcommand{\printListOfFigures}{
		\listoffigures*
		\clearpage
	}
	
	% List of Tables (Lista de tabelas)
	\newcommand{\printListOfTables}{
		\listoftables*
		\clearpage
	}
	
	% List of Listings (Lista de códigos)
	\newcommand{\printListOfCodes}{
		\pdfbookmark[0]{\lstlistlistingname}{lol}
		\begin{KeepFromToc}
			\lstlistoflistings
		\end{KeepFromToc}
		\cleardoublepage
	}
	
	% List of Abbreviations (Lista de abreviações)
	\newcommand{\printListOfAbbreviations}{
		%TODO
	}
	
	% List of Symbols (Lista de abreviações)
	\newcommand{\printListOfSymbols}{
		%TODO
	}
	
	% Abstract Page (Resumo)
	\newcommand{\printAbstract}{
		\pdfbookmark[0]{Resumo}{abs}
		\imetex@abstract		
		\clearpage
	}
	
	% Translated Abstract Page (Resumo Traduzido)
	\newcommand{\printTranslatedAbstract}{
		\pdfbookmark[0]{Abstract}{tabs}
		\imetex@translatedAbstract
		\clearpage
	}
	
	%% Bibliography (Bibliografia)
	\newcommand{\printBibliography}
	{
		\bibliography{\imetex@bibliography}
	}
%%

%% Other Commands
	% Coat of Arms (brasão de armas do brasileiro)
	\newcommand{\imetex@coatOfArms}{
		%\includegraphics[scale=0]{•}
	}
	
	% Government Filiation (filiação governamental do IME)
	\newcommand{\imetex@governmentFiliation}{
		MINISTÉRIO DA DEFESA\\
		EXÉRCITO BRASILEIRO\\
		DEPARTAMENTO DE CIÊNCIA E TECNOLOGIA\\
		INSTITUTO MILITAR DE ENGENHARIA
	}
	
	% Historical Note (observação histórica do IME)
	\newcommand{\imetex@historicalNote}{
		Real Academia de Artilharia, Fortificação e Desenho, 1792
	}
%%