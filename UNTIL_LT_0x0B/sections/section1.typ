#import "../../globals.typ": *

= 確認

#slide[
  #text(1.2em)[
    数学科の方出身の方はいないですね？
  ]
]

= 現代数学とは？

#slide[
  #align(center)[このLTでの「現代数学」の意味]

  #v(1em)

  #align(center, block(fill: luma(230), inset: 1em, radius: 4pt, width: 85%)[
    #align(
      center,
    )[*対象や前提、推論のルールを明確にし、\ その上で数学を構築していく立場*]
  ])
]

== 対比：高校までの数学

証明は扱う。でも、その土台はふつう問わない。

#v(1em)

#let card(body) = block(
  fill: luma(245),
  inset: 0.8em,
  radius: 4pt,
  width: 100%,
  align(center, body),
)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 0.8em,
  card[*自然数*とは？], card[*巨大基数*は存在するか？], card[*等号*とは？],
  card[*選択公理*を認めるか？],
  card[*排中律*を認めるか？],
  card[*連続体仮説*を認めるか？],
)

#v(1em)
#align(center)[多くは自然言語の「まあ、こういう意味だよね」に依存している。]

