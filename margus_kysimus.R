
library(tidyverse)
library(broom)
m3 <- lm(Sepal.Width ~ Sepal.Length * Species, data = iris)
a_m3 <- augment(m3)

#Kõigepealt studentiseeritud residuaalid y-muutja vastu
ggplot(a_m3, aes(Sepal.Width, `.std.resid`)) +
  geom_point(aes(color=Species)) +
  geom_hline(yintercept = 0, lty =2, color ="darkgrey") +
  geom_smooth(method = lm, se=F, color="black", size=0.5)

#Ja nüüd residuaalid x-muutuja vastu.
ggplot(a_m3, aes(Sepal.Length, `.std.resid`, color=Species)) +
  geom_point() +
  geom_hline(yintercept = 0, lty =2, color ="darkgrey")+
  geom_smooth(method = lm, se=F, color="black", size=0.5)

