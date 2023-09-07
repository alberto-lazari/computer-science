#import "/common.typ": *

#new-section("Typst")

#slide(title: "The Typst language")[
  #line-by-line(mode: "transparent")[
    - Open source typesetting system
    - Lightweight syntax
    - Functional programming language
    - Fast compile times for instant preview
  ]
]

#slide(title: "Syntax modes")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1.5em,
    example(
      [
        ```typst
        = Example

        Some _text_ in *markup*
        ```
      ],
      caption: "Markup mode"
    ),
    uncover((2, 3))[#example(
      [
        ```typst
        If $n in NN$, then:
        $ sum_(i = 0)^n k x_i $
        ```
      ],
      caption: "Math mode"
    )],
    uncover(3)[#example(
      [
        ```typst
        #{
          let f = x => y => x + y
          f(1)(2)
        }
        ```
      ],
      caption: "Code mode"
    )]
  )
]
