

# EDA --- eksploratoorne andmeanalüüs


```r
library(tidyverse)
library(corrgram)
```


Kui ühenumbriline andmete summeerimine täidab eelkõige kokkuvõtliku kommunikatsiooni eesmärki, siis EDA on suunatud teadlasele endale. EDA eesmärk on andmeid eelkõige graafiliselt vaadata, et saada aimu 1) andmete kvaliteedist ja 2) lasta andmetel kõneleda "sellisena nagu nad on" ja sugereerida uudseid teaduslikke hüpoteese. Neid hüpoteese peaks siis testima formaalse statistilise analüüsi abil (ptk järeldav statistika). Näiteid erinevate graafiliste lahenduste kohta vt graafika peatükist.

> EDA: mida rohkem graafikuid, seda rohkem võimalusi uute mõtete tekkeks!

EDA on rohkem kunst kui teadus selles mõttes, et teil on suur vabadus küsida selle abil erinevaid küsimusi oma andmete kohta. Ja seda nii tehnilisest aspektist lähtuvalt (milline on minu andmete kvaliteet?), kui teaduslikke küsimusi küsides (kas muutuja A võiks põhjustada muutusi muutujas B?).

Mõned üldised soovitused võib siiski anda.

1. alusta analüüsi tasemest, kus andmed on kõige inforikkamad --- toorandmete plottimisest punktidena. Kui andmehulk ei ole väga massiivne, näitab see hästi nii andmete kvaliteeti, kui ka võimalikke sõltuvussuhteid erinevate muutujate vahel.

Millised korrelatsioonid võiksid andmetes esineda?

(ref:korrmaatriks) Korrelatstioonimaatriks joonisena.


```r
corrgram(iris, 
         order = TRUE, 
         lower.panel = panel.pts,
         upper.panel = panel.ellipse,
         diag.panel = panel.density,
         main = "Correlogram of Iris dataset")
```

<div class="figure" style="text-align: center">
<img src="07_EDA_files/figure-html/korrmaatriks-1.png" alt="(ref:korrmaatriks)" width="70%" />
<p class="caption">(\#fig:korrmaatriks)(ref:korrmaatriks)</p>
</div>

2. vaata andmeid numbrilise kokkuvõttena.


```r
psych::describe(iris) %>% knitr::kable()
```

                vars     n   mean      sd   median   trimmed     mad   min   max   range     skew   kurtosis      se
-------------  -----  ----  -----  ------  -------  --------  ------  ----  ----  ------  -------  ---------  ------
Sepal.Length       1   150   5.84   0.828     5.80      5.81   1.038   4.3   7.9     3.6    0.309     -0.606   0.068
Sepal.Width        2   150   3.06   0.436     3.00      3.04   0.445   2.0   4.4     2.4    0.313      0.139   0.036
Petal.Length       3   150   3.76   1.765     4.35      3.76   1.853   1.0   6.9     5.9   -0.269     -1.417   0.144
Petal.Width        4   150   1.20   0.762     1.30      1.18   1.038   0.1   2.5     2.4   -0.101     -1.358   0.062
Species*           5   150   2.00   0.819     2.00      2.00   1.483   1.0   3.0     2.0    0.000     -1.520   0.067



```r
skimr::skim(iris) %>% knitr::kable()
```



variable       type      stat         level           value  formatted 
-------------  --------  -----------  -----------  --------  ----------
Sepal.Length   numeric   missing      .all            0.000  0         
Sepal.Length   numeric   complete     .all          150.000  150       
Sepal.Length   numeric   n            .all          150.000  150       
Sepal.Length   numeric   mean         .all            5.843  5.84      
Sepal.Length   numeric   sd           .all            0.828  0.83      
Sepal.Length   numeric   p0           .all            4.300  4.3       
Sepal.Length   numeric   p25          .all            5.100  5.1       
Sepal.Length   numeric   p50          .all            5.800  5.8       
Sepal.Length   numeric   p75          .all            6.400  6.4       
Sepal.Length   numeric   p100         .all            7.900  7.9       
Sepal.Length   numeric   hist         .all               NA  ▂▇▅▇▆▅▂▂  
Sepal.Width    numeric   missing      .all            0.000  0         
Sepal.Width    numeric   complete     .all          150.000  150       
Sepal.Width    numeric   n            .all          150.000  150       
Sepal.Width    numeric   mean         .all            3.057  3.06      
Sepal.Width    numeric   sd           .all            0.436  0.44      
Sepal.Width    numeric   p0           .all            2.000  2         
Sepal.Width    numeric   p25          .all            2.800  2.8       
Sepal.Width    numeric   p50          .all            3.000  3         
Sepal.Width    numeric   p75          .all            3.300  3.3       
Sepal.Width    numeric   p100         .all            4.400  4.4       
Sepal.Width    numeric   hist         .all               NA  ▁▂▅▇▃▂▁▁  
Petal.Length   numeric   missing      .all            0.000  0         
Petal.Length   numeric   complete     .all          150.000  150       
Petal.Length   numeric   n            .all          150.000  150       
Petal.Length   numeric   mean         .all            3.758  3.76      
Petal.Length   numeric   sd           .all            1.765  1.77      
Petal.Length   numeric   p0           .all            1.000  1         
Petal.Length   numeric   p25          .all            1.600  1.6       
Petal.Length   numeric   p50          .all            4.350  4.35      
Petal.Length   numeric   p75          .all            5.100  5.1       
Petal.Length   numeric   p100         .all            6.900  6.9       
Petal.Length   numeric   hist         .all               NA  ▇▁▁▂▅▅▃▁  
Petal.Width    numeric   missing      .all            0.000  0         
Petal.Width    numeric   complete     .all          150.000  150       
Petal.Width    numeric   n            .all          150.000  150       
Petal.Width    numeric   mean         .all            1.199  1.2       
Petal.Width    numeric   sd           .all            0.762  0.76      
Petal.Width    numeric   p0           .all            0.100  0.1       
Petal.Width    numeric   p25          .all            0.300  0.3       
Petal.Width    numeric   p50          .all            1.300  1.3       
Petal.Width    numeric   p75          .all            1.800  1.8       
Petal.Width    numeric   p100         .all            2.500  2.5       
Petal.Width    numeric   hist         .all               NA  ▇▁▁▅▃▃▂▂  
Species        factor    missing      .all            0.000  0         
Species        factor    complete     .all          150.000  150       
Species        factor    n            .all          150.000  150       
Species        factor    n_unique     .all            3.000  3         
Species        factor    top_counts   setosa         50.000  set: 50   
Species        factor    top_counts   versicolor     50.000  ver: 50   
Species        factor    top_counts   virginica      50.000  vir: 50   
Species        factor    top_counts   NA              0.000  NA: 0     
Species        factor    ordered      .all            0.000  FALSE     

Siin pööra kindlasti tähelepanu tulpadele min ja max, mis annavad kiire võimalusi outliereid ära tunda. Kontrolli, kas andmete keskmised (mediaan, mean ja trimmed mean) on üksteisele piisavalt lähedal --- kui ei ole, siis on andmete jaotus pika õlaga, ja kindlasti mitte normaalne. 
Kontrolli, kas erinevate muutujate keskväärtused ja hälbed on teaduslikus mõttes usutavas vahemikus. 
Ära unusta, et ka väga väike standardhälve võib tähendada, et teie valim ei peegelda bioloogilist varieeruvust populatsioonis, mis teile teaduslikku huvi pakub. 
NB! selles `psych::describe()` funktsiooni väljundis on mad läbi korrutatud konstandiga `1.4826`, mis toob selle väärtuse lähemale sd-le. 
Seega on mad siin sd robustne analoog --- kui mad on palju väiksem sd-st, siis on karta, et muutujas on outliereid.

3. kontrolli NA-de esinemist oma andmetes VIM paketi abil või käsitsi (vt esimene ptk). Kontrolli, et NA-d ei oleks tähistatud mingil muul viisil (näiteks 0-i või mõne muu numbriga). Kui vaja, rekodeeri NAd. Mõtle selle peale, millised protsessid looduses võiksid genreerida puuduvaid andmeid. Kui NA-d ei jaotu andmetes juhuslikult, võib olla hea mõte andmeid imputeerida (vt hilisemaid ptk, bayesiaanlik imputeerimine). Näiteks, kui ravimiuuringust kukuvad eeskätt välja patsiendid, kellel ravim ei tööta, on ilmselt halb mõte nende patsientide andmed lihtsalt uuringust välja vistata (muidugi, kui te ei esinda kasumit taotleva ettevõtte huve). Kui NA-d jaotuvad juhuslikult, mõtle sellele, kas sa tahad NA-dega read tabelist välja visata, või hoopis osad muutujad, mis sisaldavad liiga palju NA-sid, või mitte midagi välja vistata. NB! NA-dega andmed ei sobi hästi regresiooniks.

4. Kui andmeid on nii palju, et üksikute andmepunktide vaatlemine paneb pea valutama, siis järgmine informatiivsuse tase on histogramm. 

5. kui tahame kõrvuti vaadata paljude erinevate muutujate varieeruvust ja keskväärtusi, siis on head valikud joyplot, violin plot, ja vähem hea valik (sest ta kaotab andmetest rohkem infot) on boxplot. Kui meil on vaid 2-4 jaotust, mida võrrelda, siis saab mängida histogramme facetisse või üksteise otsa pannes (vt ptk graphics).

6. Tulpdiagramm on hea valik siis, kui tahate kõrvuti näidata proportsioonide erinevust. Näiteks, kui meil on 3 liiki kalu, millest igas on erinevas proporstioonis parasiidid, võime joonistada 3 tulpa, millest igas on näidatud ühe kalaliigi parasiitide omavaheline proportsioon. 

7. Tulpdiagramm on hädaga pooleks kasutuskõlblik, kui iga muutuja kohta on vaid üks number, mida plottida. Kuigi, siin on meil parem võimalus --- Cleveland plot. Olukorras, kus te tahate plottida valimi keskväärtust ja usalduspiire või varieeruvusnäitajat (sd, mad), on olemas selgelt paremad meetodid kui tulpdiagramm. Samas, ehki tulpdiagrammide kasutamine teaduskirjanduses on pikas langustrendis, kasutatakse neid ikkagi liiga palju just sellel viisil. 

8. Ära piirdu muutuja tasemel varieeruvuse plottimisega. Teaduslikult on sageli huvitavam mimte muutuja koosvarieerumine. Järgmistes peatükkides modelleerime seda formaalselt regresioonanalüüsis aga alati tasub alustada lihtsatest plottidest. Scatterplot on lihtne viis kovarieeruvuse vaatamiseks. 

9. Kui erinevad muutujad on mõõdetud erinevates skaalades (ühikutes), siis võib nende koosvarieeruvust olla kergem võrrelda, kui nad eelnevalt normaliseerida (kõigi muutujate keskväärtus = 0, aga varieeruvus jääb algsesse skaalasse) või standardiseerida (kõik keskväärtused = 0-ga ja sd-d = 1-ga). 
Standardiseerida tohib ainult normaaljaotusega muutujaid (seega võib olla vajalik muutuja kõigepealt logaritmida). 
Normaliseerimine: arvuta igale valimi väärtusele: `mean(x) - x`; standardiseerimine: `(mean(x) - x) / sd(x)`.

10. Visualiseeringu valik sõltub valimi suurusest. Väikse valimi korral (N<10) boxploti, histogrammi vms kasutamine on lihtsalt rumal. Ära mängi lolli ja ploti parem punkti kaupa.

+ N < 20 - ploti iga andmepunkt eraldi (`stripchart()`, `plot()`) ja keskmine või mediaan. 

+ 20 > N > 100: `geom_dotplot()` histogrammi vaates

+ N > 100: `geom_histogram()`, `geom_density()` --- nende abil saab ka 2 kuni 6 jaotust võrrelda

+ Mitme jaotuse kõrvuti vaatamiseks, kui N > 15: `geom_boxplot()`, or `geom_violin()`, `geom_joy()` 

11. Nii saab plottida multiplikatiivse sd:

(ref:multisd) Multiplikatiivse sd joonistamine.


```
#> Warning: Ignoring unknown parameters: bins
```

<div class="figure" style="text-align: center">
<img src="07_EDA_files/figure-html/multisd-1.png" alt="(ref:multisd)" width="70%" />
<p class="caption">(\#fig:multisd)(ref:multisd)</p>
</div>



##  EDA kokkuvõte

1. Andmepunktide plottimine säilitab maksimaalselt andmetes olevat infot (nii kasulikku infot kui müra). Aitab leida outliereid (valesti sisestatud andmeid, valesti mõõdetud proove jms). Kui valim on väiksem kui 20, piisab täiesti üksikute andmepunktide plotist koos mediaaniga. Dot-plot ruulib.

2. Histogramm – kõigepealt mõõtskaala ja seejärel andmed jagatakse võrdse laiusega binnidesse ja plotitakse binnide kõrgused. Bin, kuhu läks 20 andmepunkti on 2X kõrgem kui bin, kuhu läks 10 andmepunkti. Samas, bini laius/ulatus mõõteskaalal pole teile ette antud – ja sellest võib sõltuda histogrammi kuju. Seega on soovitav proovida erinevaid bini laiusi ja võrrelda saadud histogramme. Histogramm sisaldab vähem infot kui dot plot, aga võimaldab paremini tabada seaduspärasid & andmejaotust & outliereid suurte andmekoguste korral.

3. Density plot. Silutud versioon histogrammist, mis kaotab infot aga toob vahest välja signaali müra arvel. Density plotte on hea kõrvuti vaadelda joy ploti abil.

4. Box-plot –- sisaldab vähem infot kui histogramm, kuid neid on lihtsam kõrvuti võrrelda. Levinuim variant (kuid kahjuks mitte ainus) on Tukey box-plot – mediaan (joon), 50% IQR (box) ja 1,5x IQR (vuntsid), pluss outlierid eraldi punktidena.

5. Violin plot –- informatiivsuselt box-ploti ja histogrammi vahepeal – sobib paljude jaotuste kõrvuti võrdlemiseks.

6. Line plot –- kasuta ainult siis kui nii X kui Y teljele on kantud pidev väärtus (pikkus, kaal, kontsentratsioon, aeg jms). Ära kasuta, kui teljele kantud punktide vahel ei ole looduses mõtet omavaid pidevaid väärtusi (näiteks X teljel on katse ja kontroll või erinevad valgumutatsioonid, mille aktiivsust on mõõdetud).

7. Tulpdiagramm -- Suhete võrdlemine (bar).

8. Cleveland plot on hea countide võrdlemiseks. Kui Cleveland plot mingil põhjusel ei sobi, kasuta tupldiagrammi. 

9. Pie chart on proportsioonide vaatamiseks enam-vähem kõlblik ainult siis, kui teil pole vaja võrrelda proportsioone erinevates objektides. Kõik graafikud, kus lugeja peab võrdlema pindalasid, on inimmõistusele petlikud --- lugeja alahindab süstemaatiliselt erinevuste suurusi! Selle pärast on proportsioonide võrdlemiseks palju parem tulpdiagramm, kus võrreldavad tulbad on ühekõrgused.  

Informatsiooni hulk kahanevalt: 
iga andmepunkt plotitud ---> 
histogramm ---> 
density plot & violin plot ---> 
box plot ---> 
tulpdiagramm standardhälvetega ---> 
cleveland plot (ilma veapiirideta) 
