#import "@preview/polylux:0.3.1": *
#import "theme.typ": *

#let inline-rule(name, ..cases) = {
  let space = .5em
  $name ::= #h(space) #cases.pos().join[#h(space) | #h(space)]$
}
#let rule(name, first, ..cases, inline: false) = {
  if(inline) { inline-rule(name, first, ..cases) }
  else {
    set par(leading: .4em)
    let cases = cases.pos().map(case =>
      $& #h(.45em) | & case \ $
    )
    $name & ::= & first \ cases.join()$
  }
}

#let case(rule, first, ..cases) = {
  set par(leading: .4em)
  let cases = cases.pos().map(case =>
    $& #h(.25em) | & case \ $
  )
  $"case" rule & = & first \ cases.join()$
}

#let to = {
  h(.5em)
  sym.arrow
  h(.5em)
}

#let encode(..elements) = {
  let exp = $space$

  if elements.pos().len() > 0 {
    exp = elements.pos().join[,]
  }

  $[| space.punct exp space.punct |]$
}

#let nil = $Ø$
#let tick = "'"
#let evale = $"eval"_e$
#let evalb = $"eval"_b$
