BASH := /usr/bin/env bash
LATEXMK := latexmk
LATEXMK_FLAGS = -output-directory=output -lualatex -quiet -jobname=bibliography
LATEXMK_CLEAN_FLAGS = $(LATEXMK_FLAGS) -c

all: bibliography.pdf

clean: bibliography.tex
	$(LATEXMK) $(LATEXMK_CLEAN_FLAGS) $<

bibliography.pdf: bibliography.tex format
	$(LATEXMK) $(LATEXMK_FLAGS) $<

format:
	$(BASH) ./format.sh

.PHONY: all clean format
