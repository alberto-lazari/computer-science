#import "typst-slides/slides.typ": *
#import "typst-slides/themes/bristol.typ": *

// Path is based on the theme path
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

// Make the section name more visible and distinct from the title
#let section = name => {
  new-section([ #set text(size: 20pt, weight: "bold"); #name ])
}

#set text(font: "Arial")

#slide(theme-variant: "title slide")

#section("The history of GIF")

#slide(title: "Let's talk about GIF first")[
  - Released in 1987
  - First format for image transmission over a network
  - Provides animations and transparency
  - Indexed colors (8 bits - 256 colors)
  - Lossless compression using LZW
]

#slide(theme-variant: "wake up")[
  Everything was great#uncover(2)[, until it wasn't]
]

#slide(title: "Licensing")[
  In 1994 Unisys patented the LZW algorithm

  $=>$ _pay royalties_ to support the format #uncover(2)[(until 2004)]
]

#section("PNG's birth")

#slide(title: "Time to PING!")
