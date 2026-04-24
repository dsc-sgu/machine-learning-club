#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import "@preview/numbly:0.1.0": numbly
#import "@preview/ctheorems:1.1.3": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#pagebreak()
== Можно ли как-то проще?

Что, если мы не будем как-то изворачиваться, а будем делать однотипную
архитектуру, но глубже?

#pagebreak()
#figure(
  image("../assets/vgg.png")
)

#pause
Такая архитектура называется VGG. Конкретно на слайде -- архитектура VGG-19.

#pagebreak()
== Создание VGG

VGG была предложена группой Visual Geometry Group (Оксфорд) в 2014 году.
Основная идея:
сделать архитектуру максимально простой и системной, но при этом глубокой.
Для этого использовались только $3 times 3$ свёртки.

#pause
В отличие от AlexNet:
#pause
- вводим единый строительный блок
#pause
- увеличиваем глубину сети

#pagebreak()
== Архитектура VGG

Сеть строится из повторяющихся блоков:

#pause
[Conv 3×3 → ReLU] × N → Pooling

Далее увеличивается количество каналов, а размер изображения уменьшается.

#pause
Типичная схема каналов:
64 → 128 → 256 → 512 → 512

#pause
В конце:
Flatten → Fully Connected → Softmax

#pagebreak()
== Receptive field

Receptive field — это область входного изображения,
которая влияет на значение конкретного нейрона.

#pause
Пример:
- 1 $times$ Conv 3×3 → receptive field = 3×3
- 2 $times$ Conv 3×3 → receptive field = 5×5
- 3 $times$ Conv 3×3 → receptive field = 7×7

#pause
Каждый слой увеличивает receptive field,
потому что комбинирует информацию из предыдущего слоя.

#pagebreak()
== Как он растёт

Рост происходит за счёт двух вещей:

#pause
1. Свёртки

#pause
2. Pooling

#pagebreak()
== Проблемы VGG

#pause
1. Огромное количество параметров;
#pause
2. Медленная;
#pause
3. Плохо масштабируема по глубине.
