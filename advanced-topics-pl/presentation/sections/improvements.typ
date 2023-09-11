#import "/common.typ": *

#new-section("Improvements")

#slide(title: "Syntax")[
  #line-by-line(mode: "transparent")[
    - LaTeX inconsistent syntax for implementation reasons: \
      ```latex \command{...}``` vs ```latex \begin{command} ... \end{command}```
    - TeX can alter and create syntax:
      #{
        only(1)[```$x + y\]```]
        only("2-")[```latex $x + y\]```]
      }
    - Typst has a well-defined syntax
  ]
]
