#import "../../globals.typ": *

= 図式

#slide[
  #figure(
    image("../scrap/scrap.drawio.png", width: 50%),
  )
]

= 定義

話がややこしくなるので、全ての圏は局所小圏であるとする。\
(この仮定を置かないと、ファイバーの定義をどうすべきか不明であり、
かつ、集合のあつまりとかを考えたくないので、局所小圏であるとする。)

#text(size: 16pt)[公理的集合論に全部乗っかりたいよね〜]

== 全圏 (total category

ファイバー圏を部分圏として持つ圏

== ファイバー圏 (fiber category)

まずは、ファイバーを定義する

$
  & "関手" F: cal(T) -> cal(B) "に対して、" \
  & a in T "のファイバー" T(a) subset T "を以下のように定義する。" \
  & cal("Ob")(T(a)) := F^{-1}(a) := { u in cal("Ob")(T) | F(u) = a } \
  & cal("Hom")(T(a)) := F^{-1}(id_a) := { f in cal("Hom")(T) | F(f) = id_a }
$

このとき、$cal(T)(a)$は全圏$cal(T)$の部分圏であり、このような圏をファイバー圏とよぶ。

#pagebreak()

== 基底圏 (base category)

ファイバー圏から移された先の対象を含む圏。\
図式の中では、$cal(B)$が基底圏である。


= 式

== 今回の具体例の図式の関係

#text(size: 16pt)[$
  & "圏について" \
  & cal(T) "が全圏として存在する" cal(B) "が基底圏として存在する" \
  & cal("T_0") subset cal(T), cal("T_0") subset cal(T) "が全圏の部分圏として存在する (これらの圏をファイバー圏とよぶ。)"\
  & "対象について"\
  & a, b, c in cal("Ob")(cal("T_0")),d, e in cal("Ob")(cal("T_0")) "(全圏の対象)"\
  & 0, 1 in cal("Ob")(cal(B)) "(基底圏の対象)"\
  & "射について"\
  & "(全圏の射)"\
  & g_("ab"): a -> b, g_("ac"): a -> c, g_("bc"): b -> c, g_("bd"_1): b -> d \
  & g_("bd"_2): b -> d, g_("cd"): c -> d, g_("ce"): c -> e, g_("de"): d -> e \
  & g_("ab"), g_("ac"), g_("bc"), g_("bd"_1), g("bd"_2), g_("cd"), g_("ce"), g_("de") in cal("Hom")(cal(T)))\
  & "(基底圏の射)"\
  & f_("01"): 0 -> 1, g_("01") in cal("Hom")(cal(B)))
$]

#text(size: 16pt)[$
  & "関手について" \
  & F(0): cal(T_0) -> cal(B) "が全圏から基底圏への関手 (ファイバー) として存在する" \
  & F(a) = F(b) = F(c) = 0 \
  & F(g_("ab")) = F(g_("ac")) = F(g_("bc")) = id_0 \
  & F(1): cal(T_1) -> cal(B) "が全圏から基底圏への関手 (ファイバー) として存在する" \
  & F(d)= F(e) = 1\
  & F(g_("de")) = id_1
$]

= リフト

== リフトの定義

#text(size: 16pt)[$
  & "圏" cal(T), cal(B) "と関手" F: cal(T) -> cal(B) "が与えられたとする。" \
  & x in cal("Ob")(cal(T)), F(x) = cal(B) "という対象と、" f: b -> F(x) in cal("Hom")(cal(B)) "という射に対して、" \
  & "射" g: y -> x in cal(T) "が" b = F(y) "と" f = F(g) "を満たすとき、" g "を" f "のリフトとよぶ。"\
$]

#figure(
  image("../scrap/lift.png", width: 35%),
)

== 今回の具体例におけるリフト

射$g_("ce")$について

#figure(
  image("../scrap/lift1.png", width: 50%),
)

#pagebreak()

射$g_("cd")$について

#figure(
  image("../scrap/lift2.png", width: 50%),
)

#pagebreak()

射$g_("bd"_1)$について

#figure(
  image("../scrap/lift3.png", width: 50%),
)

#pagebreak()

射$g_("bd"_2)$について

#figure(
  image("../scrap/lift4.png", width: 50%),
)

= カルテシアン射 / カルテシアンリフト

#text(size: 16pt)[$
  & "圏" cal(T), cal(B) "と関手" F: cal(T) -> cal(B) "が与えられたとする。" \
$]

= グロタンディークファイブレーション

= raindexing functor

= cleavage /cloven category

= split fibration

