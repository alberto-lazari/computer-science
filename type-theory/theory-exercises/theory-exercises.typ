#set page(numbering: "1")
#set list(marker: ([•], [--]))
#let unipd-red = rgb(180, 27, 33)

#show heading: it => {
  set text(fill: unipd-red)
  underline(it)
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
  author:   [Alberto Lazari -- 2089120],
  date:     [II Semester A.Y. 2022-2023],
)
#pagebreak()

#let N1 = $upright(text(font: "Fira Math", N)_1)$
#let El = $text(font: "Fira Math", "El")_N1$

= Section 3.1 -- Ex 3
"Show that the rule E-S) is derivable in the type theory $T_1$ replacing the rule ES) elimination with the E-$upright(text(font: "Fira Math", N)_(1italic("prog"))) )$ rule and adding the substitution and weakening rules and the sanitary checks rules set out in the previous sections."
