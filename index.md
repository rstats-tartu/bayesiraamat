
--- 
knit: "bookdown::render_book"
title: "Bayesi statistika kasutades R keelt"
author: ["Taavi Päll", "Ülo Maiväli"]
github-repo: rstats-tartu/bayesiraamat
description: "Praktilise kursuse 'Reprodutseeritav andmeanalüüs R keeles' Bayesi statistika materjalid."
bibliography: [book.bib, packages.bib]
biblio-style: apalike
site: bookdown::bookdown_site
documentclass: book
cover-image: img/cyclo.png
---

# Saateks {-}

See õpik soovib anda praktilisi andmeanalüüsi oskusi töötamiseks reaalsete andmetega. See puudutab laias laastus kolme teemat: 

1. Kuidas summeerida andmeid: keskmise, varieeruvuse ja kovarieeruvuse näitajad. 

2. Kuidas graafiliste meetodite abil kontrollida andmete kvaliteeti ja püstitada uusi hüpoteese.

3. Kuidas teha andmete põhjal järeldusi protsessi kohta, mis neid andmeid genereerib, ühtlasi kirjeldades adekvaatselt neid järeldusi ümbritsevat ebakindlust.

Kuna me püüame anda eeskätt praktilisi oskusi andmeanalüüsiks, mitte matemaatilist ega muidu teoreetilist haridust, siis keskendume moodsatele bayesi meetoditele. Need on küll arvuti jaoks töömahukamad kui klassikalised statistilisel olulisusel põhinevad testid, aga inimese jaoks kergemini õpitavad ning tõlgendatavad. Klassikalist ja bayesi statistikat võrdleme lisas 1. Bayesiaanliku lähenemise hind on, et kasutaja peab omandama vähemalt algtasemel R keele, mis võimaldab käsurealt anmdeid manipuleerida. R-i õppimine nõuab kahtlemata lisapingutust, aga me usume, et see tasub ära igaühele, kes töötab vähemalt keskmise suurusega andmekogudega. Me teeme sissejuhatuse R-i peatükkides ...., keskendudes R-i tidyverse ökosüsteemile, mis on optimeeritud olema kergesti kasutatav ja õpitav inimestele, kelle põhitöö ei ole seotud koodi kirjutamisega.  

Pingutus R õppimiseks tasub teile mitmel erineval viisil. R võimaldab palju kiiremini andmetabeleid analüüsiks sobivasse vormi  ajada kui spreadsheet programmid. R-i graafikasüsteem, eriti ggplot2, on võimas ning paindlik tööriist väga erinevate graafikute koostamiseks. R-s jooksevad praktiliselt kõik statistilised testid, mida inimmõistus on loonud -- R on levinuim statistikaprogramm maailmas, mis on eriti hästi sobiv statistiliseks modelleerimiseks. See tähendab ka, et üle maailma on suur seltskond inimesi, kes R-i arendab ja on nõus vastama ka teie küsimustele. Lisaboonusena on juba kord salvestatud R-i koodi taaskasutades palju lihtsam oma analüüsi korrata ja vastavalt vajadustele muuta, kui spreadsheet programmide puhul.    

Õpiku kasutamise eeldused:
- Arvuti.
- Matemaatikaoskused, mis hõlmavad liitmist, lahutamist, korrutamist, jagamist, logaritmimist ja astendamist. 
- Kõrgemat matemaatikat me ei vaja. 





