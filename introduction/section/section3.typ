#import "../../globals.typ": *

= 様々な圏

== 有効グラフ (これは圏ではない)

$G = ("Vertex", "Arrow", s, t)$で表現される。
- $"Vertex"$$dots.c.h$頂点を要素にもつ集合
- $"Arrow"$$dots.c.h$辺を要素にもつ集合
- $s$$dots.c.h$始点関数
- $t$$dots.c.h$終点関数
  - 2つの関数$s, t: "Arrow" -> "Vertex"$は、以下のように定義される。
  - $s(a) = v$および$t(a) = w$であるような$a in "Arrow"$が与えられたとき、$a$は$v$から$w$への辺である。このグラフは、以下のように図式で表現できる。
  - $v ->^a w$
- Gの道 (path) $dots.c.h$それぞれの辺の終点が次の辺の始点であるような辺の列。
  - 道には、$G$の辺$a in A$にすぎない長さ$1$の列や、同じ頂点を始点および終点として、どの辺もたどらない長さ$0$の列も含まれる。
- 事実: 任意のグラフから擬順序が得られる。

== 自由圏

任意のグラフ$G = ("Vertex", "Arrow", s, t)$に対して、
$G$上の自由圏$cal("Free")(G)$を定義する。\
その圏の対象は頂点$"Vertex"$であり、射は$G$の道である。
対象$c$上の恒等射は単に$c$における自明な道である。
合成は、道の連結によって与えられる。

#v(1em)

#block(
  fill: luma(230),
  radius: 4pt,
  inset: 15pt,
)[
  有効グラフをそのまま圏に変換することができると理解しておけば十分である。
]

== 自由圏の例 #h(0.5em) $cal("Free")(bold(2))$の場合

#slide[
  圏$bold(2)$を以下のようなグラフによって生成される自由圏$cal("Free")(bold(2))$として定義する。

  $
    bold(2) := cal("Free")(v_1 ->^(f_1) v_2)
  $

  圏であるためには、以下の6つの制約を満たす必要があるので、満たしているかどうかを確認する。

  1. 対象の集まり$cal("Ob")(cal(C))$を規定
    - $v_1, v_2 in cal("Ob")(cal("Free")(bold(2)))$とする。
  2. $forall c, d in cal("Ob")(cal(C))$に対して、$c$から$d$への射$cal(C)(c, d)$を規定
    - $id_(v_1) : v_1 -> v_1, id_(v_2) : v_2 -> v_2, f_1 : v_1 -> v_2$とする。
]

#slide[
  3. $forall c in cal("Ob")(cal(C))$に対して、$c$上の恒等射$id_c in cal(C)(c, c)$を規定
    - $forall v in cal("Ob")(cal("Free")(bold(2)))$に対して、$v$上の恒等射が存在する。
    - $id_(v_1) : v_1 -> v_1, id_(v_2) : v_2 -> v_2$
  4. $forall c, d, e in cal("Ob")(cal(C))$と射$f in cal(C)(c, d), g in cal(C)(d, e)$に対して、$f$と$g$の合成射$g;f in cal(C)(c, e)$を規定
    - 合成は道の結合より与えられる。
    - e.g. $id_(v_1) ; f_1 = f_1, id_(v_2) ; id_(v_2) = id_(v_2)$
]

#slide[
  なお、射は以下の要件を満たす必要がある
  5. 単位律$dots.h.c$$forall f: c -> d$に対して、それを$c$または$d$の恒等射と合成しても何も変わらない。すなわち、$id_c;f = f$および$f;id_d=f$である。
    - $id_(v_1) ; f_1 = f_1, f_1 ; id_(v_2) = f_1$が成り立つ。
  6. 結合律$dots.h.c$$forall f: c_0 -> c_1, g: c_1 -> c_2, h: c_2 ->c_3$に対して、$(f;g);h = f;(g;h)$が成立する。この合成を単に$f;g;h$と表現する。
    - $id_(v_1) : v_1 -> v_1, f_1 :v_1 -> v_2, id_(v_2) : v_2 -> v_2$に対して、 \ 等式$(id_(v_1) ; f_1);id_(v_2) = id_(v_1);(f_1;id_(v_2))$が成り立つ。
  #v(1em)
  従って、$bold(2) := cal("Free")(v_1 ->^(f_1) v_2)$は圏である。
]

== 有限表示をもつ圏

任意のグラフ$G$に対して、$G$上の自由圏がある。この圏について、始点$p$と終点$q$が等しい$f : p -> q$と$g : p -> q$があるとき、これらは$bold("平行")$と呼ばれ、等式として結ぶこと ($f = g$)が許される。この等式を伴う有限グラフは、圏に対する$bold("有限表示")$とよばれる。そして、その結果の圏を$bold("有限表示をもつ圏")$と定義する。

#slide[
  有限表示をもたない自由圏は、例えば以下の図式のように$f;h$と$g;i$が等しい有限表示をもたない圏である。\
  従って、射の数は$10$個 ($f, g, h, i, g;i, f;h, id_A, id_B, id_C, id_D$) となる。

  #align(center, diagram({
    node((0, 0), [$A$])
    node((2, 2), [$D$])
    node((0, 2), [$C$])
    node((2, 0), [$B$])
    edge((0, 0), (2, 2), [$f;h$], label-side: left, "->")
    edge((0, 0), (2, 2), [$g;i$], label-side: right, "->")
    edge((0, 0), (0, 2), [$g$], label-side: right, "->")
    edge((0, 2), (2, 2), [$i$], label-side: right, "->")
    edge((0, 0), (2, 0), [$f$], label-side: left, "->")
    edge((2, 0), (2, 2), [$h$], label-side: left, "->")
  }))
]

#slide[
  有限表示をもつ圏は、例えば以下の図式のように$f;h$と$g;i$が等しい有限表示をもつ圏である。\
  従って、射の数は$9$個 ($f, g, h, i, j, id_A, id_B, id_C, id_D$) となる。

  #align(center, diagram({
    node((0, 0), [$A$])
    node((2, 2), [$D$])
    node((0, 2), [$C$])
    node((2, 0), [$B$])
    edge((0, 0), (2, 2), [$j$], label-side: left, "->")
    edge((0, 0), (0, 2), [$g$], label-side: right, "->")
    edge((0, 2), (2, 2), [$i$], label-side: right, "->")
    edge((0, 0), (2, 0), [$f$], label-side: left, "->")
    edge((2, 0), (2, 2), [$h$], label-side: left, "->")
  }))

  #align(center)[$
    f ; h = g ; i = j
  $]
]

== 圏$cal("Set")$

#slide[
  圏$cal("Set")$は、集合と写像をそれぞれ対象と射に変換した圏である。
  #v(1em)
  圏であるためには、以下の6つの制約を満たす必要があるので、満たしているかどうかを確認する。\
  1. 対象の集まり$cal("Ob")(cal(C))$を規定
    - $cal("Ob")(cal("Set"))$は、すべての集合の集まりである。
  2. $forall c, d in cal("Ob")(cal(C))$に対して、$c$から$d$への射$cal(C)(c, d)$を規定
    - 集合$S, T$について、$cal("Set")(S, T) = {f : S -> T | f$は関数$}$である。
  3. $forall c in cal("Ob")(cal(C))$に対して、$c$上の恒等射$id_c in cal(C)(c, c)$を規定
    - 集合$S$における恒等射は、それぞれの$s in S$に対して$id_S(s) := s$で与えられる関数$id_S: S -> S$である。
]

#slide[
  4. $forall c, d, e in cal("Ob")(cal(C))$と射$f in cal(C)(c, d), g in cal(C)(d, e)$に対して、$f$と$g$の合成射$g;f in cal(C)(c, e)$を規定
    - 与えられた関数$f : S -> T$と$g : T -> U$に対して、それらの合成は$(f;g)(s) := g(f(s))$で与えられる関数$f;g : S -> U$である。
  なお、射は以下の要件を満たす必要がある。
  5. 単位律$dots.h.c$$forall f: c -> d$に対して、それを$c$または$d$の恒等射と合成しても何も変わらない。すなわち、$id_c;f = f$および$f;id_d=f$である。
    - 関数$f : S -> T$について、$id_S : id_S(s) = s$ (ただし、任意の$s in S$) との合成関数$(id_S; f)(s)=f(id_S(s))=f(s)$である。また、$id_T : id_T(t) = t$ (ただし、任意の$t in T$との合成関数$(f ; id_T)(s) = id_T(f(s))=f(s)$である。従って、単位律の条件を満たす。
  6. 結合律$dots.h.c$$forall f: c_0 -> c_1, g: c_1 -> c_2, h: c_2 ->c_3$に対して、$(f;g);h = f;(g;h)$が成立する。この合成を単に$f;g;h$と表現する。
    - $f : S -> T, g : T -> U, h : U -> V$について、$((f;g);h)(s)=h((f;g)(s)) = h(g(f(s)))$ (ただし、任意の$s in S$) である。また、$(f;(g;h))(s)=(g;h)(f(s))=h(g(f(s)))$ (ただし、任意の$s in S$) である。任意の$s in S$で値が等しいので、関数として等しい。従って、結合律の条件を満たす。
  #v(1em)
  なお、圏$cal("Set")$の対象は無限であるが、対象が有限集合で、射がそれらの間の関数であるような圏$cal("FinSet")$も定義できる。この圏は圏$cal("Set")$に密接に関係している。
]

== 添字圏と図式

#slide[
  圏$cal(C)$畳の$cal(I)$-型の図式とは、共変関手$F: cal(I) -> cal(C)$や$G: cal(I) -> cal(C)$のこと。\
  この圏$cal(J)$のことをこれらの図式の添字圏とよぶ。\
  (以下の図式には、コンポーネントも存在するが、特に自然変換である必要はない。)

  #align(center, utils.fit-to-height(1fr)[
    #figure(
      image("../assets/functor.png", height: 100%),
    )
  ])
]

== 関手圏

#slide[
  圏$cal(C)$から圏$cal(D)$への関手圏$cal(D)^(cal(C))$とは、圏$cal(C)$から圏$cal(D)$への共変関手を対象とし、
  それらの間の自然変換を射とする圏のこと。\
  例えば、圏$cal(C)$から圏$cal(D)$への関手$F, G: cal(C) -> cal(D)$と、自然変換$alpha: F => G$があるとき、$F, G$は関手圏$cal(D)^(cal(C))$の対象であり、$alpha$は射である。\
  この例を図式で表現すると、次スライドのようになる。
]

#slide[
  #align(center, utils.fit-to-height(1fr)[
    #figure(
      image("../assets/functor-category.png", height: 100%),
    )
  ])
]

