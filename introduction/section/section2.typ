#import "../../globals.typ": *

= 関手 • 自然変換

== 関手 (共変関手)

複数の関手

- 対象について
  - 共変関手$F: cal(C) -> cal(D)$は、圏$cal(C)$の任意の対象c$$を圏$cal(D)$の対象$F(c)$に写す。
- 射について
  - 共変関手$F: cal(C) -> cal(D)$は、圏$cal(C)$の任意の射$f: c-> d$を圏$cal(D)$の射$F(f): F(c) -> F(d)$に写し、以下を満たす。
    1. 恒等射の保存: $F(id_c) = id_(F(c))$
    2. 射の合成の保存: $F(f;g) = F(f);F(g)$

#slide[
  可換図式で表現すると、以下のようになる。

  #align(center, utils.fit-to-height(1fr)[
    // use the raw (unwrapped) fletcher diagram here: `fit-to-height` measures
    // its body, and measuring a touying-reduce-wrapped `diagram` corrupts its
    // reveal-step marks and crashes the compile (see globals.typ's `diagram`)
    #fletcher.diagram({
      node((0, 0), [圏$cal(C)$])
      node((0, 2), [$d$])
      node((2, 2), [$c$])
      node((0, 4), [$e$])
      node((4, 0), [圏$cal(D)$])
      node((4, 2), [$F(d)$])
      node((4, 4), [$F(e)$])
      node((6, 2), [$F(c)$])
      node((2, 0), text(rgb(0, 0, 0, 0))[$bullet$])
      node((3, 0), text(rgb(0, 0, 0, 0))[$bullet$])
      edge((2, 2), (0, 2), [$f$], label-side: right, "->")
      edge((0, 2), (0, 4), [$g$], label-side: right, "->")
      edge((2, 2), (0, 4), [$f;g$], label-side: left, "->")
      edge((6, 2), (4, 2), [$F(f)$], label-side: right, "->")
      edge((4, 2), (4, 4), [$F(g)$], label-side: right, "->")
      edge(
        (6, 2),
        (4, 4),
        [$F(f;g) = F(f);F(g)$],
        label-side: left,
        label-pos: 0.2,
        "->",
      )
      edge(
        (0, 2),
        (0, 2),
        [$id_d$],
        label-side: left,
        "->",
        bend: 140deg,
        loop-angle: 90deg,
      )
      edge(
        (2, 2),
        (2, 2),
        [$id_c$],
        label-side: left,
        "->",
        bend: 140deg,
        loop-angle: 90deg,
      )
      edge(
        (0, 4),
        (0, 4),
        [$id_e$],
        label-side: right,
        "->",
        bend: -140deg,
        loop-angle: 90deg,
      )
      edge(
        (4, 4),
        (4, 4),
        [$F(id_e) = id_(F(c))$],
        label-side: left,
        "->",
        bend: 140deg,
        loop-angle: -90deg,
      )
      edge(
        (4, 2),
        (4, 2),
        [$F(id_d) = id_(F(id_d))$],
        label-side: left,
        "->",
        bend: 140deg,
        loop-angle: 90deg,
      )
      edge(
        (6, 2),
        (6, 2),
        [$F(id_c) = id_(F(id_c))$],
        label-side: left,
        "->",
        bend: 140deg,
        loop-angle: 90deg,
      )
      edge((2, 0), (3, 0), [関手$F$], label-side: left, "->")
    })
  ])
]

== 自然変換

圏$cal(C)$と圏$cal(D)$について$F, G: cal(C) -> cal(D)$を関手とする。
自然変換$alpha: F => G$を規定するためには、以下の2つを満たす必要がある。
- コンポーネントの規定
  - 圏$cal(C)$の任意の対象$c$に対して、圏$cal(D)$の射$alpha_c: F(c) -> G(c)$を規定する。
  - このときの射$alpha_c$を自然変換$alpha$の$c$コンポーネントと呼ぶ。
- 自然性条件
  - 任意のコンポーネント$alpha_c$と$alpha_d$に対して、圏$cal(C)$の任意の射$f: c -> d$に対して、次スライドの図式が可換であることを要求する。
  - 式で記述すると、$alpha_c;G(f) = F(f);alpha_d$である。

#slide[
  以下の図式が可換であることによって、自然性条件を満たすことを表現できる。

  #align(center, diagram({
    node((0, 0), [$F(c)$])
    node((0, 2), [$F(d)$])
    node((2, 2), [$G(d)$])
    node((2, 0), [$G(c)$])
    node((1, 1), [$arrow.cw$])
    edge((0, 0), (2, 0), [$alpha_c$], label-side: left, "->")
    edge((0, 2), (2, 2), [$alpha_d$], label-side: right, "->")
    edge((0, 0), (0, 2), [$F(f)$], label-side: right, "->")
    edge((2, 0), (2, 2), [$G(f)$], label-side: left, "->")
  }))
]

