#import "@preview/tgm-hit-sew-lecture:0.1.0": *
#import "@preview/equate:0.3.2": equate,
#import "@preview/physica:0.9.3": *
#import "@preview/theorion:0.4.1": *
#import cosmos.clouds: *


#set-inherited-levels(0)
#set-theorion-numbering("1")
#let (theorem-counter, theorem-box, theorem, show-theorem) = make-frame(
  "theorem",
  "Theorem",  // supplement, string or dictionary like `(en: "Theorem")`, or `theorion-i18n-map.at("theorem")` for built-in i18n support
  counter: theorem-counter,  // inherit the old counter, `none` by default
  inherited-levels: 2,  // useful when you need a new counter
  inherited-from: heading,  // heading or just another counter
  render: (prefix: none, title: "", full-title: auto, body) => [#strong[#full-title.]#sym.space#emph(body)],
)

#show: show-theorion
#show: equate.with(breakable: true, sub-numbering: true)
#set math.equation(numbering: "(1.1)")

#set text(lang: "ru", font: "Liberation Sans", size: 10pt)
#set document(
  title: [Обучение без учителя],
  author: "Пицик Харитон, Карасев Вадим",
  // you may keep a log of published versions here
  // 2025-11-28: template created
  date: datetime(year: 2026, month: 03, day: 11),
)

#show: template(
  header-left: [Клуб машинного обучения],
  header-center: [Обучение без учителя],
  footer-right: [_&&_],
  //license: licenses.cc-by-4-0,
  font: "Cantarell",
)

// the bibliography is not shown, but you can cite from it (chicago-notes is a footnote style)
// #bibliography("bibliography.bib")

#title()

// useful to give attribution if this is an adaptation
// #place(hide(footnote(numbering: "*")[Based on earlier work by Jane Doe]))
// #counter(footnote).update(i => i - 1)

#include "chapters/intro.typ"
#include "chapters/clustering.typ"
#include "chapters/dim_red.typ"
