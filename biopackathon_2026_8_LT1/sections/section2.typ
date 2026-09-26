#import "../../globals.typ": *

= 圏論を用いたモデル


== モデル構築の目的

今回のbiopackathonは、プロパティグラフを圏論を用いたモデルとして構築することを考える。

#v(50pt)

#figure(
  image("../assets/model.drawio.png", width: 70%),
  caption: [モデル構築のイメージ図],
)

== プロパティグラフとは？

プロパティグラフとは、グラフの各ノードやエッジに属性（プロパティ）を持たせることができるグラフ構造である。\

#v(50pt)

#figure(
  image("../assets/pg.drawio.png", width: 80%),
  caption: [プロパティグラフのイメージ図],
)

== プロパティグラフのモデル化

