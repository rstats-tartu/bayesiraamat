options(digits = 3,
        dplyr.print_min = 6,
        dplyr.print_max = 6,
        booktabs = TRUE,
        mc.cores = parallel::detectCores())

knitr::opts_chunk$set(
  message = FALSE,
  comment = "#>",
  collapse = TRUE
)

rstan::rstan_options(auto_write = TRUE)

library(skimr)
skim_with(numeric = list(hist = NULL), ts = list(line_graph = NULL))
