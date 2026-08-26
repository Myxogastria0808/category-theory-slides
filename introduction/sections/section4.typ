#import "../../globals.typ": *

= RDBのスキーマおよびデータを圏に変換

#slide[
  RDBのスキーマを圏へ変換する方針は、以下の通りである。

  1. RDBのスキーマを有向グラフに変換する。
  2. 有向グラフを自由圏に変換する。
  3. 自由圏に等式制約を加えて得られる有限表示をもつ圏を作成する。

  さらに、RDBのデータを圏に変換するには、以下のステップを踏む。

  4. 始域の圏に対して、その圏の元になったスキーマに具体的に与えられていたデータを与える。
    - この操作は、集合値関手 (特に、この場合はデータベース•インスタンス) \ $I: cal(C) -> cal("Set")$を作成することが目的である。
]

#slide[
  以下のスキーマを例にして、RDBのスキーマを圏に変換する方法を説明する。

  スキーマ$C$

  `Employee`テーブル
  #table(
    columns: 4,
    stroke: gray,
    [id (primary key)],
    [manager  (primary keyを内部参照)],
    [dept (foreign key)],
    [description],
  )

  `Department`テーブル
  #table(
    columns: 2,
    stroke: gray,
    [id (primary key)], [note],
  )

  スキーマ$C$に関する業務上の制約として、「社員の上司は、その社員と同じ部署に所属している」というものを考える。
]

#slide[
  スキーマ$D$

  `Staff`テーブル
  #table(
    columns: 4,
    stroke: gray,
    [id (primary key)],
    [supervisor  (primary keyを内部参照)],
    [team (foreign key)],
    [profile (foreign key)],
  )

  `Profile`テーブル
  #table(
    columns: 2,
    stroke: gray,
    [id (primary key)], [bio],
  )

  `Team`テーブル
  #table(
    columns: 2,
    stroke: gray,
    [id (primary key)], [memo],
  )
]

== RDBのスキーマを有向グラフに変換する。

#slide[
  証明の対象とする2つのスキーマの有向グラフは、次以降のスライドの通り。\
  以下に有向グラフの凡例と制約を示す。
  - [凡例] Tableのidを参照している列については ● 、それ以外を参照している列については ○ へ向かう辺として各列の型を表現している。
  - [制約] 各列には必ずただ一つの型が与えられなければならない。
]

#slide[
  有向グラフ$C$

  #align(center, utils.fit-to-height(1fr)[
    #figure(
      image("../assets/graph-c.png", height: 100%),
    )
  ])
]

#slide[
  有向グラフ$D$

  #align(center, utils.fit-to-height(1fr)[
    #figure(
      image("../assets/graph-d.png", height: 100%),
    )
  ])
]

== 有向グラフを自由圏に変換する。

4.2のスライドで示した通り、有向グラフ$C, D$は、自由圏に変換することができる。\
従って、有向グラフ$C, D$は、それぞれ自由圏$cal(C), cal(D)$に変換することができる。

#align(center, diagram({
  node((0, 0), [$"有向グラフ"$])
  node((2, 0), [$"自由圏"$])
  edge((0, 0), (2, 0), [$"変換"$], label-side: left, "->")
}))

== 自由圏に等式制約を加えて得られる有限表示をもつ圏を作成する。

スキーマ$C$に存在する等式制約「社員の上司は、その社員と同じ部署に所属している」
を自由圏$cal(C)$に加えることによって、有限表示をもつ圏$cal(C)$を作成する。\

等式制約の表現方法は、以下の通りである。
- 表現方法は、通過したノードとエッジを`.`で連結して記述する。
- e.g. $N_1 ->^(E_1) N_2$ ($N_1$から出発して$E_1$を経由し、$N_2$に到達した場合): $N_1.E_1$

圏$cal(C)$の有限表示は、以下の通りである。
- $"Employee"."manager"."dept" = "Employee"."dept"$ (圏$cal(C)$における等式制約)

圏$cal(C)$の有限表示の制約を圏$cal(D)$に写した際の有限表示は、以下の通りである。
- $"Staff"."supervisor"."team" = "Staff"."team"$ (圏$cal(D)$における等式制約)

#v(1em)

#text(1.2em)[*以上で、次スライド以降で行う証明の準備ができた。*]

