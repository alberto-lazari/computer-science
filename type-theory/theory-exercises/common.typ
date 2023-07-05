#import "typst-prooftree/prooftree.typ": *

#let type = $italic("type")$
#let cont = $italic("cont")$
#let N1 = $upright(text(font: "Fira Math", N)_1)$
#let El = $text(font: "Fira Math", "El")_N1$
#let N1prog = $upright(text(font: "Fira Math", N)_(1italic("prog")))$

#let ctx(..context) = {
  h(0.3em)
  $[#context.pos().join[,]]$ }
