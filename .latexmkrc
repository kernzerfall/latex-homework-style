# Example .latexmkrc file. Fill in as needed.

# Use LuaTeX Mode
$pdf_mode = 4;
$postscript_mode = $dvi_mode = 0;

# Set live previewer for -pvc
$pdf_previewer = "sioyek";

# Misc options
$warnings_as_errors = 0;
$show_time = 1;
$bibtex_use = 1;
$biber = "biber --validate-datamodel --isbn-normalise %O %S";
set_tex_cmds("--shell-escape --synctex=1 --interaction=nonstopmode %O %S");

# Build in a separate directory to keep things clean.
# Aux is needed for minted and some tikz-related packages.
$out_dir = "build/";
$aux_dir = "build/";

# Output pdf name
$jobname = "output;

# Main file name
@default_files = ('main.tex');
