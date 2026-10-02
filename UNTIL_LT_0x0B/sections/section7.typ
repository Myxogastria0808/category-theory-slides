#import "../../globals.typ": *

= 現代数学をおすすめできる人

== チューリング完全な計算モデルの中で考えることに飽きた人

#align(center)[
  プログラミングの中では、\
  「どう計算するか」「どう実装するか」「どう効率よく解くか」を考え続ける。
]

#v(1em)

#let card(body) = block(
  fill: luma(245),
  inset: 0.8em,
  radius: 4pt,
  width: 100%,
  align(center, body),
)

#align(center, block(width: 85%, grid(
  columns: (1fr, 1fr),
  gutter: 0.8em,
  card[どんな*対象*を考えるのか],
  card[どのような*構造*を入れるのか],
  card[どの*公理*を採用するのか],
  card[そこから何が*導かれる*のか],
)))

#v(1em)
#align(center)[現代数学では、この問い自体が研究対象になる。]

== 競技プログラミングが心底嫌いな人

#let step(body) = box(fill: luma(245), inset: (x: 0.7em, y: 0.5em), radius: 4pt, body)

#align(center, text(0.85em)[
  #step[問題を理解] #h(0.5em) $arrow.r$ #h(0.5em)
  #step[アルゴリズムを考える] #h(0.5em) $arrow.r$ #h(0.5em)
  #step[実装する] #h(0.5em) $arrow.r$ #h(0.5em)
  #step[出力を返す]
])

#v(1.5em)
#align(center)[「与えられた問題を解く」という構造そのものに、あまり魅力を感じない。]

#v(1em)
#align(center)[むしろ、考えたいのはこちら側——]

#align(center, text(1.05em)[
  その問題が成立している*世界*は何なのか？\
  そもそも、その*定義*はどうなっているのか？\
  *別の構造*として考えられないのか？
])
