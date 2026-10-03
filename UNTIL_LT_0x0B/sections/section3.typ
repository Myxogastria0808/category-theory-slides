#import "../../globals.typ": *

= 素朴集合論

== 集合は「ものの集まり」

#align(center, block[
  #show math.equation.where(block: true): set align(left)
  #align(left)[$ {1, 2, 3} quad quad NN $]
  #v(0.2em)
  #align(left)[ある条件を満たすものを全部集めれば、集合を作れる。]
  #v(0.2em)
  #align(left)[$ {x in NN | x "は偶数"} $]
  #v(0.35em)
  #align(
    left,
  )[では、自分自身を要素として含まない集合を、すべて集めた集合を考える。]
])

#v(0.2em)
#align(center)[$ R = {x | x in.not x} $]

#v(0.15em)
#align(center, text(1.1em)[$arrow.b$])

#v(0.1em)
#align(center)[$R in R$ だろうか？]

#slide[
  - $R in R$ ならば、$R$は「自分自身を含まない集合」なので $R in.not R$
  - $R in.not R$ ならば、その条件を満たすので $R in R$

  #v(1em)
  #align(center, text(1.3em)[$ R in R <=> R in.not R $])

  #v(1em)
  #align(center, block(fill: luma(230), inset: 1em, radius: 4pt, width: 65%)[
    #align(center, text(1.1em)[*ラッセルのパラドックス*])
  ])
]

== 何が問題だったのか

#align(center, text(1.1em)[
  「条件を満たすものなら何でも集合にしてよい」\
  という人間の直観に任せると、こういう矛盾が発生する。
])

#v(1.5em)
#align(center, block(fill: luma(230), inset: 1em, radius: 4pt, width: 85%)[
  #align(center)[*集合の作り方そのものに、何らかの制限が必要*]
])

