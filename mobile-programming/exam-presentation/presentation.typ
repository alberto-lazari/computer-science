#import "typst-slides/slides.typ": *
#import "typst-slides/themes/bristol.typ": *

// Path is based on theme path
#let img-dir = "../../images/"

#show: slides.with(
  authors: "Alberto Lazari - 2089120",
  short-authors: "Alberto Lazari",
  title: "The PNG format for digital images encoding",
  subtitle: "Mobile Programming & Multimedia exam presentation",
  short-title: "The PNG format",
  date: "June 26, 2023",
  theme: bristol-theme(
    color: rgb(178, 14, 16),
    logo: img-dir + "unipd-logo.png",
    watermark: img-dir + "blank.png",
    secondlogo: img-dir + "blank.png",
  )
)

#set text(font: "Arial")

#slide(theme-variant: "title slide")

#new-section("GIF")

#slide(title: "Let's talk about GIF first")[
  I gotta introduce GIF first, because it is important
]
