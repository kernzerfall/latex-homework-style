# kernzerfall's LaTeX Theme for Homework

[![made-with-latex](https://img.shields.io/badge/Made%20with-LaTeX-1f425f.svg)](https://www.latex-project.org/)
[![MIT License](https://img.shields.io/github/license/kernzerfall/latex-homework-style)](https://github.com/kernzerfall/latex-homework-style/blob/main/LICENSE)


Because I love LaTeX but I hate having to write the same things every time

## Usage
```latex
\documentclass[a4paper]{scrartcl} % AFAIK my theme only supports `scrartcl`

% These three are used for \maketitle, make sure to set them
\class{<class name>}
\group{<group name>}
\assignment{<assignment name>}
\team{<opt - team name>} % optional

% This is used for \makegrouproster, which is optional
% Set it if you want to automatically generate a group table
% If omitted, "working directory/group.csv" will be set as default
\usegroupcsv{group.csv}

% Other options you may want to set
\date{\today}

% Include the theme (you only need the .sty file)
% Do this *last*
\usepackage{kernzerfall_hw}
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
* Shorthand commands for ℕ, ℤ, ℝ, ℂ (`\N`, `\Z`, `\R`, `\C`)  

### Commands
|Command|Parameters|Description|
|--|--|--|
|`\maketitle`| none| Generates a header using the values of `\class`, `\assignment` and `\group`. Sets the following `hyperref` properties: `pdftitle`, `pdfauthor`, `pdfsubject`.|
|`\makegrouproster`|none| Generates a Group Roster Table using the values found in a `.csv` file.|
|`\usegroupcsv`| path to csv| Overrides the default path for the Group's `.csv`.|
|`\tikzfosap`| none | Injects a TikZ preset for drawing finite automata. (Sets arrows, backgrounds, spaces, etc.).|
|`\codestyle`|none| Injects an lstlistings style for code listings|
|`\sothat`|none|Inserts `\,\,\|\,\,`. Useful for set declarations.|
|`\ds`| 1 | Inserts its argument in double spaces (`\,\,~#1~\,\,`)|


## Notice

I intentionally abused `RequiresPackage` statements in my .sty to keep the boilerplate light. If something breaks or you need to modify an included package look there.

**Included Packages**

1. Actual requirements
    * hyperref
    * csvsimple
    * bookmark
2. Geometry
    * geometry (with `a4paper, top=2cm, left=2cm, right=2cm`)
3. Math symbols
    * amsmath
    * amssymb
    * mathtools
    * microtype
    * stmaryrd
4. Graphics
    * tikz
    * graphicx
    * pdfpages
5. Fonts/Encoding
    * lmodern
    * inputenc (with `utf8`)
    * fontenc (with `T1`)