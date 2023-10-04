#set page(numbering: "1")
#set list(marker: ([•], [◦], [--]))
#let unipd-red = rgb(180, 27, 33)

#set heading(numbering: "1.1.")
#show heading.where(level: 1): it => {
  set text(fill: unipd-red)
  it
}

#show outline.entry.where(level: 1): it => {
  v(1em, weak: true)
  strong(it)
}

#let make_title(title: none, subtitle: none, author: none, date: none) = align(center, [
    #text(size: 30pt, weight: "bold", fill: unipd-red, smallcaps(title)) \
    #v(5pt)
    #text(size: 25pt, weight: "bold", fill: unipd-red, subtitle)

    #set text(size: 18pt)
    #author

    #date
  ]
)

// Comment-style lecture number annotation (# Lecture n)
#let lecture(number) = {
  set text(gray)
  [\# Lecture #number]
}

#set text(font: "Arial")

#v(10em)
#figure(image("images/unipd-logo.png", width: 50%))
#v(3em)

#make_title(
  title:    [Game theory],
  subtitle: [Notes],
  author:   [Alberto Lazari],
  date:     [I Semester A.Y. 2023-2024],
)
#pagebreak()

#outline(
  title: "Index",
  indent: 2em,
)

#lecture[1 -- 04/10]
= Exam
- Written test (0-28 pts)
- Extra points:
  + No project (3 free points)
  + Group project (up to 5 pts)
- Score $>=$ 31 $=>$ 30L

= Decision problems
Can be represented with *decision trees*

== 1-player problems
#let pref = $eq.succ$
/ Preference: $a pref b -->$ $a$ is preferred over $b$

Properties:
- Complete: either $a pref b$ or $b pref a$
- Transitive: $a pref b$ and $b pref c => a pref c$
- Congruence on utility functions: $u(a) >= u(b) => a pref b$

/ Rational player: player that maximizes its utility function

== Decision trees
- Nodes are choices
- Leaves are payoffs of the choice (value/preference)

Payoffs are the sum of the results of utility function.
They basically represent the preference of a specific choice (the input)
