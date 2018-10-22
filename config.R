dotR <- file.path(Sys.getenv("HOME"), ".R")
if (!file.exists(dotR)) dir.create(dotR)
MAKEVARS <- file.path(dotR, "Makevars")
if (!file.exists(MAKEVARS)) file.create(MAKEVARS)

cat(
  "\nCXX14FLAGS=-O3 -mtune=native -march=native -Wno-unused-variable -Wno-unused-function",
  "CXX14 = g++", # could also you clang++ but your compiler may have a version number postfix
  file = MAKEVARS, 
  sep = "\n", 
  append = TRUE
)
