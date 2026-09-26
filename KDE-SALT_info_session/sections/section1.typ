#import "../../globals.typ": *

= 研究内容

#centered-slide[
  #text(
    size: 1.3em,
  )[*圏論*を用いて、*プロパティグラフ*のマイグレーションを \ 数学的に保証する。]
]

== 圏論とは？

#slide[
  #box[
    大学の初頭数学までで学んできた数学では、多くは対象に注目してきたはずだ。 \
    しかし、圏論では、対象よりも対象間の関係に注目する。

    #set align(left)
    - 構造を議論する数学の一分野
    - 抽象的な数学の一つ

    #grid(
      columns: (auto, 1em, auto),
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
  ]
]

== プロパティグラフとは？

#slide[
  ノード / エッジがそれぞれプロパティと呼ばれるkey-valueペアを持つグラフ構造のこと。
  DBの世界には、RDB以外にも複数種類のDBが存在する。

  #figure(
    image("../assets/pg.drawio.png", width: 80%),
    caption: [#text(size: 20pt)[プロパティグラフのイメージ図]],
  )
]
= 研究目標

#slide[
  #align(center + horizon, diagram({
    node(
      (0, 0),
      [$"プロパティグラフ (PG) の既存のモデル (PG-Schema / PG-Keys)"$],
    )
    node((0, 2), [$"PG to PGのマイグレーションを数学的に保証する"$])
    node(
      (0, 2.7),
      [$"Schema A" models "Constraints of Schema A" arrow.r.long^("Migration") M("Schema A") models M("Constraints of Schema A")$],
    )
    edge((0, 0), (0, 2), [$"圏論を用いた数理モデル化"$], label-side: left, "=>")
  }))
]

