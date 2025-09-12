#!/usr/bin/env bash

set -e

LATEXINDENT=latexindent
LATEXINDENT_FLAGS="-s -l -wd"
TARGET_TEX=$(find ./ -type f -name "*.tex")
$LATEXINDENT $LATEXINDENT_FLAGS $TARGET_TEX

BIBTEXTIDY=bibtex-tidy
BIBTEXTIDY_FLAGS="--modify --omit=abstract,shortjournal,file,keywords,language,langid,note,pagetotal,month,rights,urldate --curly --numeric --no-align --sort=key --duplicates=key,doi --strip-enclosing-braces --drop-all-caps --no-escape --sort-fields=doi,isbn,author,editor,translator,year,date,title,shorttitle,edition,journal,journaltitle,issn,booktitle,series,pages,publisher,location,address,volume,number,url --strip-comments --trailing-commas --remove-empty-fields --wrap=79"
TARGET_BIB=$(find ./ -type f -name "*.bib")
$BIBTEXTIDY $BIBTEXTIDY_FLAGS $TARGET_BIB
