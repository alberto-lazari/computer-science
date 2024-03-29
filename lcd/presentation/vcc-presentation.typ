#import "@preview/polylux:0.3.1": *
#import "theme.typ": *

#set text(font: "Roboto")

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

#new-section-slide[Begin]

#slide(title: [With a title])[
  Some content

  This is a list:
  - with items
]

#slide(title: [Another one])[
  Hello
]
