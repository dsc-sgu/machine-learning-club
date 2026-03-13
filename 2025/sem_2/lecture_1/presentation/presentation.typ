#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import "@preview/numbly:0.1.0": numbly
#import "@preview/ctheorems:1.1.3": *
#import "@preview/cetz:0.3.1"

#set text(font: "Libertinus Serif")

#show figure: set align(center)
#show raw: set text(size: 0.9em)

#show: metropolis-theme.with(
  config-colors(
    primary: rgb("#246687"),
    secondary: rgb("#1b5775")
  ),
  aspect-ratio: "16-9",
  align: horizon,
  // config-common(handout: true),
  config-info(
    title: [Unsupervised Learning],
    author: [Харитон Пицик],
    date: datetime.today(),
    institution: [Клуб машинного обучения],
    logo: [&&],
  ),
)

#let cetz-canvas = touying-reducer.with(
  reduce: cetz.canvas,
  cover: cetz.draw.hide.with(bounds: true)
)

#title-slide([Recap: Supervised Learning])

// Includes
#include "chapters/intro.typ"
#include "chapters/kmeans.typ"
#include "chapters/pca.typ"
