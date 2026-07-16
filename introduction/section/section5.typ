#import "../../globals.typ": *

= RDBのマイグレーション後のデータ整合ができていることを確認する証明

== はじめに

本来であれば、正しくデータ移行が「行われる」ことを保証すべきであるが、そのためには、Kan拡張についての理解をする必要がある。そのため、以下の証明は全てデータ移行が「行われた後」のスキーマ整合または データ整合に関する確認のみできている。従って、実際の操作はしていない。

== 証明の概要

今回は、次に示す2種類の証明を行う。

*証明①*\
*スキーマレベル (各列の型のレベル) におけるマイグレーションにおいて、移行元スキーマの各型・各列・各等式制約に、移行先スキーマ上の対応先が存在することを示す。*

*証明②*\
*データ (インスタンス) レベルにおけるマイグレーションにおいて、移行後のデータベース•インスタンス$J$は、移行元のデータベース•インスタンス$I$を関手$F$に沿って整合的に受け止めていることを示す。*\
#text(
  0.8em,
)[(データベース•インスタンスについては、次以降のスライドで説明する。)]

次スライドでは、各証明の方針を説明する。

== 証明①の方針

1. RDBのスキーマを有向グラフに変換する。
2. 有向グラフを自由圏に変換する。
3. 自由圏に等式制約を加えて得られる有限表示をもつ圏を作成する。
4. 始域の圏$cal(C)$と終域の圏$cal(D)$を用意し、始域の圏から終域の圏に向かって関手$F : cal(C) -> cal(D)$を用意する。
5. 4.で目的の関手ができたので、スキーマレベル (各列の型のレベル) におけるマイグレーションにおいて、移行元スキーマの各型・各列・各等式制約に、移行先スキーマ上の対応先が存在することが示せる。

ステップ3までは、前述の通りである。

== 証明②の方針

#slide[
  1. RDBのスキーマを有向グラフに変換する。
  2. 有向グラフを自由圏に変換する。
  3. 自由圏に等式制約を加えて得られる有限表示をもつ圏を作成する。
  4. 始域の圏$cal(C)$に対して、その圏の元になったスキーマに具体的に与えられていたデータを与える。すると、圏$cal("Set")$を用いて$I : cal(C) -> cal("Set")$という集合値関手を作成できる。この集合値関手をデータベース • インスタンス (スキーマを実際のデータへ結ぶもの) とする。同様に、終域の圏$cal(D)$についてのデータベース • インスタンス$J : cal(D) -> cal("Set")$も用意する。(データベース • インスタンスは、活躍する圏論で実際に定義されている用語である。)
  5. 始域の圏$cal(C)$と終域の圏$cal(D)$を用意し、始域の圏から終域の圏に向かって関手$F : cal(C) -> cal(D)$を用意する。
]

#slide[
  6. 以下のような図式の自然変換$alpha : I => F;J$を用意する。

  #align(center, utils.fit-to-height(1fr)[
    // use the raw (unwrapped) fletcher diagram here: `fit-to-height` measures
    // its body, and measuring a touying-reduce-wrapped `diagram` corrupts its
    // reveal-step marks and crashes the compile (see globals.typ's `diagram`)
    #fletcher.diagram({
      node((0, 0), [$cal(C)$])
      node((3, 0), [$cal(D)$])
      node((0, 3), [$cal("Set")$])
      node((0, 1), text(rgb(0, 0, 0, 0))[$bullet$])
      node((2, 1), text(rgb(0, 0, 0, 0))[$bullet$])
      edge((0, 0), (0, 3), [$I$], label-side: right, "->")
      edge((0, 0), (3, 0), [$F$], label-side: left, "->")
      edge((3, 0), (0, 3), [$J$], label-side: left, "->")
      edge((0, 1), (2, 1), [$alpha$], label-side: left, "=>")
    })
  ])

  7. 6.で目的の自然変換ができたので、自然変換$alpha$の存在により、移行後のインスタンス$J$は、移行元インスタンス$I$を関手$F$に沿って整合的に受け止めていることが示された。
]

== 証明①

#slide[
  ステップ3までは、前述の通りである。\
  従って、ステップ4から証明の説明を行う。

  4. 始域の圏$cal(C)$と終域の圏$cal(D)$を用意し、関手$F : cal(C) -> cal(D)$を用意する。\
  $->$ この関手$F$の存在を示せれば、スキーマ$C$からスキーマ$D$にスーキマレベルでデータ整合したことを示せたことになる。

  関手$F: cal(C) -> cal(D)$の存在を示す。
  - 対象について
    - $F("Employee") = "Staff"$
    - $F("Department") = "Team"$
    - $F("string") = "string"$
]

#slide[
  - 射について (恒等射は恒等射に写すことを前提としている。)
    - $F("manager") = "supervisor"$
    - $F("dept") = "team"$
    - $F("description")= "profile" ; "bio"$
    - $F("note") = "memo"$

  従って、関手$F: cal(C) -> cal(D)$が存在する。\
]

#slide[
  - 等式制約に違反していなかの確認
  等式制約の圏$cal(C)$と圏$cal(D)$の対応は以下の通り。
  $
    F("Employee"."manager"."dept") & = F("Employee"."dept") \
       "Staff"."supervisor"."team" & = "Staff"."team" \
  $
  従って、3. で示した圏$cal(D)$の等式制約を満たす。

  *よって、スキーマレベル (各列の型のレベル) におけるマイグレーションにおいて、移行元スキーマの各型・各列・各等式制約に、移行先スキーマ上の対応先が存在することを示せた。*
]

== 証明②

#slide[
  ステップ3までは、前述の通りである。\
  従って、ステップ4から証明の説明を行う。

  4. 始域の圏$cal(C)$に対して、その圏の元になったスキーマに具体的に与えられていたデータを与える。すると、圏$cal("Set")$を用いて$I : cal(C) -> cal("Set")$という集合値関手を作成できる。この集合値関手をデータベース • インスタンス (スキーマを実際のデータへ結ぶもの) とする。同様に、移行先の圏$cal(D)$についてのデータベース • インスタンス$J : cal(D) -> cal("Set")$も用意する。(データベース • インスタンスは、活躍する圏論で実際に定義されている用語である。)\
  $->$ 圏$cal(C), cal(D)$に対して、それぞれデータベース • インスタンス$I: cal(C) -> cal("Set"), J: cal(D) -> cal("Set")$を用意する。
]

#slide[
  スキーマ$C$には、具体的に以下のデータが入っているとする。

  `Employee`テーブル
  #table(
    columns: 4,
    stroke: gray,
    [id (primary key)],
    [manager (primary keyを内部参照)],
    [dept (foreign key)],
    [description],

    [$e_1$], [$e_1$], [$d_1$], [LeadEngineer],
    [$e_2$], [$e_1$], [$d_1$], [BackendEngineer],
    [$e_3$], [$e_3$], [$d_2$], [Accountant],
  )

  `Department`テーブル
  #table(
    columns: 2,
    stroke: gray,
    [id (primary key)], [note],
    [$d_1$], [EngineeringTeam],
    [$d_2$], [AccountantTeam],
  )
]

#slide[
  従って、データベース • インスタンス$I$は、以下のように表せる。
  - $I("Employee") ={e_1, e_2, e_3}$ \ (`Employee` $:=$ Employeeテーブルの`id`)
  - $I("Employee"."mamanger") = {e_1 mapsto e_1, e_2 mapsto e_1, e_3 mapsto e_3}$ \ (`Employee.manager` $:=$ Employeeテーブルの`manager`)
  - $I("Employee"."dept") = {e_1 mapsto d_1, e_2 mapsto d_1, e_3 mapsto d_2}$ \ (`Employee.dept` $:=$ Employeeテーブルの`dept`)
  - $I ("Employee"."description") = {e_1 mapsto \""LeadEngineer"\", e_2 mapsto \""BackendEngineer"\", e_3 mapsto \""Accountant"\"}$ \ (`Employee.description` $:=$ Employeeテーブルの`description`)
]

#slide[
  - $I("Department") = {d_1, d_2}$ \ (`Department` $:=$ Departmentテーブルの`id`)
  - $I("Department"."note") = {d_1 mapsto \""EngineeringTeam"\", d_2 mapsto \""AccountantTeam"\"}$ \ (`Department.note` $:=$ Departmentテーブルの`note`)
]

#slide[
  スキーマ$D$には、具体的に以下のデータが入っているとする。

  `Staff`テーブル
  #table(
    columns: 4,
    stroke: gray,
    [id (primary key)],
    [supervisor (primary keyを内部参照)],
    [team (foreign key)],
    [profile (foreign key)],

    [$e_1$], [$e_1$], [$d_1$], [$p_1$],
    [$e_2$], [$e_1$], [$d_1$], [$p_2$],
    [$e_3$], [$e_3$], [$d_2$], [$p_3$],
  )

  `Profile`テーブル
  #table(
    columns: 2,
    stroke: gray,
    [id (primary key)], [bio],
    [$p_1$], [LeadEngineer],
    [$p_2$], [BackendEngineer],
    [$p_3$], [Accountant],
  )

  `Team`テーブル
  #table(
    columns: 2,
    stroke: gray,
    [id (primary key)], [memo],
    [$d_1$], [EngineeringTeam],
    [$d_2$], [AccountantTeam],
  )
]

#slide[
  従って、データベース • インスタンス$I$は、以下のように表せる。
  - $I("Employee") ={e_1, e_2, e_3}$ \ (`Employee` $:=$ Employeeテーブルの`id`)
  - $I("Employee"."mamanger") = {e_1 mapsto e_1, e_2 mapsto e_1, e_3 mapsto e_3}$ \ (`Employee.manager` $:=$ Employeeテーブルの`manager`)
  - $I("Employee"."dept") = {e_1 mapsto d_1, e_2 mapsto d_1, e_3 mapsto d_2}$ \ (`Employee.dept` $:=$ Employeeテーブルの`dept`)
  - $I ("Employee"."description") = {e_1 mapsto \""LeadEngineer"\", e_2 mapsto \""BackendEngineer"\", e_3 mapsto \""Accountant"\"}$ \ (`Employee.description` $:=$ Employeeテーブルの`description`)
]

#slide[
  - $I("Department") = {d_1, d_2}$ \ (`Department` $:=$ Departmentテーブルの`id`)
  - $I("Department"."note") = {d_1 mapsto \""EngineeringTeam"\", d_2 mapsto \""AccountantTeam"\"}$ \ (`Department.note` $:=$ Departmentテーブルの`note`)
]

#slide[
  5. 始域の圏$cal(C)$と終域の圏$cal(D)$を用意し、関手$F : cal(C) -> cal(D)$を用意する。\
  $->$ 関手$F: cal(C -> cal(D))$を作成する。 (証明①と全く同じ関手でよい。)

  関手$F: cal(C) -> cal(D)$の存在を示す。
  - 対象について
    - $F("Employee") = "Staff"$
    - $F("Department") = "Team"$
    - $F("string") = "string"$
]

#slide[
  - 射について (恒等射は恒等射に写すことを前提としている。)
    - $F("manager") = "supervisor"$
    - $F("dept") = "team"$
    - $F("description")= "profile" ; "bio"$
    - $F("note") = "memo"$
  従って、関手$F: cal(C) -> cal(D)$が存在する。\
]

#slide[
  - 等式制約に違反していなかの確認  (証明①と同じ確認をすればよい。)
  等式制約の圏$cal(C)$と圏$cal(D)$の対応は以下の通り。
  $
    F("Employee"."manager"."dept") & = F("Employee"."dept") \
       "Staff"."supervisor"."team" & = "Staff"."team" \
  $
  従って、3. で示した圏$cal(D)$の等式制約を満たす。
]

#slide[
  6. 以下のような図式の自然変換$alpha : I => F;J$を用意する。
  $->$ 5.までで用意した関手を用いて、自然変換$alpha : I => F;J$を作成する。

  コンポーネントは、圏$cal(C)$の各対象ごとに存在する。従って、以下の3つがコンポーネントとなる。\
  $alpha_("Employee") = I("Employee") -> J(F("Employee"))$ \
  $alpha_("Departmnet") = I("Department") -> J(F("Department"))$ \
  $alpha_("string") = I("string") -> J(F("string"))$ \
]

#slide[
  圏$cal(C)$には、射が4つ存在するので、それぞれの射について自然変換$alpha: I => F;J$の自然条件が成立すれば、自然変換$alpha$が存在することを示せる。なので、それを次以降のスライドで示す。
]

#slide[
  - 射$"manager": "Employee" -> "Employee"$に対する自然条件
  以下が可換図式である。\
  このように、自然条件$I("manager") ; alpha_("Employee") = alpha_"Employee" ; J("supervisor")$が成立していることがわかる。
  #align(center, utils.fit-to-height(1fr)[
    // use the raw (unwrapped) fletcher diagram here: `fit-to-height` measures
    // its body, and measuring a touying-reduce-wrapped `diagram` corrupts its
    // reveal-step marks and crashes the compile (see globals.typ's `diagram`)
    #fletcher.diagram({
      node((0, 0), [$"I(Employee)"$])
      node((3, 0), [$"I(Employee)"$])
      node((0, 2), [$"J(Staff)"$])
      node((3, 2), [$"J(Staff)"$])
      edge((0, 0), (3, 0), [$"I(manager)"$], label-side: left, "->")
      edge((3, 0), (3, 2), [$alpha_"Employee"$], label-side: left, "->")
      edge((0, 0), (0, 2), [$alpha_"Employee"$], label-side: right, "->")
      edge((0, 2), (3, 2), [$"J(supervisor)"$], label-side: right, "->")
    })
  ])
]

#slide[
  - 射$"dept": "Employee" -> "Department"$に対する自然条件
  以下が可換図式である。\
  このように、自然条件$I("dept") ; alpha_("Department") = alpha_("Employee") ; J("team")$が成立していることがわかる。
  #align(center, utils.fit-to-height(1fr)[
    // use the raw (unwrapped) fletcher diagram here: `fit-to-height` measures
    // its body, and measuring a touying-reduce-wrapped `diagram` corrupts its
    // reveal-step marks and crashes the compile (see globals.typ's `diagram`)
    #fletcher.diagram({
      node((0, 0), [$"I(Employee)"$])
      node((3, 0), [$"I(Department)"$])
      node((0, 2), [$"J(Staff)"$])
      node((3, 2), [$"J(Team)"$])
      edge((0, 0), (3, 0), [$"I(dept)"$], label-side: left, "->")
      edge((0, 0), (0, 2), [$alpha_"Employee"$], label-side: right, "->")
      edge((0, 2), (3, 2), [$"J(team)"$], label-side: right, "->")
      edge((3, 0), (3, 2), [$alpha_"Department"$], label-side: left, "->")
    })
  ])
]

#slide[
  - 射$"description": "Employee" -> "string"$に対する自然条件
  以下が可換図式である。\
  このように、自然条件$I("description") ; alpha_("string") = alpha_("Employee") ; (J("profile") ; J("bio"))$が成立していることがわかる。

  #align(center, utils.fit-to-height(1fr)[
    // use the raw (unwrapped) fletcher diagram here: `fit-to-height` measures
    // its body, and measuring a touying-reduce-wrapped `diagram` corrupts its
    // reveal-step marks and crashes the compile (see globals.typ's `diagram`)
    #fletcher.diagram({
      node((0, 0), [$"I(Employee)"$])
      node((3, 0), [$"I(string)"$])
      node((0, 2), [$"J(Staff)"$])
      node((3, 2), [$"J(string)"$])
      edge((0, 0), (3, 0), [$"I(description)"$], label-side: left, "->")
      edge((0, 0), (0, 2), [$alpha_"Employee"$], label-side: right, "->")
      edge(
        (0, 2),
        (3, 2),
        [$"J(profile)" ； "J(bio)"$],
        label-side: right,
        "->",
      )
      edge((3, 0), (3, 2), [$alpha_"string"$], label-side: left, "->")
    })
  ])
]

#slide[
  - 射$"note": "Department" -> "string"$に対する自然条件
  以下が可換図式である。\
  このように、自然条件$I("node") ; alpha_("string") = alpha_("Department") ; J("memo")$が成立していることがわかる。

  #align(center, utils.fit-to-height(1fr)[
    // use the raw (unwrapped) fletcher diagram here: `fit-to-height` measures
    // its body, and measuring a touying-reduce-wrapped `diagram` corrupts its
    // reveal-step marks and crashes the compile (see globals.typ's `diagram`)
    #fletcher.diagram({
      node((0, 0), [$"I(Department)"$])
      node((3, 0), [$"I(string)"$])
      node((0, 2), [$"J(Team)"$])
      node((3, 2), [$"J(string)"$])
      edge((0, 0), (0, 2), [$alpha_"Department"$], label-side: right, "->")
      edge((0, 2), (3, 2), [$"J(memo)"$], label-side: right, "->")
      edge((3, 0), (3, 2), [$alpha_"string"$], label-side: left, "->")
      edge((0, 0), (3, 0), [$"I(node)"$], label-side: left, "->")
    })
  ])
]

#slide[
  従って、自然変換$alpha: I => F ; J$が存在する。

  *7. 6.で目的の自然変換ができたので、自然変換$alpha$の存在により、移行後のインスタンス$J$は、移行元インスタンス$I$を関手$F$に沿って整合的に受け止めていることが示された。*

  #text(
    0.8em,
  )[(移行関手というKan拡張の理解をすると理解できるであろう関手を用いて、実際のマイグレーションの操作を行えそうだという理解をしています。しかし、現状はマイグレーション後の結果についてのデータ整合の証明しかできていません。)]
]

