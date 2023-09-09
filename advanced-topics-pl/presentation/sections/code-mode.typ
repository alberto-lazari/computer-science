#import "/common.typ": *

#new-section("Code mode")

#slide(title: "Type system")[
  - Dynamic typing
  - Few implicit conversions (`string` $->$ `content`)
  - No custom types
  - No subtyping
]

#slide(title: "Types")[
  - `content` $tilde.eq top$ #show: pause(2); ($eq.not$ `any`)
  #line-by-line(start: 3)[
    - `none` $=$ $bot$
    - programming (`integer`, `boolean`, `string`, `function`, ...)
    - data structures (`array`, `dictionary`)
    - styling (`length`, `angle`, `color`, ...)
  ]
]

#slide(title: "Unique copies")[
  No _reference_ types, only _value_ types

  #align(center, block(width: 40%, example[
    ```typst
    #let array = (1, 2, 3)
    #let copy = array
    #copy.push(4)
    Array = #array \
    Copy = #copy
    ```
  ]))
]

#slide(title: "Functions")[
  #line-by-line[
    - First class values
    - Closures
    - Pure (user-defined)
  ]
]

#slide(title: [Functions -- examples])[
  #let example = example.with(size: .8em)
  #align(center, grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    example(caption: "Closure")[
      ```typst
      #{
        let var = 1
        let f(x) = { x + var }
        var = 10
        f(1)
      }
      ```
    ],
    {
      show: pause(2)
      example(caption: "Pure", error: "variables from outside the function are read-only and cannot be modified")[
        ```typst
        #{
          let var = 1
          let g() = { var += 1 }
          g()
        }
        ```
      ]
    },
    {
      show: pause(3)
      example(caption: "First class value")[
        ```typst
        #{
          let curried-map = f => (..l) => {
            l.pos().map(f)
          }
          curried-map(x => x + 1)(0, 1, 2)
        }
        ```
      ]
    },
  ))
]

#slide(title: [Functions -- recursive let binding])[
  #align(center, grid(
    columns: (1fr, 1fr),
    gutter: 1.5em,
    example[
      ```typst
      #{
        let map(f, ..items) = {
          let list = items.pos()
          if list.len() == 0 { return list }

          let (x, ..rest) = list
          ( f(x), ..map(f, ..rest) )
        }
        map(x => x + 1, 0, 1, 2)
      }
      ```
    ],
    {
      only(1)[
        #example(error: "unknown variable: rec")[
          ```typst
          #{
            let map = f => (..items) => {
              let list = items.pos()
              if list.len() == 0 { return list }

              let (x, ..rest) = list
              ( f(x), ..rec(f)(..rest) )
            }
            map(x => x + 1)(0, 1, 2)
          }
          ```
        ]
      ]
      only(2)[
        #example[
          ```typst
          #{
            let map = rec => f => (..items) => {
              let list = items.pos()
              if list.len() == 0 { return list }

              let (x, ..rest) = list
              ( f(x), ..rec(rec)(f)(..rest) )
            }
            map(map)(x => x + 1)(0, 1, 2)
          }
          ```
        ]
      ]
    }
  ))
]

#slide(title: "Performance")

#slide(title: "Parameters")
