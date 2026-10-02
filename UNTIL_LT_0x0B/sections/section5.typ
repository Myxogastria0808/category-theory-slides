#import "../../globals.typ": *

= 自然数も作る

== 集合として自然数を定義する

#align(center, block[
  #show math.equation.where(block: true): set align(left)
  $ 0 = emptyset $
  $ 1 = {0} = {emptyset} $
  $ 2 = {0, 1} = {emptyset, {emptyset}} $
  $ 3 = {0, 1, 2} $

  #v(0.3em)
  #align(center, text(1.1em)[$arrow.b$])
  #v(0.2em)
  #align(left)[一般に、]
  #align(left)[$ n + 1 = n union {n} $]
])

== $in$ だけの世界から

- 自然数ができれば、整数・有理数・実数も構築できる
- 関数も、順序対や集合を使って定義できる

#v(1em)
#align(center, block(fill: luma(230), inset: 1em, radius: 4pt, width: 85%)[
  #align(
    center,
  )[*$in$ という一つの関係を中心とした世界から、\ 既存の数学の体系を作り直す。*]
])

#v(1em)
#align(center)[これが「厳密な数学」として一般に想像される世界にかなり近い。\ 今回「現代数学」と呼びたいのは、こちら側の立場。]

