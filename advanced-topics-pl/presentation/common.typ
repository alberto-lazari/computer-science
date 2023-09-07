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

#let latex = text(
  font: "New Computer Modern",
  upper[l#h(-.35em)#super(baseline: -.25em, size: 0.74em, "a")#h(-.15em)t#h(-.13em)#sub(size: 1em, baseline: .23em, "e")#h(-.12em)x]
)
