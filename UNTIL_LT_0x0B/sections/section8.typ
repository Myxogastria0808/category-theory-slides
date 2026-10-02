#import "../../globals.typ": *

= 競技プログラミングは、かなり素朴なのでは？

#let judge-panel(title, body-content, body-fill: white) = block(width: 75%, above: 0pt, below: 0pt)[
  #block(
    fill: luma(230),
    inset: (x: 0.8em, y: 0.45em),
    width: 100%,
    radius: (top-left: 4pt, top-right: 4pt),
    above: 0pt,
    below: 0pt,
  )[
    #align(left, text(0.7em, fill: luma(90))[#title])
  ]
  #block(
    fill: body-fill,
    stroke: 0.6pt + luma(210),
    inset: 0.9em,
    width: 100%,
    radius: (bottom-left: 4pt, bottom-right: 4pt),
    above: 0pt,
    below: 0pt,
  )[
    #body-content
  ]
]

#let ac-badge = box(fill: rgb("#2e7d32"), inset: (x: 0.6em, y: 0.25em), radius: 2pt)[
  #text(fill: white, size: 0.75em, weight: "bold")[AC]
]

#slide[
  #set text(size: 0.78em)
  #align(center)[
    #judge-panel("問題文", align(left)[自然言語で書かれた問題文])

    #v(0.6em)

    #judge-panel(
      "Main.py",
      align(left, raw(
        block: true,
        lang: "python",
        "n = int(input())\na = list(map(int, input().split()))\nfor i in range(n):\n    if check(a[i]):\n        print(i)",
      )),
      body-fill: luma(250),
    )

    #v(0.6em)

    #judge-panel("Results", table(
      columns: (1fr, auto),
      stroke: none,
      inset: (x: 0pt, y: 0.35em),
      align: (left + horizon, center + horizon),
      [test1], [#ac-badge],
      table.hline(stroke: 0.5pt + luma(220)),
      [test2], [#ac-badge],
    ))
  ]
]

== 自然言語に依存している部分

#align(center)[
  問題文は自然言語で書かれ、\
  人間が「こういう意味だろう」と解釈するところから始まる。
]

#v(1em)
#align(center, block(fill: luma(230), inset: 1em, radius: 4pt, width: 90%)[
  #align(center)[*出発点が、かなり自然言語に依存している。*]
])

#v(1em)
#align(center, text(0.85em)[多少の曖昧さや論理の飛躍があっても、人間が自然に補完して読めてしまう。])

== 形式的な部分と、素朴な部分

- プログラムそのものは形式言語 — 構文も意味も規則で決まる
- しかし「何を実現すべきか」という問題設定は自然言語
- 正しさの判定は、多くの場合テストケース（具体的な入力に対する確認）

#v(1em)
#align(center, block(fill: luma(230), inset: 1em, radius: 4pt, width: 90%)[
  #align(center)[
    具体的な入力での確認
    #v(0.3em)
    $≠$
    #v(0.3em)
    $forall x, P(x)$ の証明
  ]
])
