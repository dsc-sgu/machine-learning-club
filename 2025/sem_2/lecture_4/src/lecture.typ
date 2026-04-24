#import "@preview/tgm-hit-sew-lecture:0.1.0": *
#import "@preview/equate:0.3.2": equate,
#import "@preview/physica:0.9.3": *
#import "@preview/theorion:0.4.1": *
#import cosmos.clouds: *


#set-inherited-levels(0)
#set-theorion-numbering("1")
#let (theorem-counter, theorem-box, theorem, show-theorem) = make-frame(
  "theorem",
  "Theorem",
  counter: theorem-counter,
  inherited-levels: 2,
  inherited-from: heading,
  render: (prefix: none, title: "", full-title: auto, body) => [#strong[#full-title.]#sym.space#emph(body)],
)

#show: show-theorion
#show: equate.with(breakable: true, sub-numbering: true)
#set math.equation(numbering: "(1.1)")

#set text(lang: "ru", font: "Liberation Sans", size: 10pt)
#set document(
  title: [Свёрточные нейронные сети],
  author: "Пицик Харитон, Карасев Вадим",
  date: datetime(year: 2026, month: 04, day: 24),
)

#show: template(
  header-left: [Клуб машинного обучения],
  header-center: [Свёрточные нейронные сети],
  footer-right: [_&&_],
  font: "Cantarell",
)

#title()

#include "chapters/intro.typ"
#include "chapters/intro_cnn.typ"
#include "chapters/cnn.typ"
#include "chapters/additions.typ"
