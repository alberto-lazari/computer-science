#import "typst-prooftree/prooftree.typ": *

#let prooftree = prooftree.with(label: (padding: 0.3em))
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
      == #section.num #h(0.6em) #section.title
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
#let El = $sans("El")$
#let pf = $bold("pf")$

#let ctx(..elements) = {
  h(0.3em)
  let context = $space$

  if elements.pos().len() > 0 {
    context = elements.pos().join[,]
  }

  $[#context]$
}

#let var = $"var)"$
#let Fc = $"F-c)"$

// Singleton
#let N1 = $sans(upright(N))_1$
#let ElN1 = $El_N1$
#let N1prog = $sans(upright(N))_(1italic("prog"))$

#let FS = $"F-S)"$
#let IS = $"I-S)"$
#let ES = $"E-S)"$

// Naturals
#let Nat = $sans("Nat")$
#let succ = $sans("succ")$
#let ElNat = $El_Nat$

#let ENat = $"E-"Nat)$
#let FNat = $"F-"Nat)$
#let C1Nat = $upright(C_1)"-"Nat)$
#let C2Nat = $upright(C_2)"-"Nat)$
#let I1Nat = $upright(I_1)"-"Nat)$
#let I2Nat = $upright(I_2)"-"Nat)$
// Use single letter variables with an explicit #
#let p = $bold(upright(p))$
#let n = $bold(upright(n))$

// Equality
#let Id = $sans("Id")$
#let id = $sans("id")$
#let ElId = $El_Id$

#let z1 = $z_1$
#let z2 = $z_2$
#let z3 = $z_3$
#let v1 = $v_1$
#let v2 = $v_2$
#let v3 = $v_3$

#let FId = $"F-"Id)$
#let IId = $"I-"Id)$
#let EId = $"E-"Id)$

// Extra
#let fa(..elements) = {
  elements
    .pos()
    .map(e => [$forall_(#e)$])
    .join[$space$]

  $space$
}
#let ex(..elements) = {
  elements
    .pos()
    .map(e => [$exists_(#e)$])
    .join[$space$]

  $space$
}
#let to = $space -> space$
#let amp = $space "&" space$
#let tr = $italic("true")$
#let x1 = $x_1$
#let x2 = $x_2$
#let y1 = $y_1$
#let y2 = $y_2$

#let q = $bold(upright(q))$
