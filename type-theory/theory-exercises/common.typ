#import "typst-prooftree/prooftree.typ": *

#let prooftree = prooftree.with(label: (padding: 0.5em))
#let sans(txt) = $text(font: "Fira Math", txt)$
#let pi-enum(list) = {
  set enum(numbering: (..nums) => {
    let num = nums.pos()
                  .map(str)
                  .join()
    $pi_#num)$
  })
  list
}
#let exercise(
  section: (num: none, title: none),
  ex: 1,
  solution: true,
  txt
) = {
  let count = counter("Exercise")
  count.step()

  // Don't separate heading 1 from the box
  box[
    = Exercise #count.display("1")
    #box(stroke: 0.5pt, width: 100%, inset: 0.5em, [
      == #section.num #h(0.5em) #section.title
      #enum(start: ex, box(width: 100%, txt))
    ])
  ]

  if solution [
    == Solution
  ]
}

// General
#let type = $italic("type")$
#let cont = $italic("cont")$
#let el = $sans("El")$
#let pf = $bold("pf")$

#let ctx(..elements) = {
  h(0.3em)
  let context = h(0.3em)

  if elements.pos().len() > 0 {
    context = elements.pos().join[,]
  }

  $[#context]$
}

#let var = $"var)"$
#let fc = $"F-c)"$

// Singleton
#let n1 = $sans(N)_1$
#let eln1 = $el_n1$
#let n1prog = $sans(N)_(1italic("prog"))$

// Naturals
#let nat = $sans("Nat")$
#let succ = $sans("succ")$
#let elnat = $el_nat$
#let enat = $"E-"nat)$
#let fnat = $"F-"nat)$
#let c1nat = $upright(C_1)"-"nat)$
#let c2nat = $upright(C_2)"-"nat)$
#let i1nat = $upright(I_1)"-"nat)$
#let i2nat = $upright(I_2)"-"nat)$
// Use single letter variables with an explicit #
#let p = $bold(upright(p))$
#let n = $bold(upright(n))$

// Equality
#let id = $sans("Id")$
