#set page(numbering: "1")
#set heading(numbering: "1.1.A.")
#set list(marker: ([•], [--]))

#let make_title(title: none, author: none, course: none, date: none) = {
  align(center, text(size: 25pt, title))
  align(center, text(size: 18pt, author))
  align(center, text(size: 18pt, course))
  align(center, text(size: 18pt, date))
}

#v(10em)
#figure(image("images/unipd-logo.png", width: 50%))
#v(3em)

#make_title(
  title: "Advanced Topics in Computer Science\nTrustworthy AI report",
  author: "Alberto Lazari - 2089120",
  course: "Computer Science – Other training activities",
  date: "June 2023",
)
#pagebreak()

= Introduction
The aim of this report is to give a simple summary of the 2020 paper "Interpretable and Differentially Private Predictions", from F. Harder, M. Bauer and M. Park, and later make some considerations on the broader trustworthy AI context of the ideas proposed in the paper.
Finally, some personal critical thoughts on the topic are left.

= Paper
#include "paper.typ"

= About broader trustworthy AI context
#include "trustworthy-ai.typ"

= Personal evaluation
#include "personal.typ"
