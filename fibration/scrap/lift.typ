#set page(fill: none, width: auto, height: auto, margin: 5pt)
#import "@preview/fletcher:0.5.7" as fletcher: diagram, edge, node

#align(center, diagram({
  node((0, 0), [$y$])
  node((2, 0), [$x$])
  node((2, 2), [$F(x)$])
  node((0, 2), [$b=F(y)$])
  edge((0, 2), (2, 2), [$f=F(g)$], label-side: right, "->")
  edge((0, 0), (2, 0), [$g$], label-side: left, "->")
  edge((2, 0), (2, 2), "|->")
  edge((0, 0), (0, 2), "|->")
}))

