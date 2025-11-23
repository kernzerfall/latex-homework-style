# kernzerfall's LaTeX Theme for Homework

[![made-with-latex](https://img.shields.io/badge/Made%20with-LaTeX-1f425f.svg)](https://www.latex-project.org/)
[![MIT License](https://img.shields.io/github/license/kernzerfall/latex-homework-style)](https://github.com/kernzerfall/latex-homework-style/blob/main/LICENSE)

A robust, modular LaTeX template designed for math & theoretical computer science homework, 
providing boilerplate automation, theorem environments, and domain-specific macros for complexity theory, 
logic, automata, and Markov chains. The preset tries to adhere to classical typography rules as much as possible.

## Installation & Setup

1.  **Download:** Get `kernzerfall_hw.sty` and place it in your project directory (or your local texmf tree).
2.  **Basic Usage:** Import the package in your document preamble.
   ```latex
   \documentclass[a4paper]{scrartcl} % Recommended class
   
   % Load the package with desired modules
   \usepackage[boilerplate, thm, customtitle, complexity, layers]{kernzerfall_hw}
   
   % --- Configuration ---
   \class{Computability \& Complexity}
   \semester[WS25]{Winter Semester 2025}
   \assignment{Assignment 1}
   \titlemisc{Team: Alan Turing} % Optional extra info
   
   % --- Group Roster ---
   % Optional: Point to your group CSV (defaults to "group.csv")
   \usegroupcsv{my_group.csv}
   
   \begin{document}
       \maketitle      % Generates the custom header
       \makegrouproster % Generates the team table from CSV
       
       \exercise{1}
       \begin{definition}[Turing Machine]
           A deterministic Turing Machine is a tuple $\mathcal T = (Q, \Sigma, \Gamma, \delta, q_0, \qacc, \qrej})$.
       \end{definition}
       
       \subexercise{a}
       Prove that $\classNP \subseteq \classPpoly$.
   \end{document}
   ```
3. Compile using the included `.latexmkrc` (change the filename in `@default_files`), or e.g. via
   `lualatex --shell-escape --interaction=nonstopmode -output-directory=build -jobname=output your_file_name.tex`

## Package Options

Load these options via `\usepackage[option1, option2]{kernzerfall_hw}`.

### Core & Layout

| Option | Description |
| :--- | :--- |
| `boilerplate` | **(Recommended)** Loads essential packages (`geometry`, `babel`, `tikz`, `hyperref`, `amsmath`, `mathtools`, etc.) and sets standard formatting (margins, headers). |
| `customtitle` | Redefines `\maketitle` to use the specialized `\class`, `\semester`, and `\assignment` commands. |
| `german` | Sets `babel` to `ngerman` and localizes table headers (e.g., "Vorname" instead of "First Name"). Default is English. |
| `minionpro` | Configures the `MinionPro` font and `LinuxBiolinum` for sans-serif. *Note: Requires valid font files installed.* |
| `layers` | Adds a footer containing the matriculation numbers from your group CSV to every page. Helpful if the PDF is supposed to be printed/stapled together. |
| `fpmarks` | Adds DIN 5008 (Type A) fold and punch marks to the left margin. |
| `git` | **(LuaTeX only)** Enables git integration, exposing `\githash` and `\dirty` commands. |

### Modules

| Option | Description |
| :--- | :--- |
| `thm` | Loads `ntheorem` and pre-defines a suite of environments (Theorem, Lemma, Proof, etc.). Implies `boilerplate`. |
| `thmsectnum` | Changes theorem numbering to be section-based (e.g., "Definition 1.1") rather than global. |
| `complexity` | Defines shorthands for complexity classes (`\classP`, `\classNP`) and Turing machine notation. |
| `markov` | Defines macros and TikZ styles for Markov Chains (DTMC) and decision processes. |

## Metadata Commands

Set these in your preamble to configure the document headers and PDF metadata. They
are *explicitly* used by `\maketitle` (feature: `customtitle`) and `\makegrouproster`.

  * `\class{<Name>}`: The name of the course (e.g., "Algorithmic Logic").
  * `\semester[<Short>]{<Long>}`: The semester. The optional short argument is used in headers.
      * *Example:* `\semester[SS 24]{Summer Semester 2024}`
  * `\assignment{<Name>}`: The title of the current task (e.g., "Homework Sheet 3").
  * `\titlemisc{<Text>}`: Free-form text appearing in the header, often used for team names.
  * `\usegroupcsv{<path>}`: Overrides the default `group.csv` path for roster generation.

## Typography & Fonts

The package automatically configures fonts based on your LaTeX engine and options.

### Default Behavior

  * **LuaTeX:** Uses `libertinus` (Libertine) with `unicode-math`. Monospace is set to `Inconsolata`.
  * **PDFLaTeX:** Uses `newpxtext` and `newpxmath` (Palatino-like) with Old Style Figures (`osf`).

PDFLaTeX is mostly just included for completeness, I generally don't use it, and it may have buggy
behaviour on the template.

### Minion Pro Option (`minionpro`)

If the `minionpro` option is passed, the package overrides defaults to use the Adobe Minion Pro typeface. 

**Note:** This requires the `MinionPro` package and font files to be installed on your system (see [sebschub/FontPro](https://github.com/sebschub/FontPro)).
The fontface itself needs to be licenced from Adobe!

  * **Serif:** Minion Pro (with swash, lining figures in math).
  * **Sans-Serif:** Linux Biolinum (Scale adjusted to match Minion).
  * **Monospace:** Inconsolata (Scale 0.95).
  * **Math:** Minion Pro + MnSymbol.

## Pre-loaded Packages

When `boilerplate` is enabled, the following configuration is applied.

### Layout & Page Structure

  * **`geometry`**: Configured for A4 paper with `top=2cm`, `left=2cm`, `right=2cm`, `bottom=2.5cm`.
  * **`scrlayer-scrpage`**: Manages headers and footers. Generally incompatible with `fancyhdr`.
  * **`draftwatermark`**: Loaded but disabled by default (`scale=0`).

### Mathematics & Logic

  * **`amsmath`, `mathtools`**: The standard math suite.
  * **`stmaryrd`**: "St. Mary's Road" symbol font (provides brackets like `\llbracket`).
  * **`microtype`**: Improves justification and spacing.
  * **`csquotes`**: Context-sensitive quotes (adapts to English/German).

### Graphics

  * **`tikz`**: Includes libraries `automata`, `shapes.arrows`, `positioning`, `shapes.geometric`.
  * **`pgfplots`**: For plotting data.
  * **`subcaption`**: For sub-figures.
  * **`graphicx`, `pdfpages`**: For including external images and PDFs.

### Utilities

  * **`hyperref`**: Loaded with `hidelinks` to prevent red boxes around links.
  * **`bookmark`**: Improved PDF bookmarks.
  * **`cleveref`**: Loaded with `[capitalize]`. Use `\cref{}` to automatically print "Theorem 1" instead of just "1".
  * **`xcolor`**: Defines custom utility colors (`codegreen`, `codegray`, `codepurple`, `fosapblue`, `fosappink`) and a softer, less harsh CMYK palette for general use:
      * `kzfl-blue`, `kzfl-black`, `kzfl-magenta`, `kzfl-yellow`
      * `kzfl-petrol`, `kzfl-turquoise`, `kzfl-green`, `kzfl-maygreen`
      * `kzfl-orange`, `kzfl-red`, `kzfl-bordeaux`
      * `kzfl-violet`, `kzfl-purple`, `kzfl-silver`, `kzfl-gold`

## Features in Detail

**Note:** This is an *incomplete* list. Look in the `.sty` to see everything that is defined.

### 1\. Group Roster Automation

Generate a standardized team table automatically using `\makegrouproster`. This requires a `.csv` file in your directory.

**CSV Format (do NOT change the header!):**

```csv
name, matrnr
Alan Turing, 135790
Noam Chomsky, 123456
```

  * **English mode:** Headers are "First, Last Name" and "ID".
  * **German mode:** Headers are "Vor-, Nachname" and "Matr.-Nr.".
  * **Layer Integration:** If the `layers` option is enabled, the `matrnr` column is read and displayed in the footer of every page.

### 2\. Theorem Environments (Option `thm`)

The package uses `ntheorem` to provide stylized environments.

  * **Primary:** `definition`, `thm` (Theorem), `lemma`, `satz`, `kor` (Corollary), `prop` (Proposition).
  * **Structure:** `proof` (ends with $\square$), `subproof` (ends with $\lrcorner$), `claim`, `example`.
  * **Auto-referencing:** `cleveref` is pre-configured. Use `\cref{label}` for smart references (e.g., "Theorem 2").

### 3\. Complexity Theory (Option `complexity`)

Simplifies writing rigorous complexity proofs.

**Classes:**

  * `\classP`, `\classNP`
  * `\classEXP`, `\classNEXP`, `\classEXPTIME`
  * `\classPH` (Polynomial Hierarchy)
  * `\classPpoly` ($\mathsf{P/poly}$)
  * `\classPHsigma{i}` ($\Sigma^p_i$), `\classPHpi{i}` ($\Pi^p_i$)
  * `\coclass{C}` (generic co-C)

**Turing Machines:**

  * **Alphabet:** `\sast` ($\Sigma^\ast$), `\gast` ($\Gamma^\ast$)
  * **Symbols:** `\blk` ($\square$, blank), `\mend` ($\triangleright$, left marker)
  * **States:** `\qacc` ($q_+$), `\qrej` ($q_-$), `\qinit` ($q_{init}$)
  * **Relations:** `\expath` ($\stackrel{*}{\to}$)

### 4\. Logic & Sets (Standard)

These macros are available by default or with `boilerplate`.

**Standard Sets:**

  * `\N`, `\Z`, `\Q`, `\R`, `\C` (Blackboard bold)
  * `\fA`, `\fB`, `\I`, `\R` (Fraktur for structures/interpretations)

**LTL & Modal Logic:**

  * `\lnext` ($\circ$), `\levent` ($\lozenge$), `\lglob` ($\square$)
  * `\lu` ($\mathsf{U}$, Until), `\lr` ($\mathsf{R}$, Release)
  * `\luint{a}{b}` ($\mathsf{U}^{[a,b]}$, Interval Until)
  * `\ltrue`, `\lfalse`

**Operators:**

  * `\xor` ($\oplus$), `\impl` ($\rightarrow$)
  * `\bij` (Bijective arrow), `\inj` (Injective hook)
  * `\iff`, `\implies` are standard, but `\sothat` inserts `\,\,\|\,\,` for set builders.

### 5\. Automata & Graphs

  * **`\tikzfosap`**: A TikZ preset for drawing finite automata. Sets specific arrow styles (`stealth`), node distances, and state styles (`fill=gray!10`).
  * **`\tikzdtmc`** (requires `markov`): A preset for Discrete Time Markov Chains with standard edge/loop styles.
  * **`\paths`**: Macro for path sets ($\mathsf{Paths}$).
  * **`\post`**, `\postast`: Macros for successor sets ($\mathsf{Post}$, $\mathsf{Post}^*$).

### 6\. Code Listings

  * **`\codestyle`**: Configures `lstlistings` with a "Solarized-lite" color scheme (green comments, purple strings) and line numbers.

### 7\. Git Integration (Option `git`)

This feature injects the current git commit hash and status into your document.

**Requirements:**

  * **Option:** You must load the package with `\usepackage[git]{kernzerfall_hw}`.
  * **Engine:** LuaTeX is **required** (it uses `directlua` to execute shell commands).
  * **Flags:** You must compile with `--shell-escape` (e.g., `lualatex --shell-escape main.tex`).

**Commands:**

  * **`\githash`**: Prints the short hash of the current commit.
  * **`\dirty`**: Returns "1" if the working directory has uncommitted changes, "0" otherwise.

## Lua Utilities

The repository includes helper scripts in `lua-utils/` to automate workflow tasks. These require **LuaTeX**.

### Auto-Include (`autoinclude.lua`)

Scans a `content/` subdirectory and automatically inputs all `.tex` files in alphabetical order.

**Usage:**

```latex
\directlua{dofile('lua-utils/autoinclude.lua')}
```

### Selective Source Printing (`selprc.lua`)

Extracts and prints specific exercises from external code files into a `minted` environment.
The reference implementation is for Haskell.

**Usage:**

1.  In your source code file, mark regions with `{---- exercise <ID> ----}` and `{---- /exercise <ID> ----}`.
2.  In LaTeX:
```latex
% In the preamble-only once!
\directlua{dofile('lua-utils/selprc.lua')}

% Wherever you want to input the code:
% Prints content from 'src/Main.hs' marked for exercise '1a'
\directlua{printMinted('src/Main.hs', '1a')}
```

## License

MIT License. See [LICENSE](https://github.com/kernzerfall/latex-homework-style/blob/main/LICENSE) for details.
