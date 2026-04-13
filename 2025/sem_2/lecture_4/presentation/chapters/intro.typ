#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import "@preview/numbly:0.1.0": numbly
#import "@preview/ctheorems:1.1.3": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

== Recap: Функции активации

Ранее мы уже рассматривали некоторые функции активации. Их основное предназначение -- научить модель выявлять *нелинейные* признаки.

#pause
Ранее мы остановились на $R e L U$ и $L e a k y R e L U$, которые достаточно хорошо себя показывают.

#pagebreak()
Также мы остановились на том, что для задачи бинарной классификации досаточно использовать сигмоиду:

$
  sigma (x) = 1 / (1 + e^(-x))
$
Однако остался вопрос, как решать задачу мультиклассовой классификации?

#pagebreak()
= Softmax
== Softmax

Для решения задачи мультиклассовой классификации применяется следующая функция активации:

$
  f(z_i) = (e^(z_i)) / (sum (e^(z_i)))
$
#pause
Такая функция активации называется *Softmax*, её идея заключается в том, чтобы отображать каждый элемент в $[0, 1]$.

#pagebreak()
#diagram(
  spacing: (20mm, 14mm),
  node-stroke: 0.5pt,
  axes: (ltr, ttb),

  node((0, 0), $z_3 = 0.1$, stroke: none, fill: none, name: <z3>),
  node((0, 1), $z_2 = 1.0$, stroke: none, fill: none, name: <z2>),
  node((0, 2), $z_1 = 2.0$, stroke: none, fill: none, name: <z1>),

  node((1.7, 1), $e^z$, shape: circle, fill: white, name: <exp>),

  node((3.4, 0), $1.11$, stroke: none, fill: none, name: <e3>),
  node((3.4, 1), $2.72$, stroke: none, fill: none, name: <e2>),
  node((3.4, 2), $7.39$, stroke: none, fill: none, name: <e1>),

  node((5.1, 0), $0.10$, shape: rect,
    fill: red.lighten(80%), stroke: red.lighten(50%), name: <p3>),
  node((5.1, 1), $0.24$, shape: rect,
    fill: orange.lighten(70%), stroke: orange.lighten(40%), name: <p2>),
  node((5.1, 2), $0.66$, shape: rect,
    fill: green.lighten(70%), stroke: green.lighten(40%), name: <p1>),

  node((5.1, -1), $sum p_i = 1.0$, stroke: none, fill: none),

  edge(<z3>, <exp>, "->"),
  edge(<z2>, <exp>, "->"),
  edge(<z1>, <exp>, "->"),

  edge(<exp>, <e3>, "->"),
  edge(<exp>, <e2>, "->"),
  edge(<exp>, <e1>, "->"),

  edge(<e3>, <p3>, "->"),
  edge(<e2>, <p2>, "->"),
  edge(<e1>, <p1>, "->"),
)

#pagebreak()
Выходит, что мы получаем вектор из $n$ элементов, сумма которого всегда $1$.

#pause
В дальнейшем эти выходы можно интерпретировать как вероятность каждого из классов.
