#!/bin/sh

Rscript -e "fx <- inline::cxxfunction( signature(x = "integer", y = "numeric" ) , '
	return ScalarReal( INTEGER(x)[0] * REAL(y)[0] ) ;
' )
fx( 2L, 5 ) # should be 10"

Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
