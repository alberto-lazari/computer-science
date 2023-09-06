#import "typst-slides/slides.typ": *
#import "typst-slides/themes/bristol.typ": *

#let unipd-red = rgb(178, 14, 16)

// Make the section name more visible and distinct from the title
#let new-section = name => new-section[
  #set text(size: 20pt, weight: "bold")
  #v(.5em)
  #name
]

// Custom wake up
#let wake-up = content => {
  set align(center)
  set text(weight: "bold")
  slide(theme-variant: "wake up")[#content]
}
