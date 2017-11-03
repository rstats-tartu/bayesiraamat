
rm(list = ls(all = TRUE))
set.seed(19)

options(digits = 3,
        dplyr.print_min = 6,
        dplyr.print_max = 6)

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

library(ggplot2)
library(ggthemes)
old <- theme_set(theme_tufte())
