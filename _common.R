
rm(list = ls(all.names = TRUE))

options(digits = 3,
        dplyr.print_min = 6,
        dplyr.print_max = 6,
        booktabs = TRUE,
        mc.cores = parallel::detectCores())

knitr::opts_chunk$set(
  message = FALSE,
  comment = "#>",
  collapse = TRUE,
  out.width = "70%",
  fig.align = 'center',
  fig.width = 6,
  fig.asp = 0.7,  # 1 / phi
  fig.show = "hold"
)

rstan::rstan_options(auto_write = TRUE)

old <- ggplot2::theme_set(ggthemes::theme_tufte())
