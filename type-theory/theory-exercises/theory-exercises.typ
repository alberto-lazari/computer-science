#set page(numbering: "1")
#set list(marker: ([•], [--]))
#let unipd-red = rgb(180, 27, 33)

#show heading.where(level: 1): it => {
  let count = counter("Heading 1")
  count.step()
  set text(size: 18pt, fill: unipd-red)
  [Exercise #count.display("1") (#it.body)]
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

#for i in range(2) {
  include "exercises/ex-" + str(i + 1) + ".typ"
}
