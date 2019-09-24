
---
title: "iris exaple"
output: html_notebook
---

```r
library(ggeffects)
library(tidyverse)
library(broom)
```

intercept surutud nulli, Sepal.Width-i tõus ei sõltu enam Petal.Lenthgist.

```r
m7 <- lm(Sepal.Length~ 0+ Petal.Length+ Petal.Length:Sepal.Width, data = iris)
plot(ggeffect(m7, terms=c("Petal.Length", "Sepal.Width")))
```

<img src="interationiris_files/figure-html/unnamed-chunk-3-1.png" width="672" />


```r
plot(ggeffect(m7, terms=c("Sepal.Width", "Petal.Length")))
```

<img src="interationiris_files/figure-html/unnamed-chunk-4-1.png" width="672" />

intercept surutud nulli. Me eeldame, et ei sepal width-l ega petal lengthil pole iseseisvat mõju y-le. 

```r
m8 <- lm(Sepal.Length~ 0+ Petal.Length:Sepal.Width, data = iris)
plot(ggeffect(m8, terms=c("Petal.Length", "Sepal.Width")))
```

<img src="interationiris_files/figure-html/unnamed-chunk-5-1.png" width="672" />

```r
m8.1 <- lm(Sepal.Length~ 0+ Petal.Length, data = iris)
plot(ggeffect(m8.1, terms=c("Petal.Length")))
```

<img src="interationiris_files/figure-html/unnamed-chunk-6-1.png" width="672" />



```r
plot(ggeffect(m8, terms=c("Sepal.Width", "Petal.Length")))
```

<img src="interationiris_files/figure-html/unnamed-chunk-7-1.png" width="672" />

intercept fititakse, aga kummagil X-muutujal pole iseseisvat mõju y-le

```r
m9 <- lm(Sepal.Length~ 1+ Petal.Length:Sepal.Width, data = iris)
plot(ggeffect(m9, terms=c("Petal.Length", "Sepal.Width")))
```

<img src="interationiris_files/figure-html/unnamed-chunk-8-1.png" width="672" />


```r
plot(ggeffect(m9, terms=c("Sepal.Width", "Petal.Length")))
```

<img src="interationiris_files/figure-html/unnamed-chunk-9-1.png" width="672" />

sepal width-il pole iseseisvat mõju y-le. kogu tema mõju on petal lengthi kaudu.

```r
m10 <- lm(Sepal.Length~ 1+ Petal.Length+ Petal.Length:Sepal.Width, data = iris)
plot(ggeffect(m10, terms=c("Petal.Length", "Sepal.Width")))
```

<img src="interationiris_files/figure-html/unnamed-chunk-10-1.png" width="672" />

```r
plot(ggeffect(m10, terms=c("Sepal.Width", "Petal.Length")))
```

<img src="interationiris_files/figure-html/unnamed-chunk-11-1.png" width="672" />

täismudel.

```r
m11 <- lm(Sepal.Length~ Petal.Length*Sepal.Width, data = iris)
plot(ggeffect(m11, terms=c("Petal.Length", "Sepal.Width")))
```

<img src="interationiris_files/figure-html/unnamed-chunk-12-1.png" width="672" />


```r
plot(ggeffect(m11, terms=c("Sepal.Width", "Petal.Length")))
```

<img src="interationiris_files/figure-html/unnamed-chunk-13-1.png" width="672" />

täismudel

```r
m1 <- lm(Sepal.Length~ Petal.Length*Species, data = iris)
plot(ggeffect(m1, terms=c("Petal.Length", "Species")))
```

<img src="interationiris_files/figure-html/unnamed-chunk-14-1.png" width="672" />


```r
plot(ggeffect(m1, terms=c("Species", "Petal.Length")))
```

<img src="interationiris_files/figure-html/unnamed-chunk-15-1.png" width="672" />

petal length is not allowed to have direct influence on y??? mudel paistab identne täismudeliga.

```r
m2 <- lm(Sepal.Length~ Species + Petal.Length:Species, data = iris)
plot(ggeffect(m2, terms=c("Petal.Length", "Species")))
```

<img src="interationiris_files/figure-html/unnamed-chunk-16-1.png" width="672" />

```r
plot(ggeffect(m2, terms=c("Species", "Petal.Length")))
```

<img src="interationiris_files/figure-html/unnamed-chunk-17-1.png" width="672" />

species ei ole lubatud omama otsest mõju y-le.

```r
m3 <- lm(Sepal.Length~ Petal.Length + Petal.Length:Species, data = iris)
plot(ggeffect(m3, terms=c("Petal.Length", "Species")))
```

<img src="interationiris_files/figure-html/unnamed-chunk-18-1.png" width="672" />


```r
plot(ggeffect(m3, terms=c("Species", "Petal.Length")))
```

<img src="interationiris_files/figure-html/unnamed-chunk-19-1.png" width="672" />


```r
m4 <- lm(Sepal.Length~ Petal.Length:Species, data = iris)
plot(ggeffect(m4, terms=c("Petal.Length", "Species")))
```

<img src="interationiris_files/figure-html/unnamed-chunk-20-1.png" width="672" />


```r
plot(ggeffect(m4, terms=c("Species", "Petal.Length")))
```

<img src="interationiris_files/figure-html/unnamed-chunk-21-1.png" width="672" />



```r
m5 <- lm(Sepal.Length~ 0+ Petal.Length:Species, data = iris)
plot(ggeffect(m5, terms=c("Petal.Length", "Species")))
```

<img src="interationiris_files/figure-html/unnamed-chunk-22-1.png" width="672" />



```r
plot(ggeffect(m5, terms=c("Species", "Petal.Length")))
```

<img src="interationiris_files/figure-html/unnamed-chunk-23-1.png" width="672" />



```r
m6 <- lm(Sepal.Length~ 0+ Petal.Length+ Petal.Length:Species, data = iris)
plot(ggeffect(m6, terms=c("Petal.Length", "Species")))
```

<img src="interationiris_files/figure-html/unnamed-chunk-24-1.png" width="672" />


```r
plot(ggeffect(m6, terms=c("Species", "Petal.Length")))
```

<img src="interationiris_files/figure-html/unnamed-chunk-25-1.png" width="672" />

