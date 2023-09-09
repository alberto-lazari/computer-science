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
    example(caption: "Markup mode")[
      ```typst
      = Example

      Some _text_ in *markup*
      ```
    ],
    {
      show: pause(2)
      example(caption: "Math mode")[
        ```typst
        If $n in NN$, then:
        $ sum_(i = 0)^n k x_i $
        ```
      ]
    },
    {
      show: pause(3)
      example(caption: "Code mode")[
        ```typst
        #{
          let f = x => y => x + y
          f(1)(2)
        }
        ```
      ]
    },
  )
]
