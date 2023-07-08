#set page(numbering: "1")
#set list(marker: ([•], [◦], [--]))
#let unipd-red = rgb(180, 27, 33)

#show heading.where(level: 1): it => {
  set text(size: 18pt, fill: unipd-red)
  [#it.body]
  v(5pt)
}

#let make_title(title: none, subtitle: none, author: none, date: none) = align(center, [
    #text(size: 35pt, weight: "bold", fill: unipd-red, smallcaps(title)) \
    #v(5pt)
    #text(size: 25pt, weight: "bold", fill: unipd-red, subtitle)

    #set text(size: 18pt)
    #author

    #date
  ]
)

#v(10em)
#figure(image("images/unipd-logo.png", width: 50%))
#v(3em)

#make_title(
  title:    [Type Theory],
  subtitle: [Theory exercises],
  author:   [Alberto Lazari],
  date:     [II Semester A.Y. 2022-2023],
)
#pagebreak()

#include "exercises/singleton.typ"
#include "exercises/natural-numbers.typ"
#include "exercises/equality.typ"
#include "exercises/extra.typ"
