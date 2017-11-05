#!/bin/sh

echo "Render book"

Rscript -e "bookdown::render_book('index.Rmd')"
