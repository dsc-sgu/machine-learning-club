#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import "@preview/numbly:0.1.0": numbly
#import "@preview/ctheorems:1.1.3": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

= Задача сегментации
== Задача сегментации
#figure(
  image("../assets/im_seg.png", width: 60%)
)

#pause
Задача сегментации заключается в том, что каждый пискель изображения должен
получить метку класса.

#pagebreak()
== Архитектурное решение задачи

Архитектура состоит из двух частей:

- Encoder -- как обычный CNN
- Decoder -- восстанавливает изображение

#pagebreak()
== Encoder
Повторяющийся блок:
$
text("Conv") -> text("ReLU") -> text("Conv") -> text("ReLU") -> text("Pooling")
$
#pause
- уменьшается размер изображения
- увеличивается число каналов

== Bottleneck
Самая глубокая часть сети:
$
text("Conv") -> text("Conv")
$
#pause
- максимальный receptive field => максимальная абстракция

== Decoder
Основной блок:
$
text("Upsample") -> text("Conv") -> text("Conv")
$
#pause
- уменьшаем число каналов
- постепенно возвращаем размерность к исходной


#pagebreak()
#figure(
  image("../assets/unet.png", width: 60%)
)
#pause
Архитектура похожа букву U, поэтому UNet.

#pagebreak()
== Вернёмся к задаче сегментации

Раз мы начали говорить о сегментации как о задаче машинного обучения, стоит рассмотреть основные функции потерь в рамках этой задачи.

#pagebreak()
== Dice Loss
Dice loss выражает сходство предсказанной и целевой областей:
#pause
$
 text("Dice coef") = (2 * |A inter B|) / (|A| + |B|)
$

$
text("Dice loss") = 1 - text("Dice coef")
$

#pagebreak()
== IoU
IoU является более строгой функцией, которая штрафует ошибки.
#pause
$
text("IoU Loss") = 1 - (|A inter B|) / (|A union B|)
$

$
text("Dice") = (2 text("IoU")) / (text("IoU") + 1)
$
