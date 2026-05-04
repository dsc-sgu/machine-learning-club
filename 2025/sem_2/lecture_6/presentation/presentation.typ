#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import "@preview/numbly:0.1.0": numbly
#import "@preview/ctheorems:1.1.3": *

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
    title: [Векторное представление слов],
    author: [Харитон Пицик],
    date: datetime.today(),
    institution: [Клуб машинного обучения],
    logo: [&&],
  ),
)


#title-slide([Embeddings])

// Includes
#include "chapters/intro.typ"
#include "chapters/task.typ"
#include "chapters/ohe.typ"
#include "chapters/bow.typ"
#include "chapters/tf.typ"
#include "chapters/word2vec.typ"
#include "chapters/fasttext.typ"

