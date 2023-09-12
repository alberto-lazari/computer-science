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
  - TeX's interactive error correction
  - Well-defined syntax
  - Type system
]

#slide(title: [Error reporting -- interactive correction])[
  #show raw: it => { set text(size: .8em); it }
  #grid(columns: (2fr, 3fr), gutter: 2em,
    align(center + horizon)[
      LaTeX
      ```
      $x + y
      Missing $ inserted.
      ```
    ],
    align(center + horizon)[
      Typst
      ```
      $x + y
            ^
      expected closing dollar sign
      ```
    ],
  )
]

#slide(title: [Error reporting -- syntax])[
  #grid(columns: (1fr, 1fr), gutter: 2em,
    align(center + horizon)[
      LaTeX
      #set text(size: .7em)
      ```latex
      \section
      Missing \endcsname inserted.
      Missing \endcsname inserted.
      Missing \endcsname inserted.
      ...
      ```
    ],
    align(center + horizon)[
      Typst
      #example(error: "missing argument: body
   ┌─ /sections/improvements.typ:94:16
   │
94 │         #heading()
   │                 ^^                ")[
        ```typst
        #heading()
        ```
      ]
    ],
  )
]

#slide(title: [Error reporting -- type system])[
  #grid(columns: (1fr, 1fr), gutter: 2em,
    align(center + horizon)[
      LaTeX
      #set text(size: .7em)
      ```latex
      \baselineskip=normal
      Missing number, treated as zero.
      Illegal unit of measure (pt inserted).
      ```
    ],
    align(center + horizon)[
      Typst
      #example(error: "expected length, found string
   ┌─ /sections/improvements.typ:70:24
   │
70 │       #set par(leading: \"normal\")
   │                         ^^^^^^^^   ")[
        ```typst
        #set par(leading: "normal")
        ```
      ]
    ],
  )
]

#slide(title: "Computational foundations")[
  #only(1, [No data structures in tex #sym.arrow.double provides a package for everything] + grid(columns: (1fr, 1fr), gutter: 2em,
    align(center + horizon)[
      LaTeX
      ```latex
      \usepackage{trimspaces}
      \trim@post@space{Text  }
      ```
    ],
    align(center + horizon)[
      Typst
      ```typst
      #{ "Text  ".trim(at: end) }
      ```
    ]
  ))

  #show raw: it => { set text(size: .7em); it }
  #only(2, grid(columns: (1fr, 1fr), gutter: 2em,
    align(center + horizon)[
      LaTeX
      ```latex
      \usepackage{listofitems}
      \def\tabelize#1{
        \readlist\animals{#1}
        \begin{table}
          \textbf{Animal} \\
          \foreachitem\a\in\animals{
            \a \\
          }
        \end{table}
      }
      ```
    ],
    align(center + horizon)[
      Typst
      ```typst
      #let tabelize(str) = {
        let animals = str.split(", ")
        table([*Animal*], ..animals)
      }
      #tabelize("Tiger, Giraffe, Cougar")
      ```
    ]
  ))

  #only(3, grid(columns: (1fr, 1fr), gutter: 2em,
    align(center + horizon)[
      LaTeX
      ```latex
      \newcount\i \i=0
      \loop
        \advance \i by 1
        Variable i = \the\i
      \ifnum \i<5 \repeat
      ```
    ],
    align(center + horizon)[
      Typst
      ```typst
      #let i = 0
      #while i < 5 {
        i += 1
        [Variable i = #i]
      }
      ```
    ]
  ))
]
