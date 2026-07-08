#import "../../globals.typ": *

= 圏 • 対象 • 射 • 可換

== はじめに

発表を始めるに当たって、数学の世界でよく使われる言い回しを紹介する。 \
以降の説明の中で、これらの言い回しが出てきた場合は、以下の意味で使われていると理解して欲しい。\

- `well-defained`$dots.c.h$意味、値、対象が一意に定まる
- `ill-defined`$dots.c.h$意味、値、対象が一意に定まらない
- `well-formed`$dots.c.h$形式、文法が正しい (式として成立する)
- `self-contained`$dots.c.h$自己完結的・それだけで完結している
  - `self-contained`な説明とは、その説明のみで定義から定理証明までが、包括的に記載されていることを指す。
- `coherent / coherence condition`$dots.c.h$複数の構造・操作・対応が互いに整合している
  - `coherence condition`とは、それらを整合させるために要求される等式や可換条件を指す。

== 圏論とは

- 構造を議論する数学の一分野
- 抽象の数学の一つ
(数学に親しんでいる方にとっては具体的と主張されることもあるが)

#grid(
  columns: (auto, 1em, 1fr),
  align: horizon,
  diagram(
    node((0, 0), $A$),
    node((1, 0), $B$),
    node((1, 1), $C$),
    edge((0, 0), (1, 0), $f$, label-side: left, "->"),
    edge((1, 0), (1, 1), $g$, label-side: left, "->"),
    edge((0, 0), (1, 1), $g compose f$, label-side: right, "->"),
    node((0.65, 0.35), text(0.8em)[$arrow.cw$]),
  ),
  block(),
  speech-bubble[このように、点と矢印のみで構成される世界],
)

== 対象 • 射

// the callouts are placed as ordinary diagram nodes above their targets, so
// they line up exactly with no separate measuring/positioning needed
#align(center, diagram(
  node((0, 0.5), [$bullet$]),
  node((3, 0.5), [$bullet$]),
  edge((0, 0.5), (3, 0.5), "->"),
  node((0, 0), speech-bubble(angle: -90deg)[対象]),
  node((1.5, 0), speech-bubble(angle: -90deg)[射]),
))

#v(2em)

「重要なポイント」 \
射 = 矢印 という認識をするのではなく、移す元の対象と移した先の対象のタプルに名前を付けたものという認識をすると良い。 \
(矢印そのものにラベルが付いてる訳ではないという話です。) \


== 圏$cal(C)$の定義

#slide[
  $cal(C)$が圏であるためには、以下の6つの制約を満たす必要がある。

  1. 対象の集まり$cal("Ob")(cal(C))$を規定
  2. $forall c, d in cal("Ob")(cal(C))$に対して、$c$から$d$への射$cal(C)(c, d)$を規定
    - 射の集まりを$cal("Hom")(cal(C))$と規定 \
  3. $forall c in cal("Ob")(cal(C))$に対して、$c$上の恒等射$id_c in cal(C)(c, c)$を規定
  4. $forall c, d, e in cal("Ob")(cal(C))$と射$f in cal(C)(c, d), g in cal(C)(d, e)$に対して、$f$と$g$の合成射$g;f in cal(C)(c, e)$を規定
    - $c in cal("Ob")(cal(C))$と$c in cal(C)$は等価な表現 \
    - $f in cal(C)(c, d)$と$f: c -> d$は等価な表現 \
]

#slide[
  なお、射は以下の要件を満たす必要がある
  5. 単位律$dots.h.c$$forall f: c -> d$に対して、それを$c$または$d$の恒等射と合成しても何も変わらない。すなわち、$id_c;f = f$および$f;id_d=f$である。
  6. 結合律$dots.h.c$$forall f: c_0 -> c_1, g: c_1 -> c_2, h: c_2 ->c_3$に対して、$(f;g);h = f;(g;h)$が成立する。この合成を単に$f;g;h$と表現する。
]

#slide[
  単位律の図式は以下のように表現できる。
  #align(center, diagram({
    node((0, 0), [$c$])
    node((2, 0), [$d$])
    edge((0, 0), (2, 0), [$f$], label-side: left, "->")
    edge(
      (0, 0),
      (0, 0),
      [$id_c$],
      label-side: left,
      "->",
      bend: 140deg,
      loop-angle: 90deg,
    )
    edge(
      (2, 0),
      (2, 0),
      [$id_d$],
      label-side: left,
      "->",
      bend: 140deg,
      loop-angle: 90deg,
    )
  }))
]

#slide[
  結合律の図式は以下のように表現できる。
  #align(center, diagram({
    node((1, 0), [$c_0$])
    node((3, 0), [$c_1$])
    node((5, 0), [$c_2$])
    node((7, 0), [$c_3$])
    edge((1, 0), (3, 0), [$f$], label-side: left, "->")
    edge((3, 0), (5, 0), [$g$], label-side: left, "->")
    edge((5, 0), (7, 0), [$h$], label-side: left, "->")
    edge((1, 0), (5, 0), [$f;g$], label-side: left, "->", bend: 54deg)
    edge((3, 0), (7, 0), [$g;h$], label-side: left, "->", bend: -54deg)
  }))
]

== 可換

可換であるとは、図式の中で複数の射が存在する場合に、それらの射を合成した結果が同じになることを指す。\
例えば、以下のような三角形の図式が可換であるとは、2つの射$f, g$とそれらの合成射$f;g$が等しいことを意味する。\

#align(center, diagram(
  node((0, 0), $A$),
  node((1, 0), $B$),
  node((1, 1), $C$),
  edge((0, 0), (1, 0), $f$, label-side: left, "->"),
  edge((1, 0), (1, 1), $g$, label-side: left, "->"),
  edge((0, 0), (1, 1), $f;g$, label-side: right, "->"),
  node((0.65, 0.35), text(0.8em)[$arrow.cw$]),
))

#text(
  0.8em,
)[なお、以降の図式では、$arrow.cw$の記号は省略する。]

