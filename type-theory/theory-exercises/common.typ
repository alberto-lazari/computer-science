#import "typst-prooftree/prooftree.typ": *

#let prooftree = prooftree.with(label: (padding: 0.5em))

#let type = $italic("type")$
#let cont = $italic("cont")$
#let N1 = $upright(text(font: "Fira Math", N)_1)$
#let El = $text(font: "Fira Math", "El")_N1$
#let N1prog = $upright(text(font: "Fira Math", N)_(1italic("prog")))$

#let ctx(..elements) = {
  h(0.3em)
  let context = h(0.3em)

  if elements.pos().len() > 0 {
    context = elements.pos().join[,]
  }

  $[#context]$
}
