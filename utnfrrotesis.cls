%% usepackage[left=4.06cm,top=2.54cm,right=2.54cm,bottom=2.54cm]{geometry}
%% utnfrrotesis.cls - Clase de LaTeX2e para tesis de la UTN-FRRO.
%%
%% Para mas informaci'on consultar el tutorial que se incluye con este archivo
%%
%% Version 1.0c por Juan Antonio Navarro (ma108907@mail.udlap.mx)
%% http://www.udlap.mx/~ma108907/latex
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Version 2.0 - Marzo 2018 / Federico Tesone
%%	- Adaptación para tesis de UTN FRRO.
%%
%% Version 1.0c - Junio 2004 / Juan Antonio Navarro
%%
%% - \aprovalpage y {thankspage} no se numeran, la primera p'agina
%%   numerada es el 'indice general.
%% - la bibliograf'ia aparece en el 'indice general.
%% - se defini'o un entorno {abstract} para agregar un resumen de la tesis.
%% - gracias a Harumi Shibata y Fernando Zacar'ias por sus sugerencias.
%%
%% Version 1.0b - Noviembre 2003 / Juan Antonio Navarro
%%
%% - cambios y reestructuracion general del codigo, ahora la clase esta basada
%%   en report.cls como la mayoria de las clases de tesis alrededor del mundo.
%% - el campo \author soporta y maneja correctamente el comando \and para poder
%%   especificar varios autores. (codigo prestado de llncs.cls)
%% - cambi'o la forma de especificar el jurado, ahora hay campos individuales
%%   para \advisor, \president, \secretary, y \departmenthead.
%% - crea automaticamente la forma de liberacion final: \approvalpage.
%% - se corrigi'o y funcionan correctamente los modos de espaciado, ahora hay
%%   \singlespacing, \doublespacing, asi como los ambientes `singlespace'
%%   y `doublepace'. (codigo prestado de la thesis.cls de U. colorado)
%% - se corrigieron los margenes a los valores oficiales.
%% - se cambiaron los defaults a: 12pt, oneside, doublespacing.
%% - se actualizaron los archivos de los logotipos, ahora tienen mucha mejor calidad
%%   y se guardaron en verdadero formato vectorial (no mapa de bits)
%% - se agrego compatibilidad para el estilo requerido por el Departamento de Actuar'ia
%%   usando la opcion [atstyle] se obtiene este modo, el default es [fmstyle].
%% - la clase carga automaticamente a babel en espa~nol y se cambia la leyenda
%%   espa~nola `Cuadro' por el esperado valor de `Tabla'.
%% - el estilo de programaci'on mejoro mucho en general =)
%% - mil gracias a Harumi Shibata por su ayuda y comentarios.
%%
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{utnfrrotesis}[2018/03/18 v1.0 Formato para tesis de la UTN-FRRO]

\newif\if@isdraft
\newif\if@atstyle
%%\newcommand{\@logosource}{logoblack.png}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\if@colors\@colorstrue
\newif\if@graphicx\@graphicxtrue
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% \gdef define de manera global la secuencia de comandos dados inmediatamente a continuación del valor de su argumento
\DeclareOption{draft}{ \@isdrafttrue  \PassOptionsToClass{draft}{report} }
\DeclareOption{final}{ \@isdraftfalse \PassOptionsToClass{final}{report} }
\DeclareOption{openright}{ \PassOptionsToClass{openright}{report} }
\DeclareOption{openany}{ \PassOptionsToClass{openany}{report} }
\DeclareOption{twoside}{ \PassOptionsToClass{twoside}{report} }
\DeclareOption{oneside}{ \PassOptionsToClass{oneside}{report} }
\DeclareOption{fleqn}{ \PassOptionsToClass{fleqn}{report} }
\DeclareOption{leqno}{ \PassOptionsToClass{leqno}{report} }
\DeclareOption{openbib}{ \PassOptionsToClass{openbib}{report} }
\DeclareOption{black}{\gdef\@logosource{imagenes/portada/logoUTN.png}}
\DeclareOption{color}{\gdef\@logosource{imagenes/portada/logoUTN.png}}
\DeclareOption{gray}{\gdef\@logosource{imagenes/portada/logoUTN.png}}
\DeclareOption{atstyle}{\@atstyletrue}
\DeclareOption{fmstyle}{\@atstylefalse}


% Utilizar el justificado total para todo el texto, notas de pié de página (sin sangría),
% bibliografía, y referencias.
% Espaciado de líneas. Cada página tiene que ser presentada con un interlineado a un espacio y medio,
% excepto en los siguientes casos:
% · Página de presentación ó Prólogo, que puede presentarse a doble espacio;
% · Títulos, separados por varios espacios del cuerpo del texto;
% · Subtítulos, separados por tres espacios del texto siguiente;
% · Tablas de contenidos, con interlineado simple;
% · Figuras y/o tablas insertas en el texto, con interlineados simples;
% · Algunas citaciones especiales pueden sacarse del cuerpo del texto y colocarles con interlineado simple y sangría;
% · Las definiciones y cuestionarios dentro de un texto pueden realizarse con interlineado simple aunque deberá aplicarse
%   doble espacio entre un registro y el otro.
% · Las referencias –notas al pié, notas finales, bibliografías o lista de referencias- pueden ejecutarse con un espaciado
%   simple y uno doble para separar una de otra.
% Tabulaciones. Debe ser la misma a lo largo de todo el trabajo.
% Paginado. El número de página debe colocarse
% · centrado al final de cada página,
% · alineado a la derecha al final de cada página, ó
% · en el extremo superior derecho.
% Es necesario mantener consistencia en todo el documento.

% twoside produce la impresión a doble faz
% openright hace que se invoque al comando \cleardoublepage : ends the current page and causes all figures
%   and tables that have so far appeared in the input to be printed. In a two-sided printing style, it also makes the
%   next page a right-hand (odd-numbered) page, producing a blank page if necessary.
% black para la impresión del logo UTN en negro

\ExecuteOptions{final,openright,fmstyle,color}
% \ExecuteOptions{final,twoside, openright,fmstyle,color}
\ProcessOptions
%\LoadClass[A4paper,onecolumn,flushright,12pt]{report}[2008/03/25]
\LoadClass[a4paper,onecolumn,12pt]{report}[2013/11/01]


% load babel using spanish %
\RequirePackage[spanish,activeacute]{babel}

% load graphicx %
\RequirePackage{ifpdf}
\ifpdf
  \RequirePackage[pdftex]{graphicx}
  \pdfcompresslevel=9
  \DeclareGraphicsExtensions{.pdf,.png}
\else
  \RequirePackage[dvips]{graphicx}
  \DeclareGraphicsExtensions{.eps,.ps}
\fi

% class fields %
\renewcommand{\@author}{\ClassError{utnfrrotesis}{Falta especificar \string\author{}}
 {Usa el comando \string\author{} en el preambulo para especificar tu nombre.}}
\renewcommand{\author}[1]{\gdef\@author{#1}}

\renewcommand{\@title}{\ClassError{utnfrrotesis}{Falta especificar \string\title{}}
 {Usa el comando \string\title{} en el preambulo para especificar \MessageBreak
  el titulo de tu tesis.}}
\renewcommand{\title}[1]{\gdef\@title{#1}}

\newcommand{\@degree}{\ClassError{utnfrrotesis}{Falta especificar \string\degree{}}
 {Usa el comando \string\degree{} en el preambulo para especificar la carrera \MessageBreak
  que estas estudiando: \protect Matem\'aticas, F\'{\i}sica, Actuaria.}}
\newcommand{\degree}[1]{\gdef\@degree{#1}}

\newcommand{\@advisorname}{}
\newcommand{\@advisortitle}{}
\newcommand{\@advisor}{\ClassError{utnfrrotesis}{Falta especificar \string\advisor{}{}}
 {Usa el comando \string\advisor[]{}{} en el preambulo para especificar a tu \MessageBreak
  director de tesis. El primer argumento es su titulo (Dr., M. en C.) \MessageBreak
  y el segundo su nombre completo. Opcionalmente puedes modificar su puesto \MessageBreak
  en el jurado si es distinto a `Vocal y Director'.}}
\newcommand{\advisor}[3][Vocal y Director]%
  {\gdef\@advisorname{#1}\gdef\@advisortitle{#2}\gdef\@advisor{#3}}

\newcommand{\@coadvisorname}{}%
\newcommand{\@coadvisortitle}{}%
\newcommand{\@coadvisor}{\ClassError{utnfrrotesis}{Falta especificar \string\coadvisor{}{}}%
 {Usa el comando \string\coadvisor[]{}{} en el preambulo para especificar a tu \MessageBreak%
  codirector de tesis. El primer argumento es su titulo (Dr., M. en C.) \MessageBreak %
  y el segundo su nombre completo. Opcionalmente puedes modificar su puesto \MessageBreak%
  en el jurado si es distinto a `Vocal y Codirector'.}}%
 \newcommand{\coadvisor}[3][Vocal y Codirector]%
 {\gdef\@coadvisorname{#1}\gdef\@coadvisortitle{#2}\gdef\@coadvisor{#3}} %


\newcommand{\@firstjuryname}{}
\newcommand{\@firstjurytitle}{}
\newcommand{\@firstjury}{\ClassError{utnfrrotesis}{Falta especificar \string\firstjury{}{}}
 {Usa el comando \string\firstjury[]{}{} en el preambulo para especificar al \MessageBreak
  primer jurado en tu defensa de tesis. El primer argumento es su \MessageBreak
  titulo (Dr., M. en C.) y el segundo su nombre completo. Opcionalmente puedes %
                                                                           \MessageBreak
  modificar su puesto en el jurado si es distinto a `Presidente'.}}
\newcommand{\firstjury}[3][Presidente]%
  {\gdef\@firstjuryname{#1}\gdef\@firstjurytitle{#2}\gdef\@firstjury{#3}}
\newcommand{\@secondjuryname}{}
\newcommand{\@secondjurytitle}{}
\newcommand{\@secondjury}{\ClassError{utnfrrotesis}{Falta especificar \string\secondjury{}{}}
 {Usa el comando \string\secondjury[]{}{} en el preambulo para especificar al \MessageBreak
  segundo jurado en tu defensa de tesis. El primer argumento es su \MessageBreak
  titulo (Dr., M. en C.) y el segundo su nombre completo. Opcionalmente puedes %
                                                                           \MessageBreak
  modificar su puesto en el jurado si es distinto a `Presidente'.}}
\newcommand{\secondjury}[3][Presidente]%
  {\gdef\@secondjuryname{#1}\gdef\@secondjurytitle{#2}\gdef\@secondjury{#3}}
\newcommand{\@thirdjuryname}{}
\newcommand{\@thirdjurytitle}{}
\newcommand{\@thirdjury}{\ClassError{utnfrrotesis}{Falta especificar \string\thirdjury{}{}}
 {Usa el comando \string\thirdjury[]{}{} en el preambulo para especificar al \MessageBreak
  tercer jurado en tu defensa de tesis. El primer argumento es su \MessageBreak
  titulo (Dr., M. en C.) y el segundo su nombre completo. Opcionalmente puedes %
                                                                           \MessageBreak
  modificar su puesto en el jurado si es distinto a `Presidente'.}}
\newcommand{\thirdjury}[3][Presidente]%
  {\gdef\@thirdjuryname{#1}\gdef\@thirdjurytitle{#2}\gdef\@thirdjury{#3}}



\newcommand{\@presidentname}{}
\newcommand{\@presidenttitle}{}
\newcommand{\@president}{\ClassError{utnfrrotesis}{Falta especificar \string\president{}{}}
 {Usa el comando \string\president[]{}{} en el preambulo para especificar al \MessageBreak
  presidente del jurado en tu defensa de tesis. El primer argumento es su \MessageBreak
  titulo (Dr., M. en C.) y el segundo su nombre completo. Opcionalmente puedes %
                                                                           \MessageBreak
  modificar su puesto en el jurado si es distinto a `Presidente'.}}
\newcommand{\president}[3][Presidente]%
  {\gdef\@presidentname{#1}\gdef\@presidenttitle{#2}\gdef\@president{#3}}

\newcommand{\@secretaryname}{}
\newcommand{\@secretarytitle}{}
\newcommand{\@secretary}{\ClassError{utnfrrotesis}{Falta especificar \string\secretary{}{}}
 {Usa el comando \string\secretary[]{}{} en el preambulo para especificar al \MessageBreak
  secretario del jurado en tu defensa de tesis. El primer argumento es su \MessageBreak
  titulo (Dr., M. en C.) y el segundo su nombre completo. Opcionalmente puedes %
                                                                           \MessageBreak
  modificar su puesto en el jurado si es distinto a `Secretario'.}}
\newcommand{\secretary}[3][Secretario]%
  {\gdef\@secretaryname{#1}\gdef\@secretarytitle{#2}\gdef\@secretary{#3}}

\newcommand{\@departmentheadname}{}
\newcommand{\@departmentheadtitle}{}
\newcommand{\@departmenthead}{\ClassError{utnfrrotesis}%
  {Falta especificar \string\departmenthead{}{}}
 {Usa el comando \string\departmenthead[]{}{} en el preambulo para especificar %
                                                                            \MessageBreak
  el nombre del jefe del departamento de la carrera que estudiaste. El \MessageBreak
  primer argumento es su titulo (Dr., M. en C.) y el segundo su nombre \MessageBreak
  completo. Opcionalmente puedes modificar su cargo si es distinto a \MessageBreak
  `Jefe del Departamento'.}}
\newcommand{\departmenthead}[3][Jefe del Departamento]%
  {\gdef\@departmentheadname{#1}\gdef\@departmentheadtitle{#2}\gdef\@departmenthead{#3}}

\newcommand{\@institution}{Universidad Tecnol\'ogica Nacional}
\newcommand{\institution}[1]{\gdef\@institution{#1}}
\newcommand{\@faculty}{Facultad Regional Rosario}
\newcommand{\faculty}[1]{\gdef\@faculty{#1}}
%\newcommand{\@department}{Departamento Sistemas}
%\newcommand{\department}[1]{\gdef\@department{#1}}
\newcommand{\@grade}{Doctor}
\newcommand{\grade}[1]{\gdef\@grade{#1}}
\newcommand{\@address}{Rosario, Santa Fe, Argentina}
\newcommand{\address}[1]{\gdef\@address{#1}}
%\newcommand{\@termyear}{\thisterm}
%\newcommand{\termyear}[1]{\gdef\@termyear{#1}}
\newcommand{\@monthyear}{\thismonth}
%\newcommand{\@monthyear}{\the\day\slash\the\month\slash\the\year}
\newcommand{\monthyear}[1]{\gdef\@monthyear{#1}}
\renewcommand{\@date}{\longdate}
\renewcommand{\date}[1]{\gdef\@date{#1}}

\newcommand{\logosource}[1]{\gdef\@logosource{#1}}

% default date/time strings %
\newcommand{\monthname}{\ifcase\month\or Enero\or Febrero\or
      Marzo\or Abril\or Mayo\or Junio\or Julio\or Agosto\or Septiembre\or
      Octubre\or Noviembre\or Diciembre\fi}
\newcommand{\termname}{\ifcase\month\or Primavera\or Primavera\or
      Primavera\or Primavera\or Primavera\or Verano\or Verano\or Oto\~no\or Oto\~no\or
      Oto\~no\or Oto\~no\or Oto\~no\fi}

\newcount\hours \newcount\minutes
\def\SetTime{\hours=\time
        \global\divide\hours by 60
        \minutes=\hours
        \multiply\minutes by 60
        \advance\minutes by-\time
        \global\multiply\minutes by-1 }
\SetTime

\newcommand{\thisterm}{\termname\ de \the\year}
\newcommand{\thismonth}{\monthname\ de \the\year}
\newcommand{\longdate}{\@arabic\day\ de \monthname\ de \the\year}
\newcommand{\shortdate}{\@arabic\day/\@arabic\month/\@arabic\year}
\newcommand{\shorttime}{\number\hours:\ifnum\minutes<10 0\fi\number\minutes}

\newcommand{\draftmodeleyend}{(TESIS COMPILADA EN MODO DRAFT)}
\newcommand{\draftleyend}{BORRADOR \shorttime{} - \shortdate{}}
\newcommand{\blankpageleyend}{(esta p\'agina se dej\'o en blanco de manera intencional)}

% double & singlespacing %
% \baselinestretch scales the value of \baselineskip. Its default value is 1.0 but it may be reset with a \renewcommand
% command. If one wants to change the spacing in a document one should reset \baselinestretch

\def\setspace@size{\ifx\@currsize\normalsize\@normalsize\else\@currsize\fi}
\def\doublespacing{\def\baselinestretch{1.660} \setspace@size}
\def\oneandahalfspacing{\def\baselinestretch{1.35} \setspace@size}
\def\singlespacing{\def\baselinestretch{1} \setspace@size}

% \newenvironment{name}[num]{before}{after}
% [num] specifies the number of arguments the new command takes (up to 9 are possible). If missing it defaults to 0, i.e. no argument allowed.
% The material specified in the before argument is processed before the text in the environment gets processed.
% The material in the after argument gets processed when the \end{name} command is encountered.

\newcommand{\subsubsubsection}[1]
{\vspace{3.25ex}
 \noindent\ignorespaces%
 \emph{#1}%
 \par\noindent\ignorespacesafterend
}

%\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}

% \newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
%                                      {-3.25ex\@plus -1ex \@minus -.2ex}%
%                                      {1.5ex \@plus .2ex}%
%                                      {\normalfont\normalsize\bfseries}}
% \newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
%                                     {3.25ex \@plus1ex \@minus.2ex}%
%                                     {-1em}%
%                                     {\normalfont\normalsize\bfseries}}

% \newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
% \newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
% \newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
% \newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
% \newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}

% The arguments provided to \@dottedtocline are:
%
%         \@dottedtocline{LEVEL}{INDENT}{NUMWIDTH}{TITLE}{PAGE}
%
% The last two will actually be provided as arguments of the corresponding "\l@"
% command.  LEVEL is the nesting level (related to the tocdepth counter).
% INDENT is the indentation of the first line of the entry from the left margin
% of the containing environment.  NUMWIDTH is the size you are concerned about:
% The unit number will be left-justified in a box of this width, which will be
% placed immediately to the left of the TITLE.  (NUMWIDTH also sets the indenta-
% tion for any subsequent lines in this entry, if you have a very long section
% title.  This actually isn't likely to happen except for figures - and even
% then, it's usually a bad idea.)


% \par has the purpose of going back to normal everyting

\newenvironment{singlespace}{\vskip\baselineskip\singlespacing\vskip-\baselineskip}{\par}
\newenvironment{oneandahalfspace}{\vskip\baselineskip\oneandahalfspacing\vskip-\baselineskip}{\par}
\newenvironment{doublespace}{\vskip\baselineskip\doublespacing\vskip-\baselineskip}{\par}

% floats & footnotes singlespaced %
\let\latexx@xfloat=\@xfloat
\def\@xfloat #1[#2]{\latexx@xfloat #1[#2]
  \def\baselinestretch{1}\@normalsize\normalsize}
\long\def\@footnotetext#1{
  \insert\footins{
    \def\baselinestretch{1}
    \reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
    \protected@edef\@currentlabel{
      \csname p@footnote\endcsname\@thefnmark}
    \color@begingroup \@makefntext{
        \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}
    \color@endgroup}}
\long\def\@mpfootnotetext#1{
  \global\setbox\@mpfootins\vbox{
    \unvbox \@mpfootins
    \def\baselinestretch {1}
    \reset@font\footnotesize
    \hsize\columnwidth \@parboxrestore
    \protected@edef\@currentlabel{
      \csname p@mpfootnote\endcsname\@thefnmark}
    \color@begingroup \@makefntext{
       \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}
   \color@endgroup}}

\newcommand*{\@normalsize}{\normalsize}
\oneandahalfspacing
%\doublespacing

% page numbering %
% \pagenumbering{roman}
\pagenumbering{arabic}

% \newcommand{name}[num]{definition}
\newcommand{\frontmatter}{\cleardoublepage\pagenumbering{roman}}
\newcommand{\mainmatter}{\cleardoublepage\pagenumbering{arabic}}

% page margins %
% Cada página debe tener como mínimo 1.6” (4.06 cms) de margen izquierdo, y 1" (2.54 cms) en los
% márgenes derecho, superior e inferior. La mayoría de los procesadores de textos
% los fijan automáticamente. Los márgenes pueden ser más amplios pero no menores que éstos.
% \setlength{parameter}{length} assigns a fixed value to the parameter
% \addtolength{parameter}{length} adds a length to the parameter

\if@twoside
	\setlength{\oddsidemargin}{40mm}
	\addtolength{\oddsidemargin}{-1in}
	\setlength{\evensidemargin}{25mm}
	\addtolength{\evensidemargin}{-1in}
	\setlength{\textwidth}{\paperwidth}
	\addtolength{\textwidth}{-65mm}
\else
	\setlength{\oddsidemargin}{40mm}
	\addtolength{\oddsidemargin}{-1in}
	
	\setlength{\evensidemargin}{25mm}
	\addtolength{\evensidemargin}{-1in}
	
	\setlength{\textwidth}{\paperwidth}
	\addtolength{\textwidth}{-65mm}
\fi

\setlength{\topmargin}{25mm}
\addtolength{\topmargin}{-1in}

\setlength{\textheight}{\paperheight}
\addtolength{\textheight}{-\headheight}
\addtolength{\textheight}{-\headsep}
\addtolength{\textheight}{-\footskip}
\addtolength{\textheight}{-40mm}

% support for \and in author%
\newcounter{@count}
\newcounter{@index}

\def\@undefineand{
 \def\and{
   \ClassError{utnfrrotesis}{Illegal use of \string\and}%
     {Do not use the \string\and\space command outside the author field}
 }
}

\@undefineand

\newcommand{\@typeauthor}[2]{
 \def\and{\stepcounter{@index}\relax
          \ifnum\value{@index}=\value{@count}%
             #2
          \else
             #1
          \fi}%
 \setbox0=\vbox{\setcounter{@count}{1}\def\and{\stepcounter{@count}}\@author}
 \setcounter{@index}{1}\@author\@undefineand
}

%%%%%%%%%%%
% TitlePage
%%%%%%%%%%%
% \newlength{\gnat} defines the mandatory argument, \gnat, as a length command with a value of 0in.
% \vspace{length} additional vertical space between two paragraphs
% \vfill keeps on adding empty spaces until the page is full. If you put it in the page, you are sure that all the
%        following text will be placed at the bottom of the page.

\newlength{\@line}
\setlength{\@line}{11pt}

% Inicio maketitle
\renewcommand\maketitle{
  \begingroup\doublespacing % always typeset title pages in doublespacing %
    \newpage
    \thispagestyle{empty}%
    \setcounter{page}\@ne
    \begin{center}
      \includegraphics[scale=0.5]{\@logosource}\par
      \vspace{3\@line}\textbf{\large\MakeUppercase{\@institution}}\par
      \vspace{1\@line}\textbf{\large\@faculty}\par
      \vspace{1\@line}\textsc{\large Maestr\'{i}a en Ingenier\'{i}a en Sistemas de Informaci\'{o}n}\par
      % \vspace{4\@line}\textbf{\Large Tesis de Maestr\'{i}a}\par
      \vspace{2\@line}\textbf{\Large Tesis de Maestr\'{i}a}\par
      \vspace{4\@line}\textsc{\Large``\@title''}\par
      \vspace{3\@line} \@author\par
      \vspace{3\@line} Director: \@advisortitle\ \@advisor\par
      \vspace{2pt} Co-director: \@coadvisortitle\ \@coadvisor\par % Comentar si no hay co-director
      \vspace{4\@line}\vfill\textrm{\@address. \hfill \@monthyear}
    \end{center}
  \endgroup

  %%%%%%%%%%%%%%%
  % CopyrightPage
  %%%%%%%%%%%%%%%
%  %% nano %%
%  \newpage
%  \thispagestyle{empty}%
%  \setcounter{page}\@ne
%  \vspace*{0.77\textheight}
%  \hspace*{-0.15\textwidth}
%  \begin{minipage}{1.05\textwidth}
%    \begin{flushleft}
%      \begin{singlespace}
%        \noindent\ignorespaces Rubiolo, Mariano\par
%        %\vspace{0.5\@line}
%        \quad Desarrollo de nuevos modelos y algoritmos basados en redes neuronales para tareas de minería de datos. - 1a ed. - Santa Fe de la Vera Cruz: el autor, \the\year.\par
%        \quad 188 p. ; 21x29 cm.\par
%        \vspace{1\@line} \quad ISBN 978-987-33-4640-8\par
%        \vspace{1\@line} \quad 1. Ciencias. 2. Tesis de Doctorado. I. T\'{i}tulo\par
%        %\vspace{0.5\@line}
%        \quad CDD 507\par
%        \vspace{0.5\@line}
%        \noindent\ignorespaces Fecha de catalogaci\'{o}n: 17/03/2014
%      \end{singlespace}
%    \end{flushleft}
%  \end{minipage}
%% nano %%

  %%%%%%%%%%%%%%
  % ApprovalPage
  %%%%%%%%%%%%%%
  %% nano %%
  %\begingroup\doublespacing % always typeset title pages in doublespacing %
  %\begin{titlepage}%
  %\begin{center}
  %  \vspace{4\@line}\textbf{\large\MakeUppercase{\@institution}}\par
  %  \vspace{2\@line}\textbf{\large\@faculty}\par
  %  \vspace{2\@line}\textbf{\large Comisi\'{o}n de Posgrado}\par
  %  \begin{singlespace}
  %    \vspace{3\@line}
  %    \noindent Se presenta esta Tesis en cumplimiento de los requisitos exigidos por la \@institution\ para la
  %              obtenci\'{o}n del grado acad\'{e}mico de \@grade\ en \@degree\par
  %  \end{singlespace}
  %  \vspace{5\@line}\textsc{\Large``\@title''}\par
  %  \vspace{1\@line}\textsc{por}\par
  %    \vspace{1\@line}\scshape \@typeauthor{\unskip,\par}{\unskip\par y{} }\par
  %    \vspace{3\@line} Directora \@advisortitle\ \@advisor\par
  %    %\vspace{2pt} Codirector \@coadvisortitle\ \@coadvisor\par %
  %  \begin{singlespace}
  %    \vspace{3\@line}\textsc{Jurados de Tesis}\par
  %    \vspace{2\@line}\textsc{\@firstjurytitle\ \@firstjury}\par
  %    \vspace{1.2\@line}\textsc{\@secondjurytitle\ \@secondjury}\par
  %    \vspace{1.2\@line}\textsc{\@thirdjurytitle\ \@thirdjury}\par
  %  \end{singlespace}
  %   \vfill\textrm{\@address. \hfill \@monthyear}
  %\end{center}
  %\end{titlepage}%
  %\endgroup
	%% nano %%
}
% Fin maketitle

%%%%%%%%%%%%%%%
% CopyrightPage
%%%%%%%%%%%%%%%
% \def\copyrightpage{%
% %  \begin{titlepage}
%       \newpage
%       \thispagestyle{empty}%
%       \setcounter{page}\@ne
%   Aceptada por el
% %  \hbox{ }
% %  \vfill
%   \begin{center}
% %   {\large $\copyright$} \hspace{0.25in}
%    {\large Mariela Rico} \hspace{0.25in}
%    \parbox{3in}{\makebox[3in][l]{\underline{YO} \hspace{0.125in} %\number\year
%    }
%     All Rights Reserved}
%   \end{center}
% %  \vfill
% %  \end{titlepage}
% }


%%%%%%%%%%%%%%
% ApprovalPage
%%%%%%%%%%%%%%
%% nano %%
%\def\approvalpage{
  %\begin{titlepage}
  %\doublespacing
  %\begin{center}\vspace*{6\@line}
  %Tesis Doctoral presentada por \par\vspace{1\@line}
  %\@typeauthor{\unskip,\par}{\unskip\par y{} }\par\vspace{1\@line}
  %como requisito parcial para obtener el t\'{\i}tulo de\par
  %\@grade{} en \@degree{}. \par\vfill
  %Aceptada por el \@department{}\par\vfill
  %\begin{singlespace}
  %\begin{tabular}{p{0.4\textwidth}@{\qquad\qquad}p{0.4\textwidth}}
    %\begin{center}
      %\hrulefill\par\@advisortitle\ \@advisor\par\@advisorname
    %\end{center}
  %& \begin{center}
      %\hrulefill\par\@presidenttitle\ \@president\par\@presidentname
    %\end{center} \\
    %\begin{center}
      %\hrulefill\par\@secretarytitle\ \@secretary\par\@secretaryname
    %\end{center}
  %& \begin{center}
      %\hrulefill\par\@departmentheadtitle\ \@departmenthead\par\@departmentheadname
    %\end{center} \\
  %\end{tabular}\vfill
  %\@date\vfill
  %\end{singlespace}
  %\end{center}
  %\end{titlepage}
%}
%% nano %%


%thankspage
% minipage packs a paragraph into a box

\newenvironment{thankspage}{
  \begin{titlepage}
%  \begin{flushleft}
  \vspace*{0.45\textheight}
  \hspace*{0.45\textwidth}
  \begin{minipage}{0.5\textwidth}
  \begin{flushright}
  \begin{oneandahalfspace}
}{%
  \end{oneandahalfspace}
  \end{flushright}
  \end{minipage}
%  \end{flushleft}
  \end{titlepage}
}

% Con \pagestyle{empty} no aparecen números de página.
% \thispagestyle para cambiar el estilo de la página en curso.
% \thispagestyle{empty} para que la página en curso no tenga número.
% Con \pagestyle{plain} obtenemos los números de página al pie y nada en la cabecera
% \setcounter{counter}{value} \setcounter sets the value of the specified counter to that specified by the value argument.

% Los estilos que ofrecen las clases de documento estándar de LATEX son empty, plain y headings.
% Con \pagestyle{empty} hacemos que las páginas queden sin número de página ni encabezado;
% con \pagestyle{plain}, que es el estilo por defecto, obtenemos páginas numeradas, pero sin encabezado;
% con \pagestyle{headings} obtenemos páginas numeradas y con encabezado. Más específicamente,
% \pagestyle{headings} produce efectos distintos según la clase de documento y las opciones que para ella se especifiquen.
% Si queremos cambiar el estilo de una página en particular, usamos \thispagestyle{''estilo''} que toma los mismos valores que \pagestyle{}.

\renewenvironment{abstract}
  {\pagestyle{plain}
   \chapter*{\abstractname}
   \addcontentsline{toc}{chapter}{\abstractname}
   \thispagestyle{plain}}
  {\cleardoublepage}

\newenvironment{preface}
  {\pagestyle{headings}
   \chapter*{\prefacename
             \@mkboth{\MakeUppercase\prefacename}{\MakeUppercase\prefacename}}
   \addcontentsline{toc}{chapter}{\prefacename}
   \thispagestyle{plain}}
  {\cleardoublepage}


\newenvironment{acknowledgements}
  {\pagestyle{headings}
   \chapter*{\acknowledgename
             \@mkboth{\MakeUppercase\acknowledgename}{\MakeUppercase\acknowledgename}}
   \addcontentsline{toc}{chapter}{\acknowledgename}
   \thispagestyle{plain}}
  {\cleardoublepage\pagestyle{plain}}


\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \begingroup\singlespacing % always typeset table of contents pages in singlespacing %
      \chapter*{\contentsname
          \@mkboth{%
             \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
      \@starttoc{toc}%
      \if@restonecol\twocolumn\fi
    \endgroup
    }

\newcommand*\l@subsubsubsection{\@dottedtocline{4}{10em}{5em}}

\renewcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \begingroup\singlespacing % always typeset list of tables pages in singlespacing %
      \chapter*{\listtablename}%
      \addcontentsline{toc}{chapter}{\listtablename}
        \@mkboth{%
            \MakeUppercase\listtablename}%
           {\MakeUppercase\listtablename}%
      \@starttoc{lot}%
      \if@restonecol\twocolumn\fi
    \endgroup
    }


\renewcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \begingroup\singlespacing % always typeset list of figures pages in singlespacing %
      \chapter*{\listfigurename}%
      \addcontentsline{toc}{chapter}{\listfigurename}
       \@mkboth{\MakeUppercase\listfigurename}%
                {\MakeUppercase\listfigurename}%
      \@starttoc{lof}%
      \if@restonecol\twocolumn\fi
    \endgroup
    }

\renewcommand\listoffigures{%
\addtolength{\headsep}{7mm}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \begingroup\singlespacing % always typeset list of figures pages in singlespacing %
      \chapter*{\listfigurename}%
      \addcontentsline{toc}{chapter}{\listfigurename}
        \@mkboth{\MakeUppercase\listfigurename}%
                {\MakeUppercase\listfigurename}%
      \@starttoc{lof}%
      \if@restonecol\twocolumn\fi
    \endgroup
    }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% chapter headings
% \normalfont reestablece las características por defecto excepto el tamaño.
% \parindent define que la indentación de párrafos debe ser de ... espacios
% \raggedleft corresponds to the flushright environment (alineado a derecha). It does not start a new paragraph;
%             it simply changes how LaTeX formats paragraph units.
% The \ifnum command is used to compare two integers, e.g. \c@secnumdepth >\m@ne.
% \@chapapp pone la palabra Capítulo
% \thechapter es el número del capítulo
% #1 es el título que aparece en la primer hoja del capítulo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@makechapterhead#1{%
%    \vspace*{50\p@}% Deja un espacio vertical al principio de la página
    \vspace*{-30\p@}% Deja un espacio vertical al principio de la página
    \begin{singlespace}
      \parindent \z@ \raggedleft %\normalfont
      \ifnum \c@secnumdepth >\m@ne
%        \Large \bfseries \@chapapp\space \thechapter
        \raisebox{35pt}[0pt][0pt]{\large \bfseries \emph{\@chapapp} \space} \fontsize{72pt}{90pt}\bfseries \thechapter
        \par\nobreak
        \vskip 60\p@
      \fi
      \interlinepenalty\@M
      \begin{flushleft}
      \LARGE \bfseries \scshape #1\par\nobreak
      \end{flushleft}
      \vskip 30\p@
    \end{singlespace}
  }
\def\@makeschapterhead#1{%
    \vspace*{50\p@}%
    \begin{singlespace}
      \parindent \z@ \raggedright
      \normalfont
      \interlinepenalty\@M
      \Huge \bfseries  #1\par\nobreak
      \vskip 40\p@
    \end{singlespace}
  }


%\def\@makechapterhead#1{%
%    \vspace*{50\p@}%
%    \begin{singlespace}
%      \parindent \z@ \raggedright \normalfont
%      \ifnum \c@secnumdepth >\m@ne
%        \Large \bfseries \@chapapp\space \thechapter
%        \par\nobreak
%        \vskip 20\p@
%      \fi
%      \interlinepenalty\@M
%      \Large \bfseries #1\par\nobreak
%      \vskip 40\p@
%    \end{singlespace}
%  }
%\def\@makeschapterhead#1{%
%    \vspace*{50\p@}%
%    \begin{singlespace}
%      \parindent \z@ \raggedright
%      \normalfont
%      \interlinepenalty\@M
%      \Large \bfseries  #1\par\nobreak
%      \vskip 40\p@
%    \end{singlespace}
%  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modifiqué la línea de los capítulos en el índice
% Agregué la palabra Capítulo con \@chapapp
% Agregué un nuevo parámetro a la función [#3]. Ese es el título del capítulo que aparece en el índice.
% El [#1] es el título del capítulo que aparece en el encabezado de las páginas pares
% #2 es el título del capítulo que aparece en la primera página del capítulo
% \chaptermark{#1} to change the look of the chapter name in the header line "renew" the \chaptermark command
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@chapter[#1]#2[#3]{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\@chapapp\space\thechapter}#3}%
%                                   {\protect\numberline{\thechapter}#1}%
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modifiqué la indentación del título del capítulo en el índice para que no se superpusiera a Capítulo #.
% \parindent define que la indentación de párrafos debe ser de ... espacios
% \hskip  agregar un espacio horizontal de una longitud fija o variable
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
%    \setlength\@tempdima{1.5em}%
    \setlength\@tempdima{6.3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}


\renewcommand{\part}{\ClassError{utnfrrotesis}{Invalid command \string\part}%
  {The \string\part\space command is not available in utnfrrotesis class}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% page styles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\ps@empty{%
  \def\@oddfoot{\if@isdraft\draftmodeleyend\hfill\draftleyend\fi}
  \def\@evenfoot{\if@isdraft\draftmodeleyend\hfill\draftleyend\fi}
  \def\@oddhead{\if@isdraft\hfill\draftmodeleyend\hfill\fi}
  \def\@evenhead{\if@isdraft\hfill\draftmodeleyend\hfill\fi}
}

\def\ps@blankpage{%
  \def\@oddfoot{\if@isdraft\hfill\blankpageleyend\hfill\fi}
  \def\@evenfoot{\if@isdraft\hfill\blankpageleyend\hfill\fi}
  \def\@oddhead{\if@isdraft\hfill\draftmodeleyend\hfill\fi}
  \def\@evenhead{\if@isdraft\hfill\draftmodeleyend\hfill\fi}
}

\def\ps@plain{%
  \def\@oddfoot{\hfill\thepage\hfill}
  \def\@evenfoot{\hfill\thepage\hfill}
  \def\@oddhead{\if@isdraft\hfill\draftmodeleyend\hfill\fi}
  \def\@evenhead{\if@isdraft\hfill\draftmodeleyend\hfill\fi}
}

% \markboth{cabecera izquierda}{cabecera derecha}
% \markright{cabecera derecha}

% the commands \rightmark and \leftmark represent the current section and chapter heading, respectively.

% \thepage Escribe el número de página
% \hfil The text is aligned left (\hfil on the right). \hfil is a spacer with zero default width but infinite stretchability.
% el comando \slshape produce letras inclinadas
% \makebox[width][pos]{text} a class of boxing commands that operates only on horizontally aligned material.
%    [width] defines the width of the resulting box as seen from the outside. This means it can be smaller than
%    the material inside the box. You can even set the width to 0pt so that the text inside the box will be typeset
%    without influencing the surrounding boxes.
%    [pos] parameter takes a one letter value: l - flushleft, r - flushright, or s - spread the text to fill the box.
%    The default horizontal and vertical positioning (if the second optional argument is omitted) is to center text in the box.
% \footnotesize Font Size. quite small font.
% \rule[lift]{width}{height} allows to draw thin lines or rules. A zero width/height rule is called a strut for invisible place holders

\if@twoside
    \def\ps@headings{%
        \def\@oddfoot{\if@isdraft\draftmodeleyend\hfill\draftleyend\fi}
        \def\@evenfoot{\if@isdraft\draftmodeleyend\hfill\draftleyend\fi}
%        \def\@evenhead{\thepage\hfil\slshape\leftmark}%
%       cabecera par
        \def\@evenhead{\underline{\makebox[\textwidth][s]{\rule[-0.5ex]{0pt}{0.5ex}\thepage\hfil\slshape\leftmark}}}%
%        \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
        \def\@oddhead{\underline{\makebox[\textwidth][s]{\rule[-0.5ex]{0pt}{0.5ex}{\slshape\rightmark}\hfil\thepage}}}%
        \let\@mkboth\markboth
      \def\chaptermark##1{%
%        \markboth {\textbf{%
        \markboth {%
          \ifnum \c@secnumdepth >\m@ne
              \@chapapp\ \thechapter. \ %
          \fi
          ##1}{}}%
%          ##1}}{}}%
      \def\sectionmark##1{%
%        \markright {\textbf{%
        \markright {%
          \ifnum \c@secnumdepth >\z@
            \thesection. \ %
          \fi
          ##1}}}
%          ##1}}}}
\else
    \def\ps@headings{%
      \def\@oddfoot{\if@isdraft\draftmodeleyend\hfill\draftleyend\fi}
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
      \def\chaptermark##1{%
        \markright {\textbf{%
          \ifnum \c@secnumdepth >\m@ne
              \@chapapp\ \thechapter. \ %
          \fi
          ##1}}}}
\fi

\let\@oldcleardoublepage=\cleardoublepage
\renewcommand\cleardoublepage{
  \clearpage
  \thispagestyle{blankpage}
  \if@openright
    \@oldcleardoublepage
  \else
    \clearpage
  \fi
}

\pagestyle{headings}

% title page environment %
\renewenvironment{titlepage}{%
      % \newpage
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    { \cleardoublepage
      \setcounter{page}\@ne
    }

% VERSE, QUOTATION, and QUOTE must be single-spaced. %
\let\@oldverse=\verse
\let\@oldquotation=\quotation
\let\@oldquote=\quote
\let\end@oldverse=\endverse
\let\end@oldquotation=\endquotation
\let\end@olquote=\endquote

\renewenvironment*{verse}{\begin{@oldverse}\begin{singlespace}}
    {\end{singlespace}\end{@oldverse}}

\renewenvironment*{quotation}{\begin{@oldquotation} \begin{singlespace}}
    {\end{singlespace}\end{@oldquotation}}

\renewenvironment*{quote}{\begin{@oldquote} \begin{singlespace}}
    {\end{singlespace} \end{@oldquote}}


\let\@oldthebibliography=\thebibliography
\let\end@oldthebibliography=\endthebibliogrphy

\renewenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
      \begingroup\singlespacing % always typeset list of figures pages in singlespacing %
%        \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
        \@mkboth{\bibname}{\bibname}%
        \list{\@biblabel{\@arabic\c@enumiv}}%
             {\settowidth\labelwidth{\@biblabel{#1}}%
              \leftmargin\labelwidth
              \advance\leftmargin\labelsep
              \@openbib@code
              \usecounter{enumiv}%
              \let\p@enumiv\@empty
              \renewcommand\theenumiv{\@arabic\c@enumiv}}%
        \sloppy
        \clubpenalty4000
        \@clubpenalty \clubpenalty
        \widowpenalty4000%
        \sfcode`\.\@m
      \endgroup
     }



% some corrections of spanish leyends given by babel %
\AtBeginDocument{
  \renewcommand\contentsname{\'Indice General}
  \renewcommand\listtablename{\'Indice de Tablas}
  \renewcommand\listfigurename{\'Indice de Figuras}
  \renewcommand\tablename{Tabla}
  \renewcommand\abstractname{Resumen}
  \renewcommand\prefacename{Pr\'ologo}
  \newcommand\acknowledgename{Agradecimientos}
  \renewcommand\appendixname{Ap\'{e}ndice}
  \if@isdraft\setlength\overfullrule{5pt}\fi
}

% \renewcommand{cmd}[args][opt]{def}

% Crea el ambiente Definición
\newtheorem{definicion}{Definici\'{o}n}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Graphics and colors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\if@graphicx
	\RequirePackage{graphicx}
\fi

\if@colors
	\RequirePackage{xcolor}
	\definecolor{dark-red}{rgb}{0.4,0.15,0.15}
	\definecolor{dark-blue}{rgb}{0.15,0.15,0.4}
	\definecolor{medium-blue}{rgb}{0,0,0.5}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Definir colores
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{gray97}{gray}{.97}
\definecolor{gray75}{gray}{.75}
\definecolor{gray45}{gray}{.45}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Realizar recuadro alrededor de un párrafo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newsavebox{\riddlebox}
\newenvironment{recuadrar}[2]
{\newcommand\colboxcolor{#1}%
\begin{lrbox}{\riddlebox}%
\begin{minipage}{\dimexpr\columnwidth-2\fboxsep\relax} \textbf{#2}\\ \itshape }
{\end{minipage}\end{lrbox}%
\begin{center}
  \colorbox[HTML]{\colboxcolor}{\usebox{\riddlebox}}
\end{center}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define los tipos de item a usarse
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\labelitemi{\textbullet}
\renewcommand\labelitemii{\normalfont\bfseries \textendash}
\renewcommand\labelitemiii{\textasteriskcentered}
\renewcommand\labelitemiv{\textperiodcentered}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Linking and pdf options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\let\phantomsection\@empty
\def\hyperlinking{%
	\providecommand\theHalgorithm{\thealgorithm}
	\providecommand\theHdefinition{\thedefinition}
	\providecommand\theHexample{\theexample}
	\providecommand\theHlemma{\thelemma}
	\providecommand\theHproposition{\theproposition}
	\providecommand\theHcorollary{\thecorollary}

	\RequirePackage[final,breaklinks,bookmarks]{hyperref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% properties of pdf file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	\hypersetup{%
		pdftitle={\inserttitle},pdfauthor={\insertauthor},
		pdfsubject={\insertdegree\ Thesis, \insertfaculty}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% color links
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	\if@colors
		\hypersetup{%
			colorlinks,linkcolor={dark-red},citecolor={dark-blue},
			urlcolor={medium-blue}}
	\fi

	\renewcommand{\chapterautorefname}{Chapter}
	\renewcommand{\sectionautorefname}{Section}
	\renewcommand{\subsectionautorefname}{Section}
	\renewcommand{\subsubsectionautorefname}{Section}
	\RequirePackage[all]{hypcap}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% chapter heading format
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{titlesec}
\titleformat{\chapter}[display]
    {\normalfont\Large\raggedleft}
    {\MakeUppercase{\chaptertitlename}%
    \rlap{ \resizebox{!}{1.2cm}{\thechapter} \rule{15cm}{1.2cm} } }
    {10pt}{\Huge}
\titlespacing*{\chapter}{0pt}{30pt}{20pt}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Insertar una línea después del título del párrafo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  {\normalfont\normalsize\bfseries}}

\endinput
%%
%% End of file `utnfrrotesis.cls'.
