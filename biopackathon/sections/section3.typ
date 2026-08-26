#import "../../globals.typ": *

= LLMのハーネスの整備

== 構築したモデル × LLM

#slide[
  任意の入力を数理モデルに適合するように整合されたプロパティグラフに変換する。

  #figure(
    image("../assets/llm.drawio.png", width: 100%),
    caption: [プロパティグラフのイメージ図],
  )
]

#slide[
  構築した数モデルへの変換の成功確率を上げるためのワンショットプロンプトを考える。
  その際、モデルに適合するようにハーネスを整備する必要がある。
  今回のbiopackathonでは、このハーネスの整備を行う。

  #figure(
    image("../assets/prompt.drawio.png", width: 45%),
    caption: [プロパティグラフのイメージ図],
  )
]

