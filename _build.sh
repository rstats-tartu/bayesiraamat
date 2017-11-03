#!/bin/sh

echo "Testing rstan..."
Rscript -e 'fx <- inline::cxxfunction(signature(x = "integer", y = "numeric") ,
"return ScalarReal(INTEGER(x)[0] * REAL(y)[0]);")'
Rscript -e 'fx(2L, 5)'

echo "Render book"
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
