#import "/common.typ": *

#new-section("Markup mode")

#slide[
  - Default syntax mode
  #show: pause(2)
  - Syntactic sugar for function calls
  #grid(
    columns: (1fr, auto, 1fr),
    gutter: 3em,
    example[
      ```typst
      = Title

      *List* with:
      - _item_
      ```
    ],
    [#v(3.5em) $<==>$],
    example[
      ```typst
      #{
        heading("Title"); parbreak()
        text(strong("List") + " with:")
        list(emph("item"))
      }
      ```
    ],
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

#slide(title: "Problem")[
  #set text(size: .85em)
  + Everything is a function call
  + Functions are expressions

  #show: pause(2)
  #sym.arrow.double Final document needs to be a series of `content` values

  #show: pause(3)
  #grid(
    columns: (2fr, 3fr),
    [Solution: explicitly join every single one?],
    example(size: .75em)[
      ```typst
      #let document = {
        emph("This ") + [is a test to ] + text(fill: red, "join ") + [eveything]
      }
      #document
      ```
    ]
  )
]

#slide(title: "Joining")[
  #grid(
    columns: (auto, auto),
    gutter: 2em,
    [
      - Every line returns a value (or `none`)
      - A block returns the join of every generated value
      #uncover(2)[- Conditionals and loops are expressions too]
    ],
    {
      only(1, example[
        ```typst
        #let document = {
          emph("This ")
          [is a test to ]
          text(fill: red, "join ")
          [eveything]
        }
        #document
        ```
      ])
      only(2, example[
        ```typst
        #for x in (1, 2, 3) [
          - #x #if x == 1 [ (first) ]
        ]
        ```
      ])
    }
  )
]
