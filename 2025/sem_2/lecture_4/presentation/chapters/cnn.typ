#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import "@preview/numbly:0.1.0": numbly
#import "@preview/ctheorems:1.1.3": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#pagebreak()
== Convolutional Neural Network
Идея состоит в том, чтобы обрабатывать изображение *локально*: вместо того, чтобы соединять каждый пиксель с каждым нейроном, мы будем смотреть на небольшие
окрестности пикселей -- *патчи*.

#pause
Такой подход сразу решает обе проблемы:
#pause
- Соседние пиксели обрабатываются *вместе*, а не независимо;
#pause
- Один и тот же фильтр применяется *по всему изображению*, а значит паттерн будет найден вне зависимости от его положения.

== Свёртка
Ключевая операция в CNN -- это *свёртка* (convolution). Возьмём фильтр размером $k times k$ и будем "скользить" им по изображению, на каждом шаге
вычисляя скалярное произведение фильтра и патча изображения под ним:

#pause
$ (I * K)(i, j) = sum_(m=0)^(k-1) sum_(n=0)^(k-1) I_(i+m,  j+n) dot K(m, n) $

где $I$ -- входное изображение, $K$ -- ядро свёртки.

#pause
Размер выходного изображения (feature map) при входе $H times W$, ядре $k times k$ и шаге (stride) $s$:

#pause
$ H_("out") = floor((H - k) / s) + 1, quad W_("out") = floor((W - k) / s) + 1 $

#pagebreak()
== Padding
Заметьте, что после свёртки изображение уменьшается. Чтобы сохранить пространственные размеры, применяют *padding* -- дополнение изображения нулями по краям.

#pause
При $"padding" = p$ формула меняется:

#pause
$ H_("out") = floor((H - k + 2p) / s) + 1 $

При $k = 3, s = 1, p = 1$ размер изображения сохраняется: $H_("out") = H$.

#pagebreak()
== Свойство разделяемых весов
Ключевое отличие свёрточного слоя от полносвязного -- *разделяемые веса*.

#pause
Один фильтр размером $k times k$ применяется ко *всем* позициям изображения. Количество параметров одного фильтра:

$ |K| = k times k times C_("in") $

где $C_("in")$ -- число каналов входа. Для $k=3$, $C_("in")=3$: всего $27$ параметров против MLP.
#pause

Если мы используем $C_("out")$ фильтров, то суммарно:

$ |W_("conv")| = k times k times C_("in") times C_("out") $

#pagebreak()
== Pooling
После свёртки обычно применяют *пулинг* -- операцию, которая уменьшает пространственный размер feature map и делает представление
более устойчивым к малым сдвигам.

#pause
Наиболее популярный вариант -- *Max Pooling*: берём максимум по окну $p times p$:

$ y(i,j) = max_(0 <= m,n < p) x(i dot s + m,\, j dot s + n) $

Это даёт два эффекта:
#pause
- *Сжатие*: размер карты уменьшается в $s$ раз по каждому измерению;
#pause
- *Инвариантность*: небольшой сдвиг паттерна внутри окна не меняет результат.


#pagebreak()
#let accent = rgb("#eb811b")
#let dark   = rgb("#23373b")
#let hi     = accent.lighten(55%)
#figure(
  diagram(
    spacing: (5mm, 5mm),
    node-stroke: 0.5pt + dark,
    axes: (ltr, ttb),
    {
      // Значения для сетки 4×4
      let vals = (
        (1, 3, 2, 1),
        (4, 6, 5, 2),
        (7, 2, 3, 1),
        (5, 8, 4, 6),
      )
      let maxes = (6, 5, 8, 6)

      let highlighted = ((1,1), (1,2), (3,1), (3,3))

      for i in range(4) {
        for j in range(4) {
          let v = vals.at(i).at(j)
          let is-max = highlighted.contains((i, j))
          let fc = if is-max { accent.lighten(40%) } else { white }
          node((j, i), text(size: 8pt)[#v], shape: rect,
            width: 8mm, height: 8mm, fill: fc)
        }
      }

      node((1, 1), [], shape: rect,
        width: 16mm, height: 16mm,
        fill: none, stroke: (paint: accent, thickness: 1.5pt, dash: "dashed"))
      node((2, 1), [], shape: rect,
        width: 16mm, height: 16mm,
        fill: none, stroke: (paint: accent, thickness: 1.5pt, dash: "dashed"))
      node((1, 3), [], shape: rect,
        width: 16mm, height: 16mm,
        fill: none, stroke: (paint: accent, thickness: 1.5pt, dash: "dashed"))
      node((3, 3), [], shape: rect,
        width: 16mm, height: 16mm,
        fill: none, stroke: (paint: accent, thickness: 1.5pt, dash: "dashed"))

      node((1.5, 4.8),
        text(size: 8pt, fill: dark)[Вход $4 times 4$, окно $2 times 2$],
        stroke: none, fill: none)

      node((5.5, 1.5), text(size: 14pt, fill: dark)[$arrow.r$],
        stroke: none, fill: none)

      let out-vals = (6, 5, 8, 6)
      let out-pos = ((7, 1), (8, 1), (7, 2), (8, 2))
      for idx in range(4) {
        let (c, r) = out-pos.at(idx)
        node((c, r), text(size: 9pt, weight: "bold")[#out-vals.at(idx)],
          shape: rect, width: 8mm, height: 8mm,
          fill: accent.lighten(30%))
      }
      node((7.5, 2.8),
        text(size: 8pt, fill: dark)[Выход $2 times 2$],
        stroke: none, fill: none)
    }
  ),
)
#pagebreak()
== Архитектура CNN
Свёрточная нейронная сеть обычно строится следующим образом:

#pause
$ underbrace(["Conv" -> "ReLU"] times N, "feature extraction") -> "Flatten" -> underbrace(["Linear" -> "ReLU"] times M, "classification") $

#pause
- *Conv + ReLU* -- извлекают локальные признаки, постепенно увеличивая глубину ($C_("out")$) и уменьшая пространственный размер;
#pause
- *Flatten* -- разворачивает трёхмерный тензор $H times W times C$ в вектор;
#pause
- *Linear* -- классический MLP-классификатор поверх извлечённых признаков.

#pagebreak()
Для входа $1024 times 1024$ и первого свёрточного слоя с $64$ фильтрами $3 times 3$:

#pause
$ |W_("conv")| = 3 times 3 times 64 = 1728 $

#pause
В то же время MLP:

$ |W_("MLP")| = 1024 times 1024 times 4096 approx 1.29 times 10^(10) $

#pagebreak()
== Недостатки CNN

#pause
1. Инвариантность к сдвигу;
#pause
2. Потеря данных при пуллинге;
#pause
3. Требовательность к данным.
