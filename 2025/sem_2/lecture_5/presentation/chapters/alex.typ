#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import "@preview/numbly:0.1.0": numbly
#import "@preview/ctheorems:1.1.3": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

== Проблема неглубокости CNN
#pagebreak()
Первая проблема, которую начали решать -- невозможность обучать глубокие сети.
Решают её с помощью:

#pause
1. ReLU
#pause
2. Dropout
#pause
3. Data Augmentation

#pause
Комбинируя всё вместе получается архитектура, которую называют AlexNet.

#pagebreak()

#figure(
  image("../assets/alexnet.png")
)

#pagebreak()
== Создание AlexNet

AlexNet была реализована в 2012 году Алексом Крижевским, Ильей Суцкевером и Джеффри Хинтоном. Первая реализация была написана на C++ и обучена на двух GTX 580.

#pause
Данная архитектура (а точнее ансамбль из 7 моделей такой архитектуры) побеждала в соревновании ImageNet в 2012 году.

#pagebreak()
== Ограничения AlexNet
#pause
- огромные FC слои
#pause
- архитектура "грязная"
#pause
- нет чёткого принципа масштабирования
