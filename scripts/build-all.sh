#!/usr/bin/env bash
# Autocompile all latex subprojects based on .latexmkrc files

# Everything is done relative to the location of the script
# so that it can be called from any working directory and
# have the wanted effect.
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PROJ_ROOT="${SCRIPT_DIR}/.."


while getopts csnz: opt; do
    case $opt in
        c) # Do latexmk -C before compiling
            LATEXMK_CLEAN=1;;
        z) # .tar.gz all PDFs together in $OPTARG
            COLLECT_PDFs=1
            TARXZ=1
            TARXZ_FILE="$OPTARG";;
        s) # Collect all pdfs in the current working directory
            COLLECT_PDFs=1;;
        n) # Do not compile/clean (e.g. just collect pdfs)
            NO_LATEXMK=1;;
    esac
done

# Discover .latexmkrc file from $PROJ_ROOT
pushd "$PROJ_ROOT"
readarray -d '' latexmkrc_files < <(find . -type f -name ".latexmkrc" -print0)
popd

printf "\x1b[32m INFO \x1b[0mFound ${#latexmkrc_files[@]} latexmkrc files.\n"

if [[ $NO_LATEXMK -ne 1 ]]; then
    for lmkrc in "${latexmkrc_files[@]}"; do
        dn=$(dirname "$lmkrc")

        # Skip top-level directory latexmkrc as it's just a template
        if [[ "$dn" == "." ]]; then
            continue
        fi

        printf "\x1b[32m INFO \x1b[0mCompiling project in $dn.\n"
        printf "\x1b[32m INFO \x1b[0mLatexmk options \x1b[33m$LATEX_OPTS\x1b[0m.\n"

        # Go into projects subdirectory
        pushd "$PROJ_ROOT/$dn"

        # Clean build if requested
        if [[ $LATEXMK_CLEAN -eq 1 ]]; then
            latexmk -C
        fi

        # Build command
        latexmk

        # Go back
        popd

        if [[ $? -ne 0 ]]; then
            printf "\x1b[31m ERROR\x1b[0m latexmk failed with code $?\n"
            exit $?
        fi
    done
fi

if [[ $COLLECT_PDFs -ne 1 ]]; then
    printf "\x1b[32m INFO\x1b[0m Done.\n"
    exit 0
else
    printf "\x1b[32m INFO\x1b[0m Collecting PDFs.\n"
fi

# Discover PDFs from PROJ_ROOT
pushd "$PROJ_ROOT"
readarray -d '' pdf_files < <(find . -type f -name '*.pdf' -print0)
popd

printf "\x1b[32m INFO \x1b[0mFound ${#pdf_files[@]} PDF files.\n"

# Collect everything
# filenames will hold everything in case TARXZ=1
declare -a filenames
for pdf in "${pdf_files[@]}"; do
    printf "\x1b[32m INFO \x1b[0mCollecting $pdf\n"
    filename=$(echo $pdf | sed -e 's/^.*\///g')

    # add git hash to filename
    filename="${filename/.pdf/}.$(git rev-parse --short HEAD).pdf"

    # don't overwrite anything!
    # just keep appending unix time until we get an unused filename
    while [[ -f "$filename" ]]; do
        printf "\x1b[34m WARN \x1b[0m$filename already exists\n"
        # add unix time with nanoseconds to filename and hope it doesn't collide
        filename="${filename/.pdf/}.$(date '+%s%N').pdf"
    done

    cp "$PROJ_ROOT/$pdf" "./$filename"

    if [[ $? -ne 0 ]]; then
        printf "\x1b[31m ERROR\x1b[0m cp failed with code $?\n"
        exit $?
    fi

    filenames+=("$filename")
done

if [[ $TARXZ -ne 1 ]]; then
    printf "\x1b[32m INFO\x1b[0m Done.\n"
    exit 0
else
    printf "\x1b[32m INFO\x1b[0m Compressing PDFs into $TARXZ_FILE.\n"
fi

# TARXZ_FILE will be _OVERWRITTEN_
tar -h -c -I 'xz -9e -T0 --memory=8GB' -v -f "$TARXZ_FILE" --files-from <(printf "%s\n" "${filenames[@]}")

if [[ $? -ne 0 ]]; then
    printf "\x1b[31m ERROR\x1b[0m tar failed with code $?\n"
    exit $?
else
    printf "\x1b[32m INFO\x1b[0m Done.\n"
    exit 0
fi
