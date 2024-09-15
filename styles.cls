%% LaTeX class for typesetting books
%%
%% Copyright (C) 2024 by Yurii Oksamytnyi <yurii.oksamytnyi@yuriodev.co.uk>
%%
%% This class is designed for producing high-quality books with the following features:
%%   - Customizable font and page layout options (supports Montserrat, MathPazo, etc.)
%%   - Support for various theorem environments with color-coded boxes
%%   - Code snippet inclusion with syntax highlighting
%%   - Predefined styles for titles, sections, headers, and footers
%%
%% Key Features:
%%   - Proposition, Corollary, Lemma, Theorem, Exercise environments with distinct color schemes
%%   - Custom title page and table of contents formatting
%%   - Fancy header and footer customization
%%
%% Usage Example:
%% \documentclass[10pt,wide]{styles}
%% \begin{document}
%% \defaulttitlepage
%% \contenttable
%% \include{chapters/chapter01}
%% \end{document}
%%
%% For detailed documentation, please refer to the full guide.
%%

%===============================================================================
% 1. Introduction and Class Declaration
%===============================================================================

\NeedsTeXFormat{LaTeX2e}[2009/09/24]       % Require LaTeX2e format from 2009/09/24 or later
\ProvidesClass{styles}[2024/09/11 v1.0]    % Provide class information: name and version

%===============================================================================
% 2. Class Options
%===============================================================================

%% This section defines options that users can pass to the class when loading it
%% in their document. These options allow for customization of font sizes, page
%% layouts, and other settings, providing flexibility in how the final document appears.


%-------------------------------------------------------------------------------
% 2.1 Font Size Options
%-------------------------------------------------------------------------------

%% The class provides options to set the base font size of the document.
%% Available sizes are 10pt, 11pt, and 12pt, with 10pt being the default.

% Font size options: 10pt, 11pt, 12pt
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{book}}   % Pass 10pt option to the base 'book' class
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{book}}   % Pass 11pt option to the base 'book' class
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{book}}   % Pass 12pt option to the base 'book' class

%-------------------------------------------------------------------------------
% 2.2 Page Layout Options
%-------------------------------------------------------------------------------

%% Users can choose from predefined page layouts: wide, compact, a4, a5.
%% Each option adjusts the page dimensions and margins using the geometry package.

% 'wide' option: wider page layout suitable for larger documents
\DeclareOption{wide}{                            % Declare the 'wide' option
  \PassOptionsToPackage{                         % Pass the following options to a package
    paperwidth=195mm,                            % Set paper width to 195mm
    paperheight=265mm,                           % Set paper height to 265mm
    twoside=false,                               % Disable two-sided layout
    inner=2.2cm,                                 % Set inner margin to 2.2cm
    outer=2.5cm,                                 % Set outer margin to 2.5cm
    top=2.25cm,                                  % Set top margin to 2.25cm
    bottom=2.25cm                                % Set bottom margin to 2.25cm
  }{geometry}                                    % Specify that options are for the 'geometry' package
}

% 'compact' option: smaller page layout for compact presentation
\DeclareOption{compact}{                         % Declare the 'compact' option
  \PassOptionsToPackage{                         % Pass the following options to a package
    paperwidth=160mm,                            % Set paper width to 160mm
    paperheight=240mm,                           % Set paper height to 240mm
    twoside=false,                               % Disable two-sided layout
    inner=1.75cm,                                % Set inner margin to 1.75cm
    outer=1.75cm,                                % Set outer margin to 1.75cm
    top=2.25cm,                                  % Set top margin to 2.25cm
    bottom=2cm                                   % Set bottom margin to 2cm
  }{geometry}                                    % Specify that options are for the 'geometry' package
}

% 'a4' option: standard A4 paper size
\DeclareOption{a4}{                              % Declare the 'a4' option
  \PassOptionsToPackage{                         % Pass the following options to a package
    paperwidth=210mm,                            % Set paper width to 210mm (A4 width)
    paperheight=297mm,                           % Set paper height to 297mm (A4 height)
    twoside=false,                               % Disable two-sided layout
    inner=2.5cm,                                 % Set inner margin to 2.5cm
    outer=2.5cm,                                 % Set outer margin to 2.5cm
    top=2.5cm,                                   % Set top margin to 2.5cm
    bottom=2.5cm                                 % Set bottom margin to 2.5cm
  }{geometry}                                    % Specify that options are for the 'geometry' package
}

% 'a5' option: standard A5 paper size
\DeclareOption{a5}{                              % Declare the 'a5' option
  \PassOptionsToPackage{                         % Pass the following options to a package
    paperwidth=148mm,                            % Set paper width to 148mm (A5 width)
    paperheight=210mm,                           % Set paper height to 210mm (A5 height)
    twoside=false,                               % Disable two-sided layout
    inner=1.7cm,                                 % Set inner margin to 1.7cm
    outer=1.7cm,                                 % Set outer margin to 1.7cm
    top=2.25cm,                                  % Set top margin to 2.25cm
    bottom=2.25cm                                % Set bottom margin to 2.25cm
  }{geometry}                                    % Specify that options are for the 'geometry' package
}


%-------------------------------------------------------------------------------
% 2.3 Additional Options
%-------------------------------------------------------------------------------

% 'numobs' option: Enables numbering for 'Observation' environments
\DeclareOption{numobs}{\renewcommand\@numobs{true}}   % Set \@numobs to 'true' to enable numbering


%-------------------------------------------------------------------------------
% 2.4 Default Options and Processing
%-------------------------------------------------------------------------------

% Default options are 'compact' page layout and 10pt font size
\ExecuteOptions{compact,10pt}                   % Apply default options if none are specified

% Process all declared options
\ProcessOptions\relax                           % Process options specified by the user

% Load the base 'book' class
\LoadClass{book}                                % Load the 'book' class; options are passed automatically


%===============================================================================
% 3. Package Requirements
%===============================================================================

%% This section loads all the necessary packages required by the class.
%% These packages provide additional functionalities and formatting options.

%-------------------------------------------------------------------------------
% 3.1 Essential Packages
%-------------------------------------------------------------------------------

% Input encoding and font encoding
\RequirePackage[utf8]{inputenc}                 % Allows for UTF-8 encoded text input
\RequirePackage[T1]{fontenc}                    % Use T1 font encoding for better character representation

% Conditional commands and calculations
\RequirePackage{ifthen}                         % Conditional commands
\RequirePackage{calc}                           % Arithmetic operations with lengths

% Code listings and color support
\RequirePackage{minted}                         % For code listings with syntax highlighting
\RequirePackage{xcolor}                         % Enhanced color support

% Graphics and barcodes
\RequirePackage{pstricks}                       % PSTricks graphics support
\RequirePackage{pst-barcode}                    % For generating barcodes

% Mathematics packages
\RequirePackage{amsmath,amsthm}                 % Advanced math typesetting

% Font packages
\RequirePackage{mathpazo}                       % Palatino font package

% Enhanced graphics inclusion
\RequirePackage{graphicx}                       % Enhanced graphics inclusion

% Section title formatting
\RequirePackage{titlesec}                       % Control over section titles

% Line spacing control
\RequirePackage{setspace}                       % Set line spacing

% Header and footer customization
\RequirePackage{fancyhdr}                       % Custom headers and footers

% Text casing transformations
\RequirePackage{textcase}                       % Text casing transformations

% Page break control
\RequirePackage{nextpage}                       % Control over page breaks

% Table of contents customization
\RequirePackage{titletoc}                       % Control over table of contents

% Comment environment
\RequirePackage{comment}                        % Comment environment

% Extended argument parsing
\RequirePackage{xparse}                         % Extended argument parsing

% Framed environments
\RequirePackage{mdframed}                       % Framed environments

% Color boxes and environments
\RequirePackage[many]{tcolorbox}                % Color boxes and environments

% Access to Font Awesome icons
\RequirePackage{fontawesome}                    % Font Awesome icons

% Floating objects
\RequirePackage{float}                          % Improved interface for floating objects

% Page geometry
\RequirePackage{geometry}                       % Flexible page layout

% Caption Customization
\RequirePackage[
    font={small},                               % Set the caption font size to small
    labelfont={bf,small},                       % Make the label font bold and small
    justification=centerlast                    % Center the caption text, aligning the last line
]{caption}                                      % Load the 'caption' package with specified options

% Hyperlinks Customization

\RequirePackage[
    colorlinks,                                 % Enable colored links
    linkcolor=black,                            % Set the color of internal links (e.g., table of contents) to black
    urlcolor=black,                             % Set the color of URL links to black
    citecolor=black,                            % Set the color of citation links to black
    bookmarks=true                              % Enable PDF bookmarks
]{hyperref}                                     % Load the 'hyperref' package with specified options

%-------------------------------------------------------------------------------
% 3.2 Typography Packages
%-------------------------------------------------------------------------------

%% The following command defines the typography options to use according
%% to the type of compiler (e.g., pdfLaTeX, XeLaTeX). It allows for
%% custom font setups depending on the compilation method.
%% This ensures that fonts are rendered correctly and consistently
%% across different compilation engines.

%-------------------------------------------------------------------------------
% Custom Font Command
%-------------------------------------------------------------------------------
\newcommand{\customfont}[1]{                                % Define a new command \customfont with one mandatory argument
    \ifthenelse{\equal{#1}{mathpazo}}{                        % Check if the argument #1 is 'mathpazo'
        \ifPDFTeX                                               % Determine if the compiler is pdfLaTeX
            \RequirePackage{mathpazo}                           % If pdfLaTeX, use the MathPazo font package
        \else                                                   % Else, assume XeLaTeX or LuaLaTeX
            \RequirePackage{fontspec}                           % Use fontspec package for advanced font selection
            \RequirePackage{mathpazo}                           % Use the MathPazo font package for mathematical symbols
            \setmainfont[                                       % Set the main font with specific font files
                BoldFont       = texgyrepagella-bold.otf,       % Define the bold font file
                ItalicFont     = texgyrepagella-italic.otf,     % Define the italic font file
                BoldItalicFont = texgyrepagella-bolditalic.otf    % Define the bold italic font file
            ]{texgyrepagella-regular.otf}                        % Set the regular font file as the main font
        \fi                                                    % End of compiler check
    }{                                                       % Else clause for the first \ifthenelse
        % Do nothing if the argument is not 'mathpazo'
    }
    \ifthenelse{\equal{#1}{montserrat}}{                        % Check if the argument #1 is 'montserrat'
        \ifPDFTeX                                               % Determine if the compiler is pdfLaTeX
            \RequirePackage[defaultfam,tabular,lining]{montserrat}  % Use the Montserrat font package with specific options
            \renewcommand*\oldstylenums[1]{{\fontfamily{Montserrat-TOsF}\selectfont #1}} % Redefine oldstylenums for Montserrat
            \RequirePackage[OT1]{eulervm}                     % Use Euler VM for math fonts with OT1 encoding
            \renewcommand{\labelitemi}{$\bullet$}             % Customize the bullet style in itemize environments
            \DeclareMathSizes{10}{10.78}{7}{7}                % Adjust math sizes for different text sizes
        \else                                                   % Else, assume XeLaTeX or LuaLaTeX
            \RequirePackage[OT1]{eulervm}                     % Use Euler VM for math fonts with OT1 encoding
            \RequirePackage{fontspec}                         % Use fontspec package for advanced font selection
            \setmainfont{montserrat}                          % Set the main font to Montserrat
            \DeclareSymbolFont{operators}{                    % Declare a new symbol font named 'operators'
                \encodingdefault,                                 % Use the default encoding for the document
                \familydefault,                                   % Use the default family for the document
                m,                                                % Medium weight for the font
                n                                                 % Normal shape (upright) for the font
            }  
            \DeclareMathSizes{10}{10.78}{7}{7}                % Adjust math sizes for different text sizes
        \fi                                                    % End of compiler check
    }{                                                       % Else clause for the second \ifthenelse
        % Do nothing if the argument is not 'montserrat'
    }
}


%-------------------------------------------------------------------------------
% 4.1 Initialization of Internal Variables
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
% Series name and language
%-------------------------------------------------------------------------------
\newcommand\@series{October 2024}               % Default series name set to "October 2024"
\newcommand\@language{english}                  % Default language set to English

%-------------------------------------------------------------------------------
% Placeholders for title components
%-------------------------------------------------------------------------------
\newcommand\@thetitle{}                         % Placeholder for the main title of the document
\newcommand\@subtitle{}                         % Placeholder for the subtitle of the document
\newcommand\@partnumber{}                       % Placeholder for the part number (if applicable)
\newcommand\@sepsubtitle{:}                     % Separator between title and subtitle, defaulted to ":"
% \newcommand\@bookauthor{}                       % Placeholder for the full author name
% \newcommand\@bookauthorshort{}                  % Placeholder for the short author name (e.g., initials)

%-------------------------------------------------------------------------------
% Control for numbering observations
%-------------------------------------------------------------------------------
\newcommand\@numobs{}                           % Control variable for numbering observations (usage defined elsewhere)

%-------------------------------------------------------------------------------
% Booleans for enabling features
%-------------------------------------------------------------------------------
\newboolean{comments}                           % Boolean flag to enable or disable comments in the document
\setboolean{comments}{true}                     % Set 'comments' to true by default, enabling comments
\newboolean{codesnippet}                        % Boolean flag to enable or disable code snippets in the document
\setboolean{codesnippet}{true}                  % Set 'codesnippet' to true by default, enabling code snippets

%-------------------------------------------------------------------------------
% Line and theorem spacing
%-------------------------------------------------------------------------------
\newcommand\@linespacing{1.2}                   % Default line spacing set to 1.2 for the document
\newcommand\@theoremspacing{-0.58ex}            % Default spacing adjustment for theorem environments set to -0.58ex

%-------------------------------------------------------------------------------
% Placeholders for logos
%-------------------------------------------------------------------------------
\newcommand\@logofirst{}                        % Placeholder for the first logo image file path
\newcommand\@logosecond{}                       % Placeholder for the second logo image file path (optional)

%-------------------------------------------------------------------------------
% 4.2 Definition of Internal Measurements and Lengths
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
% Lengths for title and subtitle
%-------------------------------------------------------------------------------
\newlength{\longtitle}                          % Define a new length variable \longtitle to store the width of the title
\newlength{\longsubtitle}                       % Define a new length variable \longsubtitle to store the width of the subtitle

%-------------------------------------------------------------------------------
% Calculate lengths at the beginning of the document
%-------------------------------------------------------------------------------
\AtBeginDocument{                                % Execute the enclosed commands at the beginning of the document
    \settowidth{\longtitle}{\LARGE\sc \@booktitle}    % Calculate and set \longtitle to the width of the formatted book title
    \settowidth{\longsubtitle}{\LARGE\sc \@subtitle}   % Calculate and set \longsubtitle to the width of the formatted subtitle
    \setlength{\unitlength}{                          % Define the unit length based on the minimum of the following:
        \minof{                                         % Use the minimum value from the options below
            \maxof{                                       % Determine the maximum value among:
                \maxof{0cm}{\longsubtitle}                  % Maximum of 0cm and the subtitle width
            }{\longtitle}                                 % Maximum of the above result and the title width
        }{0.98\textwidth}                               % Compare the above result with 98% of the text width and set \unitlength to the smaller value
    }
}

%-------------------------------------------------------------------------------
% Adjust spacing before and after equations
%-------------------------------------------------------------------------------
\AtBeginDocument{                                % Execute the enclosed commands at the beginning of the document
    \addtolength{\abovedisplayskip}{-0.5mm}       % Reduce the space above displayed equations by 0.5mm
    \addtolength{\belowdisplayskip}{-0.5mm}       % Reduce the space below displayed equations by 0.5mm
    \frontmatter                                  % Begin the front matter of the document (typically uses Roman numerals for page numbers)
}


%===============================================================================
% 5. User Commands for Setting Document Data
%===============================================================================

%% The following commands are used by the user to set up the document's
%% metadata, such as the author, title, logos, and spacing preferences.
%% These commands allow for easy customization and management of key document elements.

%-------------------------------------------------------------------------------
% 5.1 Author and Title Commands
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
% Author Command: Accepts short and full author names
%-------------------------------------------------------------------------------
\newcommand{\bookauthor}[2][]{                            % Define \bookauthor with optional and mandatory arguments
    \ifthenelse{\equal{#1}{}}{                              % Check if the optional argument (#1) is empty
        \newcommand\@bookauthorshort{#2}                    % If empty, set \@bookauthorshort to the full author name (#2)
        \newcommand\@bookauthor{#2}                         % Also set \@bookauthor to the full author name (#2)
    }{
        \newcommand\@bookauthorshort{#1}                    % If not empty, set \@bookauthorshort to the short author name (#1)
        \newcommand\@bookauthor{#2}                         % Set \@bookauthor to the full author name (#2)
    }
}
%-------------------------------------------------------------------------------
% Book Title Command
%-------------------------------------------------------------------------------
\newcommand{\booktitle}[1]{                                % Define \booktitle with one mandatory argument
    \newcommand\@booktitle{#1}                             % Set \@booktitle to the provided book title (#1)
}
%-------------------------------------------------------------------------------
% Subtitle Command: Optional
%-------------------------------------------------------------------------------
\newcommand{\subtitle}[2][]{                               % Define \subtitle with an optional and a mandatory argument
    \ifthenelse{\not\equal{#1}{}}{                        % Check if the optional argument (#1) is not empty
        \renewcommand\@sepsubtitle{#1}                      % If not empty, set \@sepsubtitle to the provided separator (#1)
    }{}                                                    % Else, do nothing
    \renewcommand\@subtitle{#2}                             % Set \@subtitle to the provided subtitle (#2)
}
%-------------------------------------------------------------------------------
% Part Number Command: Optional
%-------------------------------------------------------------------------------
\newcommand{\partnumber}[1]{                               % Define \partnumber with one mandatory argument
    \renewcommand\@partnumber{#1}                           % Set \@partnumber to the provided part number (#1)
}

%-------------------------------------------------------------------------------
% 5.2 Logo Commands
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
% First Logo Command: Accepts file path and dimensions
%-------------------------------------------------------------------------------
\newcommand{\logofirst}[3]{                                % Define \logofirst with three mandatory arguments
    \renewcommand\@logofirst{#1}                            % Set \@logofirst to the path of the first logo image (#1)
    \newcommand\@lplogofirst{#2}                            % Set \@lplogofirst to the placeholder (unused in this context) (#2)
    \newcommand\@lclogofirst{#3}                            % Set \@lclogofirst to the width for the first logo (#3)
}
%-------------------------------------------------------------------------------
% Second Logo Command: Accepts file path and dimensions
%-------------------------------------------------------------------------------
\newcommand{\logosecond}[3]{                               % Define \logosecond with three mandatory arguments
    \renewcommand\@logosecond{#1}                           % Set \@logosecond to the path of the second logo image (#1)
    \newcommand\@lplogosecond{#2}                           % Set \@lplogosecond to the placeholder (unused in this context) (#2)
    \newcommand\@lclogosecond{#3}                           % Set \@lclogosecond to the width for the second logo (#3)
}

%-------------------------------------------------------------------------------
% 5.3 Spacing Commands
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
% Line Spacing Adjustment Command
%-------------------------------------------------------------------------------
\newcommand{\linespacing}[1]{                              % Define \linespacing with one mandatory argument
    \renewcommand\@linespacing{#1}                           % Set \@linespacing to the provided spacing value (#1)
}
%-------------------------------------------------------------------------------
% Theorem Spacing Adjustment Command
%-------------------------------------------------------------------------------
\newcommand{\theoremspacing}[1]{                           % Define \theoremspacing with one mandatory argument
    \renewcommand\@theoremspacing{#1}                        % Set \@theoremspacing to the provided spacing value (#1)
}

%===============================================================================
% 6. Title Page and Table of Contents
%===============================================================================

%% This section defines the default title page and customizes the table of contents.

%-------------------------------------------------------------------------------
% 6.1 Default Title Page
%-------------------------------------------------------------------------------

%% This command generates the default title page of the document.
%% It utilizes the metadata provided by the user, such as title, author, and logos,
%% to create a professionally formatted title page with decorative elements.

\newcommand{\defaulttitlepage}{                              % Define a new command \defaulttitlepage
    \newgeometry{                                             % Begin setting custom page geometry for the title page
        left=2cm,                                             % Set the left margin to 2 centimeters
        right=2cm,                                            % Set the right margin to 2 centimeters
        top=2.5cm,                                            % Set the top margin to 2.5 centimeters
        bottom=1cm                                            % Set the bottom margin to 1 centimeter
    }                                                         % End of \newgeometry settings
    \cleardoublepage                                          % Start on a new page; ensures the title page begins on a right-hand page in double-sided documents
    \begin{spacing}{1.0}                                      % Begin a spacing environment with single line spacing
        \thispagestyle{empty}                                 % Remove page numbering and headers/footers on the title page
        \begingroup                                            % Begin a local group to limit the scope of changes
            \centering                                        % Center all content within this group horizontally
            % Series Name
            \begin{spacing}{1.3}                              % Begin a spacing environment with 1.3 line spacing for the series name
                \Large\scshape \@series                       % Display the series name in Large font size and small caps
            \end{spacing}                                    % End of spacing environment for series name
            
            % Author Name
            \vspace{0.21\textheight}                          % Add vertical space equivalent to 21% of the text height to position the author name lower on the page
            {%
                \large\scshape \@bookauthorshort               % Display the author's short name in large font size and small caps
            }\\[0.4\baselineskip]                               % Line break with additional vertical space of 0.4 times the baseline skip
            
            % Decorative Lines Above Title
            \rule{\unitlength}{1.6pt}\\[-\baselineskip]       % Draw a thick horizontal line with height 1.6pt; adjust position upwards by one baseline skip
            \vspace{3pt}                                       % Add 3 points of vertical space after the thick line
            \rule{\unitlength}{0.4pt}\\[0.5\baselineskip]     % Draw a thin horizontal line with height 0.4pt and add 0.5 times the baseline skip of vertical space
            
            % Book Title and Subtitle
            \begin{spacing}{1}                                  % Begin a spacing environment with single line spacing for the title and subtitle
                \ifthenelse{\equal{\@partnumber}{}}{            % Check if \@partnumber is empty (i.e., no part number)
                    \ifthenelse{\equal{\@subtitle}{}}{        % If \@partnumber is empty, check if \@subtitle is also empty
                        \LARGE \textsc{\@booktitle}           % If both are empty, display only the book title in LARGE font size and small caps
                    }{                                      % Else, if \@subtitle is provided
                        {%
                            \LARGE \textsc{\@booktitle}       % Display the book title in LARGE font size and small caps
                        }\\[\baselineskip]                      % Line break with vertical space equal to one baseline skip
                        {%
                            \Large\scshape \@subtitle          % Display the subtitle in Large font size and small caps
                        }                                      % End of else block for \@subtitle
                    }
                }{                                                  % Else, if \@partnumber is provided
                    \ifthenelse{\equal{\@subtitle}{}}{            % Check if \@subtitle is empty
                        \LARGE \textsc{\@booktitle}\\[\baselineskip] % Display the book title in LARGE font size and small caps with a line break
                        {\large\@partnumber}                    % Display the part number in large font size
                    }{                                              % Else, if both \@partnumber and \@subtitle are provided
                        {%
                            \LARGE \textsc{\@booktitle}           % Display the book title in LARGE font size and small caps
                        }\\[\baselineskip]                          % Line break with vertical space equal to one baseline skip
                        {%
                            \Large\scshape \@subtitle              % Display the subtitle in Large font size and small caps
                        }\\[\baselineskip]                          % Line break with vertical space equal to one baseline skip
                        {%
                            \large\@partnumber                      % Display the part number in large font size
                        }                                          % End of else block for both \@subtitle and \@partnumber
                    }
                }                                                  % End of else block for \@partnumber
            \end{spacing}                                        % End of spacing environment for title and subtitle
            
            \vspace*{-0.5\baselineskip}                           % Add negative vertical space to adjust spacing after the title block
            
            % Decorative Lines Below Title
            \rule{\unitlength}{0.4pt}\\[-\baselineskip]          % Draw a thin horizontal line with height 0.4pt; adjust position upwards by one baseline skip
            \vspace{4.5pt}                                       % Add 4.5 points of vertical space after the thin line
            \rule{\unitlength}{1.6pt}                             % Draw a thick horizontal line with height 1.6pt
            
            % Logos at the Bottom
            \par\vfill                                            % Fill the remaining vertical space to push logos to the bottom of the page
            \ifthenelse{\equal{\@logosecond}{}}{                  % Check if \@logosecond is empty (i.e., no second logo)
                \includegraphics[width=\@lclogofirst]{\@logofirst}  % If only one logo is provided, include the first logo with specified width
            }{                                                    % Else, if a second logo is provided
                {   % Begin a group for including both logos side by side
                    \raisebox{-0.5\height}{%                    % Adjust the vertical position of the first logo
                        \includegraphics[width=\@lclogofirst]{\@logofirst}%
                    }%
                    \hspace{0.08\textwidth}                      % Add horizontal space of 8% of the text width between the two logos
                    \raisebox{-0.5\height}{%                    % Adjust the vertical position of the second logo
                        \includegraphics[width=\@lclogosecond]{\@logosecond}%
                    }%                                            % End of second logo inclusion
                }   % End of group for logos
            }                                                    % End of \ifthenelse for logos
            \par\vspace*{0.001\textheight}                        % Add a minuscule vertical space after the logos
        \endgroup                                                % End of the local group, reverting any local changes
    \end{spacing}                                                % End of the spacing environment for the title page
    \restoregeometry                                              % Restore the original page margins after the title page
}                                                               % End of \defaulttitlepage command


%-------------------------------------------------------------------------------
% 6.2 Table of Contents Customization
%-------------------------------------------------------------------------------

%% This command generates the table of contents with custom formatting.
%% It adjusts page margins and controls how entries appear in the table of contents.

\newcommand{\contenttable}{
    \newgeometry{                                         % Set custom margins for the table of contents
        left=2cm,                                         % Left margin set to 2cm
        right=2cm,                                        % Right margin set to 2cm
        top=2.5cm,                                        % Top margin set to 2.5cm
        bottom=2cm                                        % Bottom margin set to 2cm
    }
    \let\cleardoublepage\relax                            % Disable the effect of \cleardoublepage temporarily
    \tableofcontents                                      % Generate the table of contents
    \clearpage                                            % Ensure the table of contents ends on a new page
    \cleardoublepage                                      % Clear to the next right-hand page if necessary
    \restoregeometry                                      % Restore original page margins
}

%% Additionally, the styles for chapter, section, and subsection entries are defined.

% Chapter entries in the table of contents
\titlecontents{chapter}[1.6cm]                          % Format for 'chapter' entries with 1.6cm indentation
    {%
        \addvspace{2pt}%                                  % Add 2pt vertical space before the entry
        \color{colortext}%                                % Set the text color using 'colortext'
        \Large\bfseries\scshape                           % Apply Large size, bold, and small caps formatting
    }
    {%
        \contentslabel[\large Ch. \thecontentslabel]{1.6cm}% Label format: "Ch. X" with 1.6cm width
    }
    {}                                                    % No additional code before the title text
    {%
        \normalsize%                                      % Set the title text to normal size
        \hfill%                                           % Push the page number to the far right
        \thecontentspage                                  % Insert the page number
    }

% Section entries in the table of contents
\titlecontents{section}[1.6cm]                          % Format for 'section' entries with 1.6cm indentation
    {%
        \addvspace{3pt}%                                  % Add 3pt vertical space before the entry
    }
    {%
        \contentslabel[\thecontentslabel]{0.88cm}%        % Label format: "X.X" with 0.88cm width
    }
    {}                                                    % No additional code before the title text
    {%
        \ \titlerule*[.5pc]{.}\;\;                        % Insert leader dots with 0.5pc spacing
        \thecontentspage                                  % Insert the page number
    }
    []                                                    % No additional code after the entry

% Subsection entries in the table of contents
\titlecontents{subsection}[2.5cm]                       % Format for 'subsection' entries with 2.5cm indentation
    {%
        \addvspace{1pt}%                                  % Add 1pt vertical space before the entry
        \small%                                           % Set the title text to small size
    }
    {%
        \contentslabel[\thecontentslabel]{0.9cm}%         % Label format: "X.X.X" with 0.9cm width
    }
    {}                                                    % No additional code before the title text
    {%
        \ \titlerule*[.51pc]{.}\;\;                       % Insert leader dots with 0.51pc spacing
        \thecontentspage                                  % Insert the page number
    }
    []                                                    % No additional code after the entry

    

%===============================================================================
% 7. Page Style Configuration
%===============================================================================

%% This section defines the headers, footers, and general page layout settings.

%-------------------------------------------------------------------------------
% 7.1 Line Spacing Settings
%-------------------------------------------------------------------------------

% Set line spacing
\renewcommand{\baselinestretch}{\@linespacing}       % Adjust line spacing based on \@linespacing variable

% Explanation:
% - \baselinestretch is a LaTeX parameter that scales the baseline skip (the vertical distance between lines).
% - \@linespacing is a custom variable (should be defined elsewhere) that specifies the desired line spacing.
% - By redefining \baselinestretch, we adjust the line spacing throughout the document.

%-------------------------------------------------------------------------------
% 7.2 Header and Footer Customization
%-------------------------------------------------------------------------------

% Configure headers and footers using the fancyhdr package
\let\clipbox\relax  % Remove \clipbox definition


\pagestyle{fancy}                                    % Use the 'fancy' page style for all pages

% Customize chapter and section marks for the headers
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}      % Redefine \chaptermark to set the left header
\renewcommand{\sectionmark}[1]{\markright{           % Redefine \sectionmark to set the right header
    \thesection\ #1                                  % Include the section number and title
}}

% Adjust spacing for the footer
\setlength{\footskip}{30pt}                          % Increase the space between the bottom of the text body and the footer

% Clear all header and footer fields
\fancyhf{}                                           % Clear all header and footer fields to start fresh

% Set header content
\fancyhead[L]{                                     % Left header (all pages)
    \color{gray}%                                    % Set text color to gray
    \small%                                          % Set font size to small
    \bfseries%                                       % Make text bold
    {Programming Guide}%                             % Header text
}

\fancyhead[R]{                                     % Right header (all pages)
    \color{gray}%                                    % Set text color to gray
    \small%                                          % Set font size to small
    \nouppercase{%                                   % Prevent automatic uppercase conversion
        \leftmark%                                   % Left mark (set by \chaptermark), displays chapter title
    }
}

% Set footer content
\fancyfoot[C]{                                     % Centered footer on all pages
    -\hspace{0.5em}%                                 % Dash with half-em space before
    \thepage%                                        % Insert page number
    \hspace{0.5em}-                                  % Half-em space and dash after
}

% Set header and footer rule thickness
\renewcommand{\headrulewidth}{0.2pt}                 % Header rule thickness (0.2 points)
\renewcommand{\footrulewidth}{0.2pt}                 % Footer rule thickness (0.2 points)

% Adjust the head height to accommodate the header
\addtolength{\headheight}{0.1pt}                     % Slightly increase the head height

% Ensure that the first page of each chapter/section uses the fancy style
\fancypagestyle{plain}{                              % Redefine the 'plain' page style (used on chapter starting pages)
    \fancyhf{}                                       % Clear header and footer
    \fancyfoot[C]{                                   % Centered footer
        -\hspace{0.5em}%                             % Dash with half-em space before
        \thepage%                                    % Insert page number
        \hspace{0.5em}-                              % Half-em space and dash after
    }
    \renewcommand{\headrulewidth}{0pt}               % Remove header line for plain pages
    \renewcommand{\footrulewidth}{0.2pt}             % Set footer line thickness for plain pages
}


%===============================================================================
% 8. Title and Section Styles
%===============================================================================

%% This section defines the styles for chapter and section titles.

%-------------------------------------------------------------------------------
% 8.1 Chapter Title Style
%-------------------------------------------------------------------------------

% Chapter style using the titlesec package
\titleformat{\chapter}[display]%                           % Format for \chapter titles with 'display' shape
    {%
        \vspace{-3cm}%                                     % Adjust vertical position (move up by 3cm)
        \bfseries%                                         % Apply bold formatting to the title
        \scshape%                                          % Apply small caps to the title text
        \centering%                                        % Center the chapter title horizontally
    }%
    {%
        \huge%                                             % Set font size to 'huge' for the chapter number
        \chaptertitlename\ \ \thechapter%                  % Format chapter number as 'Chapter X'
    }%
    {1ex}%                                                 % Vertical space between chapter number and chapter title
    {%
        \color{colortext}%                                 % Set the text color for the title using 'colortext'
        \LARGE%                                            % Set font size to 'LARGE' for the chapter title
        \titlerule%                                        % Insert a horizontal rule (line) above the chapter title
        \vspace{1ex}%                                      % Add vertical space after the rule
    }%
    [%
        \color{colortext}%                                 % Set the text color for the closing rule
        \vspace{1ex}%                                      % Add vertical space before the closing rule
        \titlerule%                                        % Insert a horizontal rule (line) below the chapter title
    ]%


%-------------------------------------------------------------------------------
% 8.2 Section and Subsection Styles
%-------------------------------------------------------------------------------

% Section style using titlesec
\titleformat{\section}%                                    % Format for \section titles
    {%
        \color{colortext}%                                 % Set text color using 'colortext'
        \normalfont%                                       % Use the normal font shape
        \Large%                                            % Set font size to 'Large'
        \bfseries%                                         % Apply bold formatting
        \scshape%                                          % Apply small caps formatting
    }%
    {%
        \thesection%                                       % Section number representation (e.g., '1.1')
    }%
    {1em}%                                                 % Horizontal space between number and title
    {}%                                                    % Code before the title text (empty in this case)

% Subsection style
\titleformat{\subsection}%                                 % Format for \subsection titles
    {%
        \color{colortext}%                                 % Set text color using 'colortext'
        \normalfont%                                       % Use the normal font shape
        \large%                                            % Set font size to 'large'
        \bfseries%                                         % Apply bold formatting
    }%
    {%
        \thesubsection%                                    % Subsection number representation (e.g., '1.1.1')
    }%
    {1em}%                                                 % Horizontal space between number and title
    {}%                                                    % Code before the title text (empty in this case)

% Subsubsection style
\titleformat{\subsubsection}%                              % Format for \subsubsection titles
    {%
        \color{colortext}%                                 % Set text color using 'colortext'
        \normalfont%                                       % Use the normal font shape
        \normalsize%                                       % Set font size to 'normalsize' (default size)
        \bfseries%                                         % Apply bold formatting
    }%
    {%
        \thesubsubsection%                                 % Subsubsection number representation (e.g., '1.1.1.1')
    }%
    {1em}%                                                 % Horizontal space between number and title
    {}%                                                    % Code before the title text (empty in this case)


%===============================================================================
% 9. Theorem Styles and Environments
%===============================================================================

%% This section defines custom theorem environments with color-coded boxes.
%% It uses the tcolorbox package to style the theorem environments.

%-------------------------------------------------------------------------------
% 9.1 Color Definitions for Theorem Environments
%-------------------------------------------------------------------------------

%% The following are the default colors used for theorem environments.
%% Colors are defined using CMYK or HEX values for consistency.

% General color definitions
\definecolor{colordef}{cmyk}{0.81,0.62,0.00,0.22}    % Default color
\definecolor{colortext}{cmyk}{0.81,0.62,0.00,0.22}   % Default text color


%% The following color definitions use the \definecolor command from the xcolor package.
%% Each color is defined using its HTML hex code for precise color matching.

\definecolor{lightteal}{HTML}{e0f7fa}           % Define 'lightteal' color (#e0f7fa), a very light teal
\definecolor{darkteal}{HTML}{00695c}            % Define 'darkteal' color (#00695c), a deep teal shade
\definecolor{lightblue}{HTML}{e3f2fd}           % Define 'lightblue' color (#e3f2fd), a pale blue
\definecolor{deepnavy}{HTML}{1565c0}            % Define 'deepnavy' color (#1565c0), a strong navy blue
\definecolor{lightlavender}{HTML}{f3e5f5}       % Define 'lightlavender' color (#f3e5f5), a soft lavender
\definecolor{richpurple}{HTML}{7b1fa2}          % Define 'richpurple' color (#7b1fa2), a vibrant purple
\definecolor{lightpeach}{HTML}{fff3e0}          % Define 'lightpeach' color (#fff3e0), a pale peach
\definecolor{deeporange}{HTML}{ef6c00}          % Define 'deeporange' color (#ef6c00), a bold orange
\definecolor{softyellow}{HTML}{fffde7}          % Define 'softyellow' color (#fffde7), a very light yellow
\definecolor{mustardyellow}{HTML}{fbc02d}       % Define 'mustardyellow' color (#fbc02d), a mustard yellow
\definecolor{darkbrown}{HTML}{6d4c41}           % Define 'darkbrown' color (#6d4c41), a deep brown
\definecolor{palemintgreen}{HTML}{e8f5e9}       % Define 'palemintgreen' color (#e8f5e9), a light mint green
\definecolor{forestgreen}{HTML}{2e7d32}         % Define 'forestgreen' color (#2e7d32), a rich forest green
\definecolor{deepgreen}{HTML}{1b5e20}           % Define 'deepgreen' color (#1b5e20), a deep green
\definecolor{magenta}{HTML}{FF00FF}             % Define 'magenta' color (#FF00FF), a bright magenta
\definecolor{yellow}{HTML}{FFFF00}              % Define 'yellow' color (#FFFF00), a pure yellow


%-------------------------------------------------------------------------------
% 9.2 Temporary Keys and Styles for tcolorbox
%-------------------------------------------------------------------------------

%% Temporary keys for tcolorbox

\def\tcb@@thetitle{}                                      % Initialize \tcb@@thetitle as empty
\tcbset{
    thetitle/.code = {                                    % Define 'thetitle' key for tcolorbox
        \def\tcb@@thetitle{#1}                            % Assign the value of #1 to \tcb@@thetitle
    }
}

\def\tcb@@counter{}                                       % Initialize \tcb@@counter as empty
\tcbset{
    counter/.code = {                                     % Define 'counter' key for tcolorbox
        \def\tcb@@counter{#1}                             % Assign the value of #1 to \tcb@@counter
    }
}

\def\tcb@@color{colordef}                                 % Initialize \tcb@@color with default 'colordef'
\tcbset{
    color/.code = {                                       % Define 'color' key for tcolorbox
        \def\tcb@@color{#1}                               % Assign the value of #1 to \tcb@@color
    }
}

\def\tcb@@icono{{\large\faWarning}}                       % Initialize \tcb@@icono with a warning icon
\tcbset{
    icono/.code = {                                       % Define 'icono' key for tcolorbox
        \def\tcb@@icono{#1}                               % Assign the value of #1 to \tcb@@icono
    }
}


%-------------------------------------------------------------------------------
% 9.3 Custom Theorem Style (Detailed)
%-------------------------------------------------------------------------------

%% Custom theorem style using amsthm
\newtheoremstyle{customtheoremstyle}%                     % Begin definition of 'customtheoremstyle'
    {10pt}                                                % Space above the theorem environment
    {9pt}                                                 % Space below the theorem environment
    {}                                                    % Body font (empty means default font)
    {0pt}                                                 % Indent amount (no indentation)
    {\bfseries\color{\tcb@@color}}                        % Theorem head font (bold and colored using \tcb@@color)
    {}                                                    % Punctuation after theorem head (none)
    { }                                                   % Space after theorem head (none)
    {                                                     % Theorem head specification starts here
        \textsc{                                          % Begin small caps formatting
            \thmname{#1}                                  % Insert theorem name (e.g., "Theorem")
            \thmnumber{ #2}                               % Insert theorem number with a preceding space
        }                                                 % End of small caps formatting
        \thmnote{                                         % Begin optional theorem note
            : #3                                          % Insert colon and the note text (e.g., ": Pythagorean Theorem")
        }
        .                                                 % Period at the end of the theorem heading
    }                                                     % End of theorem head specification

%% Box without a separate title (framedbox style)
\tcbset{
    framedbox/.style ={
        before skip=10pt,                                 % Vertical space before the box
        arc=0mm,                                          % No corner rounding
        breakable,                                        % Allow the box to break across pages
        enhanced,                                         % Enable advanced features
        colback=\tcb@@color!7,                            % Background color (light shade of \tcb@@color)
        colframe=\tcb@@color,                             % Frame color
        boxrule=0pt,                                      % Frame border thickness
        leftrule=2pt,                                     % Left border thickness
        top=0.5mm,                                        % Top padding inside the box
        bottom=0.5mm,                                     % Bottom padding inside the box
        left=2mm,                                         % Left padding inside the box
        right=2mm,                                        % Right padding inside the box
        fontupper=\normalsize,                            % Font size inside the box
    }
}

%-------------------------------------------------------------------------------
% 9.4 Box Styles for Environments
%-------------------------------------------------------------------------------

%% Post-it style box (postit style)
\tcbset{
    postit/.style ={
        breakable,                                        % Allow the box to break across pages
        enhanced,                                         % Enable advanced features
        before skip=2mm,                                  % Vertical space before the box
        after skip=3mm,                                   % Vertical space after the box
        colback=\tcb@@color!50,                           % Background color (50% shade of \tcb@@color)
        colframe=\tcb@@color!20!black,                    % Frame color (blend of \tcb@@color and black)
        boxrule=0.4pt,                                    % Frame border thickness
        drop fuzzy shadow,                                % Add a fuzzy drop shadow
        left=6mm,                                         % Left padding inside the box
        right=2mm,                                        % Right padding inside the box
        top=0.5mm,                                        % Top padding inside the box
        bottom=0.5mm,                                     % Bottom padding inside the box
        sharp corners,                                    % No rounding on corners
        rounded corners=southeast,                        % Round the southeast corner
        arc is angular,                                   % Arc style is angular
        arc=3mm,                                          % Arc size for rounded corner
        underlay unbroken and last = {                    % Custom drawing under the box content (last page)
            % Decorative fold effect
            \path[fill=tcbcolback!80!black]               % Begin a path with fill color (darker shade of background)
                ([yshift=3mm]interior.south east)         % Start from slightly above the southeast corner
                --++ (-0.4,-0.1)                          % Draw line relative to current point (left and slightly down)
                --++ (0.1,-0.2);                          % Continue drawing line (right and down)
            
            % Outline for fold
            \path[draw=tcbcolframe,                       % Begin a path with stroke color (frame color)
                shorten <=-0.05mm,                        % Extend start of line slightly backward
                shorten >=-0.05mm]                        % Extend end of line slightly forward
                ([yshift=3mm]interior.south east)         % Start from slightly above the southeast corner
                --++ (-0.4,-0.1)                          % Draw line relative to current point (left and slightly down)
                --++ (0.1,-0.2);                          % Continue drawing line (right and down)
            
            % Icon on the left side
            \path[fill=\tcb@@color!50!black,draw=none]    % Begin a path to fill without stroke
                (interior.south west)                     % Start from the southwest corner of the interior
                rectangle                                 % Draw a rectangle
                node[white]{\tcb@@icono}                  % Place the icon node inside the rectangle
                ([xshift=5.5mm]interior.north west);      % End at a point shifted right from northwest corner
        },
        underlay = {                                       % Custom drawing under the box content (every page)
            % Icon on the left side
            \path[fill=\tcb@@color!50!black,draw=none]    % Begin a path to fill without stroke
                (interior.south west)                     % Start from the southwest corner of the interior
                rectangle                                 % Draw a rectangle
                node[white]{\tcb@@icono}                  % Place the icon node inside the rectangle
                ([xshift=5.5mm]interior.north west);      % End at a point shifted right from northwest corner
        }
    }
}

%% Box with internal separate title
\tcbset{ tintedbox/.style ={
    % -> General options
    before skip=10pt,                           % Vertical space before the box
    arc=0mm,                                    % No corner rounding
    breakable,                                  % Allow the box to break across pages
    enhanced,                                   % Enable advanced features
    colback=colordef!7,                         % Background color (light shade of 'colordef')
    colframe=colordef!7,                        % Frame color (light shade of 'colordef')
    colbacktitle=colordef!7,                    % Title background color (light shade of 'colordef')
    boxrule=0pt,                                % No border around the box
    toprule=0.4pt,                              % Top rule thickness
    drop fuzzy shadow,                          % Add a fuzzy drop shadow effect
    top=0.5mm,                                  % Top padding inside the box
    bottom=0.5mm,                               % Bottom padding inside the box
    left=2mm,                                   % Left padding inside the box
    right=2mm,                                  % Right padding inside the box
    fontupper=\normalsize,                      % Font size inside the box
    code={\refstepcounter{\tcb@@counter}},      % Increment the counter
    % parbox=false,                              % (Commented out) Do not use parbox
    % Title drawing
    overlay unbroken and first = {              % Custom overlay for the first page when unbroken
        % Thick top border
        \draw[                                  % Begin drawing command
            \tcb@@color,                        % Set drawing color to \tcb@@color
            line width=2.5cm                    % Set line width to 2.5cm
        ]
        ([xshift=1.25cm, yshift=0cm]            % Shift start point horizontally by 1.25cm
        frame.north west)                       % Start from the top-left corner of the frame
        --                                      % Draw from the start point to...
        +(0pt,3pt);                             % ...a point 3pt above (relative position)
    },
    overlay middle and last = { },              % No overlay for middle and last pages
    title={                                     % Title formatting
        \color{\tcb@@color}\bfseries            % Set title text color and make it bold
        {                                       % Begin group for title content
            \tcb@@thetitle                      % Insert the title (e.g., 'Definition')
            ~                                   % Add a non-breaking space
            \thechapter.\arabic{\tcb@@counter}  % Insert chapter number and counter
        }%
        \ifthenelse{\equal{#1}{}}               % Check if optional argument #1 is empty
            {                                   % If it is empty
                .                               % Add a period
            }{                                  % Else, if #1 is provided
                : #1.                           % Add colon, #1 (optional title), and period
            }%
    },
}
}

%% Box for code snippets
\tcbset{ codesnippetbox/.style ={
    % -> General options
    before skip=10pt,                           % Vertical space before the box
    arc=1.5mm,                                  % Rounded corners with 1.5mm arc
    breakable,                                  % Allow the box to break across pages
    enhanced,                                   % Enable advanced features
    colframe=\tcb@@color,                       % Frame color set to \tcb@@color
    % colback=colordef!7,                       % (Commented out) Background color
    colback=gray!2,                             % Background color set to light gray
    colbacktitle=colordef!5,                    % Title background color
    drop fuzzy shadow,                          % Add a fuzzy drop shadow effect
    top=0.5mm,                                  % Top padding inside the box
    bottom=0.5mm,                               % Bottom padding inside the box
    left=2mm,                                   % Left padding inside the box
    right=2mm,                                  % Right padding inside the box
    boxrule=0.4pt,                              % Border thickness around the box
    toprule=0.4pt,                              % Top rule thickness
    leftrule=2pt,                               % Left border thickness
    fontupper=\normalsize,                      % Font size inside the box
    code={\refstepcounter{\tcb@@counter}},      % Increment the counter
    % parbox=true,                               % (Commented out) Use parbox
    % Title drawing
    % overlay unbroken and first = {}            % No overlay for first page
    % overlay middle and last = { },             % No overlay for middle and last pages
    title={                                     % Title formatting
        \color{\tcb@@color}\bfseries            % Set title text color and make it bold
        {                                       % Begin group for title content
            \tcb@@thetitle                      % Insert the title (e.g., 'Code Snippet')
            ~                                   % Add a non-breaking space
            \thechapter.\arabic{\tcb@@counter}  % Insert chapter number and counter
        }%
        \ifthenelse{\equal{#1}{}}               % Check if optional argument #1 is empty
            {                                   % If it is empty
                .                               % Add a period
            }{                                  % Else, if #1 is provided
                : #1.                           % Add colon, #1 (optional title), and period
            }%
    },
}
}

%% Box for examples
\tcbset{ examplebox/.style ={
    % -> General options
    before skip=10pt,                           % Vertical space before the box
    arc=1.5mm,                                  % Rounded corners with 1.5mm arc
    breakable,                                  % Allow the box to break across pages
    enhanced,                                   % Enable advanced features
    colback=pink!20,                            % Background color set to light pink
    colframe=purple,                            % Frame color set to purple
    colbacktitle=purple,                        % Title background color set to purple
    boxrule=1pt,                                % Border thickness around the box
    toprule=2pt,                                % Top rule thickness
    bottomrule=2pt,                             % Bottom rule thickness
    drop fuzzy shadow,                          % Add a fuzzy drop shadow effect
    top=1.5mm,                                  % Top padding inside the box
    bottom=1.5mm,                               % Bottom padding inside the box
    left=2mm,                                   % Left padding inside the box
    right=2mm,                                  % Right padding inside the box
    fontupper=\normalsize,                      % Font size inside the box
    code={\refstepcounter{example}},            % Increment the 'example' counter
    % parbox=false,                              % (Commented out) Do not use parbox
    % Title drawing
    overlay unbroken and first = {              % Custom overlay for the first page when unbroken
        % Thick top border
        \draw[                                  % Begin drawing command
            white,                              % Set drawing color to white
            line width=2.5cm                    % Set line width to 2.5cm
        ]
        ([xshift=1.25cm, yshift=0cm]            % Shift start point horizontally by 1.25cm
        frame.north west)                       % Start from the top-left corner of the frame
        --                                      % Draw from the start point to...
        +(0pt,3pt);                             % ...a point 3pt above (relative position)
    },
    overlay middle and last = { },              % No overlay for middle and last pages
    title={                                     % Title formatting
        \normalsize\scshape\bfseries\color{white}  % Set title font size, small caps, bold, and white color
        {                                       % Begin group for title content
            Example~\thechapter.\arabic{example} % Insert 'Example' with chapter and example numbering
        }%
        \ifthenelse{\equal{#1}{}}               % Check if optional argument #1 is empty
            {                                   % If it is empty
                .                               % Add a period
            }{                                  % Else, if #1 is provided
                : #1.                           % Add colon, #1 (optional title), and period
            }%
    }
}
}

%-------------------------------------------------------------------------------
% 9.5 Environment Definitions
%-------------------------------------------------------------------------------

%% Environments without a box: Observation (obs)
\ifthenelse{\equal{\@numobs}{true}}{                      % If \@numobs equals 'true'
    \newtheorem{obs}{                                     % Define numbered 'obs' environment
        \tikz \fill[colordef] (1ex,1ex)                   % Draw a colored circle using TikZ
        circle (3.5pt); Observation                       % Label it as 'Observation'
    }[chapter]                                            % Numbered within chapters
}{
    \newtheorem*{obs}{                                    % Define unnumbered 'obs' environment
        \tikz \fill[colordef] (1ex,1ex)                   % Draw a colored circle using TikZ
        circle (3.5pt); Observation                       % Label it as 'Observation'
    }
}

%% Environments with framedbox style: Proposition, Corollary, Lemma, Exercise

% Proposition environment
\newtheorem{prop}{Proposition}[chapter]                   % Define 'prop' environment, numbered within chapters
\tcolorboxenvironment{prop}{                              % Define tcolorbox styling for 'prop' environment
    color=darkteal,                                       % Set text color to dark teal
    colframe=darkteal,                                    % Set frame color to dark teal
    framedbox,                                            % Use 'framedbox' style
    colback=lightteal,                                    % Set background color to light teal
    drop fuzzy shadow                                     % Add a fuzzy shadow effect
}

% Corollary environment
\newtheorem{cor}[prop]{Corollary}                         % Define 'cor' environment, sharing counter with 'prop'
\tcolorboxenvironment{cor}{                               % Define tcolorbox styling for 'cor' environment
    color=deeporange,                                     % Set text color to deep orange
    colframe=deeporange,                                  % Set frame color to deep orange
    framedbox,                                            % Use 'framedbox' style
    colback=lightpeach,                                   % Set background color to light peach
    drop fuzzy shadow                                     % Add a fuzzy shadow effect
}

% Lemma environment
\newtheorem{lem}[prop]{Lemma}                             % Define 'lem' environment, sharing counter with 'prop'
\tcolorboxenvironment{lem}{                               % Define tcolorbox styling for 'lem' environment
    color=richpurple,                                     % Set text color to rich purple
    colframe=richpurple,                                  % Set frame color to rich purple
    framedbox,                                            % Use 'framedbox' style
    colback=lightlavender,                                % Set background color to light lavender
    drop fuzzy shadow                                     % Add a fuzzy shadow effect
}

% Exercise environment
\newtheorem{exercise}{Exercise}[chapter]                  % Define 'exercise' environment, numbered within chapters
\tcolorboxenvironment{exercise}{                          % Define tcolorbox styling for 'exercise' environment
    color=deepnavy,                                       % Set text color to deep navy
    colframe=deepnavy,                                    % Set frame color to deep navy
    framedbox,                                            % Use 'framedbox' style
    colback=lightblue,                                    % Set background color to light blue
    drop fuzzy shadow                                     % Add a fuzzy shadow effect
}

%% Environments with separate title: Theorem

% Theorem environment
\theoremstyle{customtheoremstyle}                         % Use custom theorem style
\newtheorem{theorem}[prop]{Theorem}                       % Define 'theorem' environment, sharing counter with 'prop'
\tcolorboxenvironment{theorem}{                           % Define tcolorbox styling for 'theorem' environment
    color=brown,                                          % Set text color to brown
    framedbox,                                            % Use 'framedbox' style
    colback=brown!15,                                     % Set background color to 15% brown
    drop fuzzy shadow                                     % Add a fuzzy shadow effect
}

%% Definition environment with separate title
\newcounter{defi}[chapter]                                % Define 'defi' counter, reset every chapter
\renewcommand{\thedefi}{\thechapter.\arabic{defi}}        % Define numbering for 'defi' as Chapter.Number
\newtcolorbox{defi}[1][]{                                 % Define 'defi' tcolorbox environment with optional argument
    thetitle=Definition,                                  % Set the title to 'Definition'
    counter=defi,                                         % Use 'defi' counter
    color=deepgreen,                                      % Set text color to deep green
    tintedbox={#1},                                       % Use 'tintedbox' style with optional argument
    colframe=forestgreen,                                 % Set frame color to forest green
    colback=palemintgreen,                                % Set background color to pale mint green
    colbacktitle=palemintgreen                            % Set title background color to pale mint green
}

%% Axiom environment with separate title
\newcounter{axioma}[chapter]                              % Define 'axioma' counter, reset every chapter
\renewcommand{\theaxioma}{\thechapter.\arabic{axioma}}    % Define numbering for 'axioma' as Chapter.Number
\newtcolorbox{axioma}[1][]{                               % Define 'axioma' tcolorbox environment with optional argument
    thetitle=Axiom,                                       % Set the title to 'Axiom'
    counter=axioma,                                       % Use 'axioma' counter
    color=magenta,                                        % Set text color to magenta
    framedbox,                                            % Use 'framedbox' style
    tintedbox={#1},                                       % Use 'tintedbox' style with optional argument
    colframe=mustardyellow,                               % Set frame color to mustard yellow
    colback=softyellow,                                   % Set background color to soft yellow
    colbacktitle=softyellow                               % Set title background color to soft yellow
}

%% Example environment
\newcounter{example}[chapter]                             % Define 'example' counter, reset every chapter
\renewcommand{\theexample}{\thechapter.\arabic{example}}  % Define numbering for 'example' as Chapter.Number
\newtcolorbox{example}[1][]{                              % Define 'example' tcolorbox environment with optional argument
    examplebox={#1}                                       % Use 'examplebox' style with optional argument
}

%% Warning environment: advertencia
\newtcolorbox{advertencia}{                               % Define 'advertencia' tcolorbox environment
    color=yellow,                                         % Set text color to yellow
    postit                                                % Use 'postit' style
}

%===============================================================================
% 10. Optional Environments
%===============================================================================

%% This section defines optional environments that can be enabled or disabled
%% based on user preferences.

%-------------------------------------------------------------------------------
% 10.1 Comment Environment
%-------------------------------------------------------------------------------

%% Comment style for the instructor
\ifthenelse{\boolean{comments}}{                    % If the 'comments' boolean is true
    \newtcolorbox{comments}{                        % Define a new tcolorbox environment 'comments'
        breakable,                                  % Allow the box to break across pages
        enhanced,                                   % Enable advanced features
        outer arc=0pt,                              % No outer corner rounding
        arc=0pt,                                    % No inner corner rounding
        colframe=colordef!20,                       % Frame color (lighter shade of 'colordef')
        colback=white,                              % Background color set to white
        attach boxed title to top left,             % Attach the title to the top-left corner
        boxed title style={                         % Style for the boxed title
            colback=colordef!50,                    % Title background color (medium shade of 'colordef')
            outer arc=0pt,                          % No outer corner rounding for title
            arc=0pt,                                % No inner corner rounding for title
            boxrule=0pt,                            % No border for title box
        },
        boxrule=0pt,                                % No border for the main box
        borderline west = {1.5pt}{0pt}{colordef!50},% Left border line with thickness and color
        borderline south = {1.5pt}{0pt}{colordef!50},% Bottom border line with thickness and color
        left=1mm,                                   % Left padding inside the box
        fontlower=\small,                           % Font size inside the box
        title=\textbf{\textsc{\small \textcolor{black}{Methodological suggestions:}}} % Title text
    }
}{
    \excludecomment{comments}                       % Else, exclude the 'comments' environment
}

%-------------------------------------------------------------------------------
% 10.2 Code Snippet Environment
%-------------------------------------------------------------------------------

\setminted{
    fontsize=\footnotesize,  % Set the font size to footnotesize (or scriptsize)
    linenos=true,            % Show line numbers by default
    breaklines=true,         % Enable line breaking for long lines
    tabsize=4,               % Set default tab size for indentation
    numbersep=8pt,           % Space between line numbers and code
    xleftmargin=8pt          % Left margin for code blocks
}

% Define custom input minted command
\newcommand{\custominputminted}[3][]{%
    \ifstrequal{#2}{python}{\usemintedstyle{tango}}{}% Use 'tango' for Python
    \ifstrequal{#2}{cpp}{\usemintedstyle{manni}}{}   % Use 'manni' for C++
    \inputminted[#1]{#2}{#3}% Call the original inputminted command with optional parameters
}



% Define the codesnippet environment with tcolorbox using listings
\newcounter{codesnippet}[chapter]                   % Define a new counter 'codesnippet', reset every chapter
\renewcommand{\thecodesnippet}{\thechapter.\arabic{codesnippet}} % Define numbering format as Chapter.Number
\newtcolorbox{codesnippet}[1][]{                    % Define 'codesnippet' tcolorbox environment with optional argument
    thetitle=Code Snippet,                          % Set the title to 'Code Snippet'
    counter=codesnippet,                            % Use 'codesnippet' counter
    leftrule=2pt,                                   % Left border thickness
    codesnippetbox={#1},                            % Use 'codesnippetbox' style with optional argument
    colback=gray!3,                                 % Light gray background color for the box
    colframe=gray!80,                               % Border color for the box
    fonttitle=\bfseries                             % Bold title font
}



%===============================================================================
% 11. End of Class File
%===============================================================================

%% Clean-up and finalization

\endinput                                          % End of class file
%%
%% End of file `styles.cls'.
