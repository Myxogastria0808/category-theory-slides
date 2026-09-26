#set page(fill: none, width: auto, height: auto, margin: 5pt)
#import "@preview/fletcher:0.5.7" as fletcher: diagram, edge, node

#align(center, diagram({
  node((0, 0), [$c$])
  node((0, 2), [$F(c)=0$])
  node((3, 2), [$F(e) (=1)$])
  node((3, 0), [$e$])
  edge((0, 0), (0, 2), "|->")
  edge((3, 0), (3, 2), "|->")
  edge((0, 2), (3, 2), [$F(g_("ce"))=f$], label-side: right, "->")
  edge((0, 0), (3, 0), [$g_("ce")$], label-side: left, "->")
}))

