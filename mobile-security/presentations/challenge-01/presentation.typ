#import "common.typ": *

#show: slides.with(
  authors:        [Alberto Lazari],
  short-authors:  [Alberto Lazari],
  title:          [FileHasher],
  subtitle:       [Mobile security -- Challenge 01],
  short-title:    [#v(.5em) The Typst language],
  date:           [October 13, 2023],
  theme: bristol-theme(
    color:      unipd-red,
    logo:       "/images/unipd-logo.png",
    // Don't use watermarks, by using a blank image (`none` can't be used)
    watermark:  "/images/blank.png",
    secondlogo: "/images/blank.png",
  )
)

#set text(font: "Arial")

#show raw: itself => {
  set text(font: "Menlo")
  itself
}
// Add background to monospace text
#show raw.where(block: false): box.with(
  fill: luma(220),
  inset: (x: 3pt, y: 0pt),
  outset: (y: 8pt),
  radius: 4pt,
)
#show raw.where(block: true): block.with(
  fill: luma(220),
  inset: 10pt,
  radius: 10pt,
)

#show figure: itself => {
  set text(size: 16pt)
  itself
}

#slide(theme-variant: "title slide")
