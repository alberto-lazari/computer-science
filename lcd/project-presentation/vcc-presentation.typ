#import "/common.typ": *

#set text(font: "Roboto")

#show raw: itself => { set text(font: "Menlo"); itself }
// Add background to monospace text
#show raw.where(block: false): box.with(
  fill: luma(220),
  inset: (x: 5pt, y: 0pt),
  outset: (y: 10pt),
  radius: 10pt,
)
#show raw.where(block: true): it => { set text(size: .7em); it }
#show raw.where(block: true): block.with(
  fill: luma(220),
  inset: 10pt,
  radius: 10pt,
)


#show: theme.with(
  short-title:  [vCCS compiler],
  footer:       [Alberto Lazari -- LCD exam project],
  logo:         image("unipd-logo.png"),
)

#title-slide(
  title:    [Value-passing CCS Compiler],
  subtitle: [Languages for Concurrency and Distribution exam project],
  authors:  [Alberto Lazari],
  date:     [April 4, 2024]
)

#include "sections/syntax.typ"
#include "sections/components.typ"
#include "sections/stack.typ"
#include "sections/implementation.typ"
#include "sections/encoder.typ"

#focus-slide[
  Demo time!
]
