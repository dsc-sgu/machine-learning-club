#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import "@preview/numbly:0.1.0": numbly
#import "@preview/ctheorems:1.1.3": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

== Recap: CNN
Ранее мы уже говорили, что типичный пайплайн CNN выглядит следующим образом:
$
text("Conv") → text("ReLU") → text("Pooling") → dots → text("Flatten") → text("Linear") → text("Softmax")
$

Однако такого пайплайна, оказывается, недостаточно.

#pagebreak()
== Recap: Почему CNN вообще работает?

Однако почему CNN вообще даёт какие-либо результаты?
#pause
1. Локальная обработка, пиксели влияют друг на друга;
#pause
2. Shared weights;
#pause
3. В зависимости от глубины, фильтры выучивают разные признаки.

#pagebreak()
== Recap: Проблемы CNN

#pause
1. Потеря информации при пулинге;
#pause
2. Невозможность обучать глубокие сети;
#pause
3. Невозможность передать далее какие-то ранее полученные признаки.
