%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LaTeX CV Template Class File
% 
% This class provides a clean, professional CV template with modular sections
% and customisable styling. It includes predefined commands for common CV
% elements like education, experience, projects, skills, and more.
%
% Author: Your Name (based on various CV templates)
% Licence: CC BY-NC 4.0 (Non-Commercial Creative Commons)
% Version: 1.0
% Date: 2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\lxdef{\long\xdef}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DOCUMENT CLASS SETUP
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{curriculumvitae}[2024/11/02 v1.0 Professional CV Template]

% Document Class Options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper,11pt]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PACKAGE IMPORTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Core packages for layout, fonts, and formatting
\RequirePackage{latexsym, xcolor, float, ragged2e, fullpage, wrapfig, lipsum, tabularx, titlesec, geometry, marvosym, verbatim, enumitem, fancyhdr, multicol, graphicx, cfr-lm}
\RequirePackage[T1]{fontenc}
\RequirePackage{fontawesome5}
\RequirePackage[most]{tcolorbox}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{ifthen}  % For conditional logic in redaction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% REDACTION SYSTEM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Load redaction configuration (if it exists)
\IfFileExists{preamble/redaction-config.tex}{
    \input{preamble/redaction-config.tex}
}{
    % Default values if redaction config doesn't exist
    \newcommand{\redactphone}{false}
    \newcommand{\redactemail}{false}
    \newcommand{\redactwebsite}{false}
    \newcommand{\redactlinkedin}{false}
    \newcommand{\redactgithub}{false}
    \newcommand{\redactleetcode}{false}
    \newcommand{\redactfulladdress}{false}
    \newcommand{\redactworklocations}{false}
    \newcommand{\redacteducationlocations}{false}
    \newcommand{\redactcompanies}{false}
    \newcommand{\redactuniversities}{false}
    \newcommand{\redactcompanyurls}{false}
    \newcommand{\redactprojecturls}{false}
    \newcommand{\redactiontext}{[REDACTED]}
    \newcommand{\redactioncontacttext}{[CONTACT REDACTED]}
    \newcommand{\redactionlocationtext}{[LOCATION REDACTED]}
}

% Simple redaction command
\newcommand{\mayredact}[2]{%
    \ifthenelse{\equal{#1}{true}}{#2}%
}

% Convenience commands
\newcommand{\mayredactcontact}[2]{%
    \ifthenelse{\equal{#1}{true}}{\redactioncontacttext}{#2}%
}

\newcommand{\mayredactlocation}[2]{%
    \ifthenelse{\equal{#1}{true}}{\redactionlocationtext}{#2}%
}

\newcommand{\mayredacttext}[2]{%
    \ifthenelse{\equal{#1}{true}}{\redactiontext}{#2}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PERSONAL DETAILS COMMANDS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define commands for personal information
% Users can set these values in their preamble/personal-details.tex file

% Basic contact information
\lxdef \@name {}
\newcommand{\name}[1]{\xdef\@name{#1}}

\lxdef \@phone {}
\newcommand{\phone}[1]{\xdef\@phone{#1}}

\lxdef \@email {}
\newcommand{\email}[1]{\xdef\@email{#1}}

\lxdef \@website {}
\newcommand{\website}[1]{\xdef\@website{#1}}

% Social media profiles
\lxdef \@linkedin {}
\newcommand{\linkedin}[1]{\xdef\@linkedin{#1}}

\lxdef \@github {}
\newcommand{\github}[1]{\xdef\@github{#1}}

\lxdef \@leetcode {}
\newcommand{\leetcode}[1]{\xdef\@leetcode{#1}}

% Location information
\lxdef \@city {}
\newcommand{\city}[1]{\xdef\@city{#1}}

\lxdef \@county {}
\newcommand{\county}[1]{\xdef\@county{#1}}

\lxdef \@country {}
\newcommand{\country}[1]{\xdef\@country{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLOUR DEFINITIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Primary colours used throughout the CV
% You can customise these colours to match your personal branding
\definecolor{basecolor}{RGB}{0, 0, 0}        % Black for main text
\definecolor{accentcolor}{RGB}{72, 0, 128}   % Purple for accents, highlights, and section headers

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PAGE LAYOUT AND FORMATTING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Multi-column spacing
\setlength{\multicolsep}{0pt} 

% Header and footer settings
\pagestyle{fancy}
\fancyhf{} % clear all header and footer fields
\fancyfoot{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Page margins and geometry
\geometry{left=1.4cm, top=0.8cm, right=1.2cm, bottom=1cm}
\setlength{\footskip}{5pt} % Addressing fancyhdr warning

% Hyperlink setup (moved after fancyhdr to address warning)
\hypersetup{
    colorlinks=true,
    linkcolor=basecolor,
    filecolor=basecolor,
    urlcolor=basecolor,
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CUSTOM BOX SETTINGS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Settings for coloured boxes used in section headers (keeping for other uses)
\usepackage[most]{tcolorbox}
\tcbset{
    frame code={},
    center title,
    left=0pt,
    right=0pt,
    top=0pt,
    bottom=0pt,
    colback=gray!20,
    colframe=white,
    width=\dimexpr\textwidth\relax,
    enlarge left by=-2mm,
    boxsep=4pt,
    arc=0pt,outer arc=0pt,
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PAGE BREAK HANDLING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Prevent widows and orphans
\widowpenalty=9999
\clubpenalty=9999

% Allow some flexibility in page breaks
\raggedbottom

% Discourage page breaks immediately after section headers
\newcommand{\sectionbreak}{%
    \penalty-100%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TEXT FORMATTING AND ALIGNMENT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% URL style
\urlstyle{same}

% Text alignment
\raggedright
\setlength{\tabcolsep}{0in}

% Section formatting
\titleformat{\section}{
  \vspace{-4pt}\scshape\raggedright\large
}{}{0em}{}[\color{black}\titlerule \vspace{-7pt}]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CUSTOM STYLING COMMANDS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Commands for consistent styling throughout the CV
\newcommand{\keywordstyle}[1]{\textbf{\textcolor{accentcolor}{#1}}}
\newcommand{\linkstyle}[1]{\textcolor{accentcolor}{\textmd{\underline{#1}}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BASIC CV ITEM COMMANDS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Basic resume item command
\newcommand{\resumeItem}[2]{
  {
    \textbf{#1}{\hspace{0.5mm}#2\vspace{0.5mm}}\\
  }
}

% Command for positions of responsibility
\newcommand{\resumePOR}[3]{
\vspace{0.5mm}
    \begin{tabular*}{0.97\textwidth}[t]{l@{\extracolsep{\fill}}r}
        \textbf{#1}\hspace{0.5mm}#2 & \textit{\small{#3}} 
    \end{tabular*}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SECTION ENTRY COMMANDS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Standard subheading for job positions and education
\newcommand{\resumeSubheading}[4]{
\vspace{0.5mm}
    \begin{tabular*}{0.98\textwidth}[t]{l@{\extracolsep{\fill}}r}
        \textbf{#1} & \textit{\footnotesize{#4}} \\
        \textit{\footnotesize{#3}} &  \footnotesize{#2}\\
    \end{tabular*}
    \vspace{-2.4mm}
}

% Project entry formatting
\newcommand{\resumeProject}[4]{
\vspace{0.5mm}
    \begin{tabular*}{0.98\textwidth}[t]{l@{\extracolsep{\fill}}r}
        \textbf{#1} & \textit{\footnotesize{#3}} \\
        \footnotesize{\textit{#2}} & \footnotesize{#4}
    \end{tabular*}
    \vspace{-2.4mm}
}

% Sub-item command
\newcommand{\resumeSubItem}[2]{
  \item{
    \textbf{#1}{\hspace{0.5mm}#2\vspace{0.5mm}}
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LIST FORMATTING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Custom bullet points
\renewcommand{\labelitemi}{$\vcenter{\hbox{\tiny$\bullet$}}$}
\renewcommand{\labelitemii}{$\vcenter{\hbox{\tiny$\circ$}}$}

% List environment commands
\newcommand{\resumeSubHeadingListStart}{\begin{itemize}[leftmargin=*,labelsep=1mm]}
\newcommand{\resumeHeadingSkillStart}{\begin{itemize}[leftmargin=*,itemsep=0.8mm, rightmargin=2ex]}
\newcommand{\resumeItemListStart}{\begin{itemize}[leftmargin=*,labelsep=1mm,itemsep=0.5mm]}

\newcommand{\resumeSubHeadingListEnd}{\end{itemize}\vspace{2mm}}
\newcommand{\resumeHeadingSkillEnd}{\end{itemize}\vspace{-2mm}}
\newcommand{\resumeItemListEnd}{\end{itemize}\vspace{-2mm}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SECTION HEADER COMMAND
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Command to create section headers with coloured background
% Use this for highlighting special information blocks, not for main CV sections
% For main sections, use: \section{\keywordstyle{Section Name}}
\newcommand{\cvsection}[1]{%
\sectionbreak%
\vspace{2mm}
\begin{tcolorbox}
    \textbf{\large #1}
\end{tcolorbox}
    \vspace{-4mm}
}

% Column type definitions for tables
\newcolumntype{L}{>{\raggedright\arraybackslash}X}%
\newcolumntype{R}{>{\raggedleft\arraybackslash}X}%
\newcolumntype{C}{>{\centering\arraybackslash}X}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ICON AND FONT COMMANDS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Commands for icon sizing and positioning
\newcommand{\socialicon}[1]{\raisebox{-0.05em}{\resizebox{!}{1em}{#1}}}
\newcommand{\ieeeicon}[1]{\raisebox{-0.3em}{\resizebox{!}{1.3em}{#1}}}

% Social media icon with link
\newcommand{\socialiconlink}[3]{%
    \href{#2}{\textcolor{accentcolor} {\faIcon{#1}\makebox[0pt]{\phantom{#3: #2}}}}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FONT OPTIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Various font families available for the header
% Users can change the \headerfontx command in the header to use different fonts
\newcommand{\headerfonti}{\fontfamily{phv}\selectfont}   % Helvetica-like (similar to Arial/Calibri)
\newcommand{\headerfontii}{\fontfamily{ptm}\selectfont}  % Times-like (similar to Times New Roman)
\newcommand{\headerfontiii}{\fontfamily{ppl}\selectfont} % Palatino (elegant serif)
\newcommand{\headerfontiv}{\fontfamily{pbk}\selectfont}  % Bookman (readable serif)
\newcommand{\headerfontv}{\fontfamily{pag}\selectfont}   % Avant Garde-like (similar to Trebuchet MS)
\newcommand{\headerfontvi}{\fontfamily{cmss}\selectfont} % Computer Modern Sans Serif
\newcommand{\headerfontvii}{\fontfamily{qhv}\selectfont} % Quasi-Helvetica (another Arial/Calibri alternative)
\newcommand{\headerfontviii}{\fontfamily{qpl}\selectfont}% Quasi-Palatino (another elegant serif option)
\newcommand{\headerfontix}{\fontfamily{qtm}\selectfont}  % Quasi-Times (another Times New Roman alternative)
\newcommand{\headerfontx}{\fontfamily{bch}\selectfont}   % Charter (clean serif font)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HEADER SECTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Main header command that creates the CV header with name and contact info
\newcommand{\makeheader}{
    % Select font for header (change \headerfontx to use different font)
    \headerfontx

    % Name section
    \begin{center}
        {\Huge{\keywordstyle{\@name}}}
    \end{center}
    \vspace{-6mm}

    % Contact details (conditionally include each if defined)
    \begin{center}
        \small{
        % Build contact line with proper pipe separation
        \ifx\@phone\empty\else \mayredactcontact{\redactphone}{\@phone} \fi
        % Add pipe before email if phone exists and email exists
        \ifx\@phone\empty\else \ifx\@email\empty\else \enspace | \fi \fi
        \ifx\@email\empty\else \mayredactcontact{\redactemail}{\href{mailto:\@email}{\linkstyle{\@email}}} \fi
        % Add pipe before website if (phone OR email exists) AND website exists
        \ifx\@website\empty\else 
            \ifx\@phone\empty 
                \ifx\@email\empty \else \enspace | \fi 
            \else 
                \enspace | 
            \fi
            \mayredactcontact{\redactwebsite}{\href{https://www.\@website}{\linkstyle{\@website}}}
        \fi
        }
    \end{center}
    \vspace{-6mm}

    % Social links (conditionally include each if defined)
    \begin{center}
        \small{
        % Build social links line with proper pipe separation
        \ifx\@linkedin\empty\else
            \mayredactcontact{\redactlinkedin}{\href{https://www.\@linkedin}{\linkstyle{\@linkedin}}}
        \fi
        % Add pipe before github if linkedin exists and github exists
        \ifx\@linkedin\empty\else \ifx\@github\empty\else \enspace | \fi \fi
        \ifx\@github\empty\else
            \mayredactcontact{\redactgithub}{\href{https://www.\@github}{\linkstyle{\@github}}}
        \fi
        % Add pipe before leetcode if (linkedin OR github exists) AND leetcode exists
        \ifx\@leetcode\empty\else
            \ifx\@linkedin\empty 
                \ifx\@github\empty \else \enspace | \fi 
            \else 
                \enspace | 
            \fi
            \mayredactcontact{\redactleetcode}{\href{https://www.\@leetcode}{\linkstyle{\@leetcode}}}
        \fi
        }
    \end{center}
    \vspace{-6mm}

        % Location information (only include if at least one field is present)
    \ifx\@city\empty \ifx\@county\empty \ifx\@country\empty
    \else
        \begin{center}
            \small{
            \mayredactlocation{\redactfulladdress}{%
                \ifx\@city\empty
                    \ifx\@county\empty
                        \@country
                    \else
                        \ifx\@country\empty
                            \@county
                        \else
                            \@county, \@country
                        \fi
                    \fi
                \else
                    \ifx\@county\empty
                        \ifx\@country\empty
                            \@city
                        \else
                            \@city, \@country
                        \fi
                    \else
                        \ifx\@country\empty
                            \@city, \@county
                        \else
                            \@city, \@county, \@country
                        \fi
                    \fi
                \fi
            }
            }
        \end{center}
        \vspace{-4mm}
    \fi \fi \fi
}

% Professional Summary
\newcommand{\makesummary}[1]{
    \section{\keywordstyle{Professional Summary}}
    \vspace{1mm}
    \small{
        #1
    }
    \vspace{-2mm}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EXPERIENCE SECTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Experience section wrapper (deprecated - use \section{\keywordstyle{Experience}} directly)
\newcommand{\makeexperience}[1]{
    \section{\keywordstyle{Experience}}
    \vspace{-0.4mm}
    #1
    \vspace{-2mm}
}

% Job entry command
% Parameters: {Company Name}{Company Website URL}{Location}{Job Title}{Start Date}{End Date}{Bullet points}
\newcommand{\job}[7]{
    \resumeSubheading
        {\ifthenelse{\equal{\redactcompanyurls}{true}}{%
            \mayredacttext{\redactcompanies}{#1}%
        }{%
            \ifthenelse{\equal{\redactcompanies}{true}}{%
                \redactiontext%
            }{%
                \href{#2}{#1}%
            }%
        }}{\mayredactlocation{\redactworklocations}{#3}}
        {#4}{#5 -- #6}
        \vspace{1mm}
        \ifx&#7&
        \else
            \resumeItemListStart
                #7
            \resumeItemListEnd
        \fi
    \vspace{1mm}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EDUCATION SECTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Education section wrapper (deprecated - use \section{\keywordstyle{Education}} directly)
\newcommand{\makeeducation}[1]{
    \section{\keywordstyle{Education}}
    \vspace{-0.4mm}
    #1
    \vspace{-2mm}
}

% Detailed degree entry with activities and modules
% Parameters: {Institution}{Location}{Degree Title}{Start Year}{End Year}{Graduation Year}{Grade}{Activities}{Modules}
\newcommand{\longdegree}[9]{
    \resumeSubheading
        {\mayredacttext{\redactuniversities}{#1}}{\mayredactlocation{\redacteducationlocations}{#2}}
        {#3}{#4 -- #5 \ifx&#6&\else (Grad. #6) \fi}
        \resumeItemListStart
            \item \textbf{Grade:} #7
            \ifx&#8&\else \item \textbf{Activities \& Societies:} #8 \fi
            \ifx&#9&\else \item \textbf{Relevant Modules:} #9 \fi
        \resumeItemListEnd
}

% Simple degree entry
% Parameters: {Institution}{Degree}{Grade}{Year}{Key Modules}
\newcommand{\shortdegree}[5]{
\vspace{0.5mm}
    \begin{tabular*}{0.98\textwidth}[t]{l@{\extracolsep{\fill}}r}
        \textbf{\mayredacttext{\redactuniversities}{#1}} -- \textbf{#2}: #3 & \textit{\footnotesize{#4}} \\
        \ifx&#5&\vspace{-0.45cm}\else \textit{\footnotesize{Key Modules: #5}}\fi
    \end{tabular*}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PROJECTS SECTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Projects section wrapper (deprecated - use \section{\keywordstyle{Projects}} directly)
\newcommand{\makeprojects}[1]{
    \section{\keywordstyle{Projects}}
    \vspace{-0.4mm}
    #1
    \vspace{-2mm}
}

% Project entry command
% Parameters: {Project Name}{Description}{Start Date}{End Date}{GitHub URL}{Live Demo URL}{Bullet points}
\newcommand{\project}[7]{
    \resumeProject
        {{#1\ifx&#5&\else{ [\ifthenelse{\equal{\redactprojecturls}{true}}{\redactiontext}{\href{#5}{\linkstyle{GitHub}}}]}\fi\ifx&#6&\else{ [\ifthenelse{\equal{\redactprojecturls}{true}}{\redactiontext}{\href{#6}{\linkstyle{Live Demo}}}]}\fi}}
        {\ifx&#2&\vspace{-0.35cm}\else#2\fi}
        {#3 -- #4}{}
        \vspace{0.5mm}
        \ifx&#7&
        \else
            \resumeItemListStart
                #7
            \resumeItemListEnd
        \fi
    \vspace{1mm}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SKILLS SECTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Skills section wrapper (deprecated - use \section{\keywordstyle{Skills}} directly)
\newcommand{\makeskills}[1]{
    \section{\keywordstyle{Skills}}
    \vspace{0.4mm}
    #1
    \vspace{-2mm}
}

% Skill group entry
% Parameters: {Category}{Skills list}
\newcommand{\skillgroup}[2]{
    \resumeItem{#1: }{#2}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CERTIFICATIONS SECTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Certifications section wrapper (deprecated - use \section{\keywordstyle{Courses \& Certifications}} directly)
\newcommand{\makecertifications}[1]{
    \section{\keywordstyle{Courses \& Certifications}}
    \vspace{-0.4mm}
    #1
    \vspace{-2mm}
}

% Simple course entry
% Parameters: {Course Name}{Provider}{Provider URL}{Start Date}{End Date}
\newcommand{\course}[5]{
    \vspace{0.5mm}
    \begin{tabular*}{0.98\textwidth}[t]{l@{\extracolsep{\fill}}r}
        \textbf{#1} -- {{\href{#3}{#2}}} & \textit{\footnotesize{\ifx&#5&#4\else #4 -- #5\fi}}
    \end{tabular*}
}

% Detailed certificate entry with content description
% Parameters: {Certificate Name}{Issuer}{Issuer URL}{Issue Date}{Expiry Date}{Content Description}
\newcommand{\certificate}[6]{
    \vspace{0.5mm}
    \begin{tabular*}{0.98\textwidth}[t]{l@{\extracolsep{\fill}}r}
        \textbf{#1} -- {{\href{#3}{#2}}} & \textit{\footnotesize{\ifx&#5&#4\else #4 -- #5\fi}}
    \end{tabular*}
    \ifx&#6&\else \textit{\footnotesize{Content: #6}}\fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AWARDS SECTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Awards section wrapper (deprecated - use \section{\keywordstyle{Awards}} directly)
\newcommand{\makeawards}[1]{
    \section{\keywordstyle{Awards}}
    \vspace{-0.4mm}

    
    #1


    \vspace{-2mm}
}

% Award entry command
% Parameters: {Award Name}{Issuing Organisation}{Organisation URL}{Date Received}{End Date}
\newcommand{\award}[5]{
    \vspace{0.5mm}
    \begin{tabular*}{0.98\textwidth}[t]{l@{\extracolsep{\fill}}r}
        \textbf{#1} -- {{\href{#3}{#2}}} & \textit{\footnotesize{\ifx&#5&#4\else #4 -- #5\fi}}
    \end{tabular*}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VOLUNTEER POSITIONS SECTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Volunteer positions section wrapper (deprecated - use \section{\keywordstyle{Volunteer Positions}} directly)
\newcommand{\makevolunteerpositions}[1]{
    \section{\keywordstyle{Volunteer Positions}}
    \vspace{-0.4mm}


    #1


    \vspace{-2mm}
}

% Detailed volunteer position entry
% Parameters: {Organisation}{Website URL}{Location}{Position Title}{Start Date}{End Date}{Bullet points}
\newcommand{\longposition}[7]{
    \resumeSubheading
        {\href{#2}{#1}}{#3}
        {#4}{#5 -- #6}
        \ifx&#7&
        \else
            \resumeItemListStart
                #7
            \resumeItemListEnd
        \fi
}

% Simple volunteer position entry
% Parameters: {Organisation}{Website URL}{Position Title}{Start Date}{End Date}
\newcommand{\shortposition}[5]{
\vspace{0.5mm}\item
    \begin{tabular*}{0.98\textwidth}[t]{l@{\extracolsep{\fill}}r}
        \textbf{\href{#2}{#1}} -- #3 & \textit{\footnotesize{#4 -- #5}}
    \end{tabular*}
    \vspace{-2.4mm}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ADDITIONAL INFORMATION SECTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Additional information section wrapper (deprecated - use \section{\keywordstyle{Additional Information}} directly)
\newcommand{\makeadditionalinfo}[1]{
    \section{\keywordstyle{Additional Information}}
    \vspace{0.4mm}
    #1
    \vspace{-2mm}
}

% Information group entry (for miscellaneous information)
% Parameters: {Category}{Information}
\newcommand{\infogroup}[2]{
    \resumeItem{#1: }{#2}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% REFERENCES SECTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% References section wrapper (deprecated - use \section{\keywordstyle{References}} directly)
\newcommand{\makereferences}[1]{
    \section{\keywordstyle{References}}
    \vspace{-0.2mm}
    \small{
        \raggedcolumns
        \begin{multicols}{2}
        \begin{enumerate}[leftmargin=*,labelsep=2mm]
        #1
        \end{enumerate}
        \end{multicols}
    }
    \vspace{-4mm}
}

% Reference entry command
% Parameters: {Name}{Job Title}{Company/Organisation}{Email}{Relationship}
\newcommand{\reference}[5]{
    \item \nopagebreak\textbf{#1}\nopagebreak\\
        \nopagebreak#2\nopagebreak\\
        \nopagebreak#3\nopagebreak\\
        \nopagebreak Email: #4\nopagebreak\\
        \nopagebreak\textit{Relationship: #5}\nopagebreak
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF CLASS FILE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\endinput