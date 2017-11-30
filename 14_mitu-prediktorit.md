

# Mitme prediktoriga lineaarne regressioon


```r
library(tidyverse)
library(gapminder)
library(rethinking)
```

Vaatame jälle gapminderi andmeid aastast 2007. 
Meil on võimalik lisada regressioonivõrrandisse lisaprediktoreid. 
Nüüd ei küsi me enam, kuidas mõjutab l_GDP varieeruvus keskmise eluea varieeruvust vaid: kuidas mõjutavad muutujad l_GDP, continent ja logaritm pop-ist (rahvaarvust) keskmist eluiga. 
Me modelleerime selle lineaarselt nii, et eeldusena varieeruvad need x-i muutujad üksteisest sõltumatult: $y = a + b_1x_1 + b_2x_2 + b_3x_3$


```r
g2007 <- gapminder %>% 
  filter(year == 2007)
g2007 <- g2007 %>% 
  mutate(l_GDP = log10(gdpPercap),
         l_pop = log10(pop), 
         lpop_s = (l_pop - mean(l_pop )) / sd(l_pop),
         lGDP_s = (l_GDP - mean(l_GDP )) / sd(l_GDP)) %>% 
  as.data.frame()
```

Sellise mudeli tõlgendus on suhteliselt lihtne: 

> koef b1 ütleb meile, 
      kui mitme ühiku võrra tõuseb/langeb muutuja y (eluiga) 
      kui muutuja x1 (l_GDP) tõuseb 1 ühiku võrra; 
      tingimusel, et me hoiame kõigi teiste muutujate väärtused konstantsed. 
      
      
Sarnane definitsioon kehtib ka kõigi teiste prediktorite (x-de) kohta.

Kui meil on mudelis SKP ja pop, siis saame küsida 

1) kui me juba teame SKP-d, millist ennustuslikku lisaväärtust annab meile ka populatsiooni suuruse teadmine? ja

2) kui me juba teame populatsiooni suurust, millist lisaväärtust annab meile ka SKP teadmine?

Järgenval mudelil on 4 parameetrit (intercept + 3 betat).


```r
m1 <- lm(lifeExp ~ l_GDP + continent + l_pop, data = g2007)
summary(m1)
#> 
#> Call:
#> lm(formula = lifeExp ~ l_GDP + continent + l_pop, data = g2007)
#> 
#> Residuals:
#>     Min      1Q  Median      3Q     Max 
#> -19.425  -2.246  -0.014   2.468  14.957 
#> 
#> Coefficients:
#>                   Estimate Std. Error t value Pr(>|t|)    
#> (Intercept)        19.4182     7.4557    2.60   0.0102 *  
#> l_GDP              10.6876     1.2378    8.63  1.5e-14 ***
#> continentAmericas  11.6564     1.6929    6.89  2.0e-10 ***
#> continentAsia      10.0521     1.5776    6.37  2.7e-09 ***
#> continentEurope    11.2320     1.9265    5.83  3.9e-08 ***
#> continentOceania   12.8918     4.5493    2.83   0.0053 ** 
#> l_pop               0.0928     0.8076    0.11   0.9087    
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 5.95 on 135 degrees of freedom
#> Multiple R-squared:  0.767,	Adjusted R-squared:  0.757 
#> F-statistic: 74.2 on 6 and 135 DF,  p-value: <2e-16
```

loeme mudelis "+" märki nagu "või". Ehk, "eluiga võib olla funktsioon SKP-st **või** rahvaarvust".

Intercept 19 ei tähenda tõlgenduslikult midagi. l-GDP tõus ühiku võrra tõstab eluiga 10.7 aasta võrra. 

Võrdluseks lihtne mudel

```r
m2 <- lm(lifeExp ~ l_GDP, data = g2007)
summary(m2)
#> 
#> Call:
#> lm(formula = lifeExp ~ l_GDP, data = g2007)
#> 
#> Residuals:
#>    Min     1Q Median     3Q    Max 
#> -25.95  -2.66   1.22   4.47  13.12 
#> 
#> Coefficients:
#>             Estimate Std. Error t value Pr(>|t|)    
#> (Intercept)     4.95       3.86    1.28      0.2    
#> l_GDP          16.59       1.02   16.28   <2e-16 ***
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 7.12 on 140 degrees of freedom
#> Multiple R-squared:  0.654,	Adjusted R-squared:  0.652 
#> F-statistic:  265 on 1 and 140 DF,  p-value: <2e-16
```

Siin on l_GDP mõju suurem, 16.6 aastat. Millisel mudelil on siis õigus? Proovime veel ülejäänud variendid


```r
m3 <- lm(lifeExp ~ l_GDP + continent, data = g2007)
summary( m3 )
#> 
#> Call:
#> lm(formula = lifeExp ~ l_GDP + continent, data = g2007)
#> 
#> Residuals:
#>     Min      1Q  Median      3Q     Max 
#> -19.492  -2.315  -0.043   2.550  14.882 
#> 
#> Coefficients:
#>                   Estimate Std. Error t value Pr(>|t|)    
#> (Intercept)          20.14       4.03    4.99  1.8e-06 ***
#> l_GDP                10.66       1.21    8.78  6.1e-15 ***
#> continentAmericas    11.69       1.65    7.07  7.5e-11 ***
#> continentAsia        10.11       1.48    6.85  2.3e-10 ***
#> continentEurope      11.27       1.89    5.95  2.1e-08 ***
#> continentOceania     12.93       4.52    2.86   0.0049 ** 
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 5.93 on 136 degrees of freedom
#> Multiple R-squared:  0.767,	Adjusted R-squared:  0.759 
#> F-statistic: 89.7 on 5 and 136 DF,  p-value: <2e-16

m4 <- lm(lifeExp ~ l_GDP + l_pop, data = g2007)
AIC(m1, m2, m3, m4)
#>    df AIC
#> m1  8 918
#> m2  3 965
#> m3  7 916
#> m4  4 962
```

Võitja mudel on hoopis m3, mis võtab arvesse kontinendi. Siin on l_GDP mõju samuti 10.7 aastat. Lisaks näeme, et kui riik ei asu Aafrikas, siis on l_GDP mõju elueale u 11 aasta võrra suurem. Seega elu Aafrika kisub alla keskmise eluea riigi rikkusest sõltumata. Võib olla on põhjuseks sõjad, võib-olla AIDS ja malaaria, võib-olla midagi muud. 

Millise mudeli me peaksime siis avaldama? Vastus on, et need kõik on olulised, et vastata küsimusele, millised faktorid kontrollivad keskmist eluiga? Mudelite võrdlusest näeme, et rahvaarvu mõju elueale on väike või olematu ning et SKP mõju avaldub log skaalas (viitab teatud tüüpi eksponentsiaalsetele protsessidele, kus rikkus tekitab uut rikkust) ning, et Aafrikaga on midagi pahasti ja teistmoodi kui teiste kontinentidega. Aafrikast tasub otsida midagi, mida meie senised mudelid ei kajasta.

Miks ei ole mudeli summary tabelis Aafrikat? Põhjus on tehniline. Kategoorilisi muutujaid, nagu kontinent, vaatab mudel paariviisilises võrdluses, mis tähendab et k erineva tasemega muutujast tekitatakse k - 1 uut muutujat, millest igaühel on kaks taset (0 ja 1). See algne muutuja, mis üle jääb (antud juhul Africa), jääb ilma oma uue muutujata. Me saame teisi uusi kontinendi põhjal tehtud muutujaid tõlgendada selle järgi, kui palju nad erinevad Africa-st.

## Miks multivariaatsed mudelid head on? {-}

1) nad aitavad kontrollida "confounding" muutujaid. 
Confounding muutuja võib olla korreleeritud mõne teise muutujaga, mis meile huvi pakub. 
See võib nii maskeerida signaali, kui tekitada võlts-signaali, kuni y ja x1 seose suuna muutmiseni välja.

2) ühel tagajärjel võib olla mitu põhjust.

3) Isegi kui muutujad ei ole omavahel üldse korreleeritud, võib ühe tähtsus sõltuda teise väärtusest. Näiteks taimed vajavad nii valgust kui vett. Aga kui ühte ei ole, siis pole ka teisel suurt tähtsust.

## Mudeldamine standardiseeritud andmetega {-}

Kui me lahutame igast andmepunktist selle muutuja keskväärtuse siis saame 0-le tsentreeritud andmed. Kui me sellisel viisil saadud väärtused omakorda läbi jagame muutuja standardhälbega, siis saame standardiseeritud andmed, mille keskväärtus on null ja SD = 1.

$Standard.andmed = (x - mean(x))/sd(x)$ 

Nii on lihtsam erinevas skaalas muutujaid omavahel võrrelda (1 ühikuline muutus võrdub alati muutusega 1 standardhäve võrra) ja mudeli arvutamine üle mcmc ahelate on ka lihtsam.


```r
m5 <- map2stan(
    alist(
        lifeExp ~ dnorm( mu , sigma ) ,
        mu <- a + b_GDP * lGDP_s + b_pop * lpop_s ,
        a ~ dnorm( 0 , 10 ) ,
        c(b_GDP, b_pop) ~ dnorm( 0 , 1 ) ,
        sigma ~ dunif( 0 , 10 )
), data = g2007 )
```






```r
precis(m5)
#>        Mean StdDev lower 0.89 upper 0.89 n_eff Rhat
#> a     66.74   0.64      65.77      67.79  1000    1
#> b_GDP  6.95   0.58       6.06       7.84   775    1
#> b_pop  0.80   0.55      -0.11       1.58   870    1
#> sigma  7.64   0.50       6.82       8.40   876    1
```

kui l_GDP kasvab 1 sd võrra, siis eluiga kasvab 6.9 aasta võrra. 


```r
f1 <- glimmer(lifeExp ~ lGDP_s + lpop_s + continent, data = g2007)
#> alist(
#>     lifeExp ~ dnorm( mu , sigma ),
#>     mu <- Intercept +
#>         b_lGDP_s*lGDP_s +
#>         b_lpop_s*lpop_s +
#>         b_continentAmericas*continentAmericas +
#>         b_continentAsia*continentAsia +
#>         b_continentEurope*continentEurope +
#>         b_continentOceania*continentOceania,
#>     Intercept ~ dnorm(0,10),
#>     b_lGDP_s ~ dnorm(0,10),
#>     b_lpop_s ~ dnorm(0,10),
#>     b_continentAmericas ~ dnorm(0,10),
#>     b_continentAsia ~ dnorm(0,10),
#>     b_continentEurope ~ dnorm(0,10),
#>     b_continentOceania ~ dnorm(0,10),
#>     sigma ~ dcauchy(0,2)
#> )
```
See on mudeli struktuur, mis sisaldab uusi kategoorilisi muutujaid

Siin on tähtis anda map2stan()-le ette glimmeri poolt eeltöödeldud andmed:

```r
m6 <- map2stan(
  f1$f, 
  data = f1$d)
```






```r
precis(m6)
#>                      Mean StdDev lower 0.89 upper 0.89 n_eff Rhat
#> Intercept           59.92   0.97      58.31      61.42   344    1
#> b_lGDP_s             6.29   0.68       5.20       7.31   450    1
#> b_lpop_s             0.06   0.50      -0.75       0.79  1000    1
#> b_continentAmericas 11.66   1.53       9.07      13.94   436    1
#> b_continentAsia     10.11   1.47       7.87      12.51   428    1
#> b_continentEurope   11.26   1.83       8.50      14.26   434    1
#> b_continentOceania  11.18   4.00       4.87      17.50   784    1
#> sigma                5.95   0.36       5.38       6.49   931    1
```

