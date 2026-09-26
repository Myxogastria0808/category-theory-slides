#import "../globals.typ": *

#show: my-theme

// keep *emphasized* strings black and fully bold in this deck only
#show strong: it => text(fill: black, weight: "bold", it.body)

#include "./sections/title.typ"

#include "./sections/toc.typ"

#include "./sections/section1.typ"
