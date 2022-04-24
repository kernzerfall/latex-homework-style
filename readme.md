# kernzerfall's LaTeX Theme for Homework

[![made-with-latex](https://img.shields.io/badge/Made%20with-LaTeX-1f425f.svg)](https://www.latex-project.org/)
[![MIT License](https://img.shields.io/github/license/kernzerfall/latex-homework-style)](https://github.com/kernzerfall/latex-homework-style/blob/main/LICENSE)


Because I love LaTeX but I hate having to write the same things every time

## Usage
```latex
\documentclass[a4paper]{scrartcl} % AFAIK my theme only supports `scrartcl`

% Layout & Encoding
\usepackage[
    a4paper, 
    top=2cm, 
    left=2cm, 
    right=2cm]{geometry}        % Standard geometry options (probably not required)
\usepackage{bookmark}           % Required by scrartcl
\usepackage[T1]{fontenc}        % Font encoding (probably not required, but recommended)
\usepackage[utf8]{inputenc}     % Use UTF-8 (not required, but recommended)
\usepackage{lmodern}            % Pretty fonts (not required)
\usepackage{hyperref}           % Sets metadata on PDF (required!)

% These three are used for \maketitle, make sure to set them
\class{<class name>}
\group{<group name>}
\assignment{<assignment name>}

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

### Commands
|Command|Parameters|Description|
|--|--|--|
|`\maketitle`| none| Generates a header using the values of `\class`, `\assignment` and `\group`. Sets the following `hyperref` properties: `pdftitle`, `pdfauthor`, `pdfsubject`.|
|`\makegrouproster`|none| Generates a Group Roster Table using the values found in a `.csv` file.|
|`\usegroupcsv`| `path to csv`| Overrides the default path for the Group's `.csv`.|
|`\sothat`|none|Inserts `\,\,\|\,\,`. Useful for set declarations.|