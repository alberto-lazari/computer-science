#import "/common.typ": *

#new-section("Markup mode")

#slide(title: "Markup mode")[
  - Default syntax mode
  #show: pause(2)
  - Syntactic sugar for function calls
  #grid(
    columns: (1fr, auto, 1fr),
    gutter: 3em,
    example([
        ```typst
        = Title

        *List* with:
        - _item_
        ```
      ],
      size: .85em
    ),
    [#v(2.5em) $<==>$],
    example([
        ```typst
        #{
          heading("Title"); parbreak()
          text(strong("List") + " with:")
          list(emph("item"))
        }
        ```
      ],
      size: .85em
    )
  )
]

#slide(title: "Content type")[
  #grid(
    columns: (1fr, 1fr),
    [
      #line-by-line(mode: "transparent")[
        - Tree of content elements
        - From functions or markup
        - Document as join of all returned contents
      ]
    ],
    example[
      ```typst
      #let content = [_example_ *text*]
      This is the content: "#content" \
      Representation: #repr(content)
      ```
    ]
  )
]
