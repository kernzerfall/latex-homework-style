# kernzerfall's LaTeX Theme for Homework

[![made-with-latex](https://img.shields.io/badge/Made%20with-LaTeX-1f425f.svg)](https://www.latex-project.org/)
[![MIT License](https://img.shields.io/github/license/kernzerfall/latex-homework-style)](https://github.com/kernzerfall/latex-homework-style/blob/main/LICENSE)


Because I love LaTeX but I hate having to write the same things every time

## Usage
```latex
\documentclass[a4paper]{scrartcl} % AFAIK my theme only supports `scrartcl`

% Include the theme (you only need the .sty file)
\usepackage[boilerplate, thm, customtitle]{kernzerfall_hw}

% These three are used for \maketitle, make sure to set them
\class{<class name>}
\group{<group name>}
\assignment{<assignment name>}
\titlemisc{<opt - team name>} % optional

% This is used for \makegrouproster, which is optional
% Set it if you want to automatically generate a group table
% If omitted, "working directory/group.csv" will be set as default
\usegroupcsv{group.csv}

% Other options you may want to set
\date{\bettertoday}
```

### Setting the Group Roster

Use `group.csv` (default) or any `.csv` (set path using `\usegroupcsv`)file of the following form:

```csv
name, matrnr
Name1, ID1
Name2, ID2
Name3, ID3
...
```

**Note**: Do NOT touch the first line; the .sty expects to find these exact column names!

## Features

* Automatic setting of `hyperref` options (using `\maketitle`)
* Automatic population of a group roster table using a simple `.csv` file
* `\maketitle` (first page header) style
* Shorthand commands for:
    * ℕ, ℤ, ℝ, ℂ (`\N`, `\Z`, `\R`, `\C`)
    * 𝔄, 𝔅, ℑ, ℜ (`\fA`, `\fB`, `\I`, `\RR`)
    * Complexity/Computability stuff (Classes, States, etc.)
* Print git info (hash+dirty) on the PDF (only LuaTeX!).
### Options
|Option|Description|
|--|--|
|`boilerplate`|Boilerplate|
|`mpro`|Use the Minion Pro typeface (you must have this installed separately)|
|`thm`|Inject presets for theorem environments `definition`, `lemma`, `satz`, `thm`|
|`complexity`|Macros for stuff like complexity classes, etc.|
|`fpmarks`|Includes the `\fpmarks` command (see below)|

### Commands
|Command|Parameters|Description|
|--|--|--|
|`\githash`|none| (Only LuaTeX!) Prints the short git commit hash. |
|`\maketitle`| none| Generates a header using the values of `\class`, `\assignment` and `\group`. Sets the following `hyperref` properties: `pdftitle`, `pdfauthor`, `pdfsubject`.|
|`\makegrouproster`|none| Generates a Group Roster Table using the values found in a `.csv` file.|
|`\usegroupcsv`| path to csv| Overrides the default path for the Group's `.csv`.|
|`\tikzfosap`| none | Injects a TikZ preset for drawing finite automata. (Sets arrows, backgrounds, spaces, etc.).|
|`\codestyle`|none| Injects an lstlistings style for code listings|
|`\sothat`|none|Inserts `\,\,\|\,\,`. Useful for set declarations.|
|`\ds`| 1 | Inserts its argument in double spaces (`\,\,~#1~\,\,`)|
|`\fpmarks`|none| Adds DIN 5008 (Type A) punchhole/fold marks. Needs `scrlayer-scrpage`|


## Package Requirements

These are automatically included via `\RequirePackage`.

* hyperref (with `hidelinks`)
* csvsimple
* bookmark
* iftex

## Boilerplate

These are injected via `\boilerplate`

### Packages

1. Geometry
    * geometry (with `a4paper, top=2cm, left=2cm, right=2cm`)
2. Math symbols
    * amsmath
    * amssymb
    * amsthm
    * mathtools
    * microtype
    * stmaryrd
3. Graphics
    * tikz
    * graphicx
    * pdfpages
4. Fonts/Encoding
    * lmodern
    * luainputenc (with `utf8`)
    * inputenc (with `utf8`)
    * fontenc (with `T1`)
    * babel (with `english, ngerman`)
    * tgpagella (<- the template defaults to this font!)
5. Misc
    * draftwatermark
    * xcolor
    * scrlayer-scrpage
    * cleveref
    * framed

### Colors

```js
 codegreen: rgb(0,      0.6,    0)
  codegray: rgb(0.5,    0.5,    0.5)
codepurple: rgb(0.58,   0,      0.82)
backcolour: rgb(0.95,   0.95,   0.92)
 fosapblue: RGB(0,      128,    255)
 fosappink: RGB(252,    163,    212)
```
