#import "@preview/polylux:0.3.1": *
#import "theme.typ": *

#let inline-rule(name, ..cases) = {
  let space = .5em
  $name ::= #h(space) #cases.pos().join[#h(space) | #h(space)]$
}

#let rule(name, first, ..cases, inline: false) = {
  if(inline) { inline-rule(name, first, ..cases) }
  else {
    set par(leading: .5em)
    let cases = cases.pos().map(case =>
      $& #h(.45em) | & case \ $
    )
    $name & ::= & first \ cases.join()$
  }
}

#let nil = $Ø$
#let tick = "'"
