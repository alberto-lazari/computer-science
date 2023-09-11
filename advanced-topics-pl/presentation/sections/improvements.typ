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

#slide(title: "Macros")[
  - Simpler and immediate #sym.arrow more intuitive
  - No scoping #sym.arrow side effects and package conflicts
]

#slide(title: "Error reporting")[
]

#slide(title: "Computational foundations")[
]
