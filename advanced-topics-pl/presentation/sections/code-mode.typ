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
  #let example = example.with(size: .8em)
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
      only(2)[
        #example(error: "unknown variable: map")[
          ```typst
          #{
            let map = f => (..items) => {
              let list = items.pos()
              if list.len() == 0 { return list }

              let (x, ..rest) = list
              ( f(x), ..map(f)(..rest) )
            }
            map(x => x + 1)(0, 1, 2)
          }
          ```
        ]
      ]
      only(3)[
        #example[
          ```typst
          #{
            let map = {
              let rec = map => f => (..items) => {
                let list = items.pos()
                if list.len() == 0 { return list }

                let (x, ..rest) = list
                ( f(x), ..map(map)(f)(..rest) )
              }
              rec(rec)
            }
            map(x => x + 1)(0, 1, 2)
          }
          ```
        ]
      ]
    }
  ))
]

#slide(title: "Parameters")[
  #line-by-line[
    - Positional: ```typst #f(x, y)```
    - Currying (not idiomatic): ```typst #g(x)(y)```
    - Variadic: ```typst #let h(..args) = { ... }```
    - Named: ```typst #text("hello", color: red)```
  ]
]

#slide(title: "Named parameters")[
  #set text(size: .7em)
  #grid(
    columns: (3fr, 4fr),
    [
      = Typst
      ```typst
      #text(color: red, "text")
      // Order-independent
      #text("text", color: red)
      // Optional
      #text("text")
      ```
    ],
    uncover(2)[
      = #latex
      ```latex
      \inputminted[lineos, bgcolor=gray]{rust}{ex.rs}
      % Order-independent
      \inputminted[bgcolor=gray, lineos]{rust}{ex.rs}
      % Optional
      \inputminted{rust}{ex.rs}
      ```
    ]
  )
]

#slide(title: [#latex -- optional parameters])[
  #set text(size: .7em)
  #grid(
    columns: (2fr, 1fr, 2fr),
    gutter: 1em,
    [
      #v(1.5em)
      ```latex
      \newcommand{\mysum}[2][n]{
        \sum_{i = 0}^#1 #2
      }
      $$
        \mysum{x_i}
        \mysum[\infty]{x_i}
      $$
      ```
    ],
    { v(5em); align(center, $==>$) },
    example[
      ```typst
      #let mysum(exp, limit: $n$) = {
        $sum_(i = 0)^limit exp$
      }
      $
        #mysum($x_i$)
        #mysum($x_i$, limit: $infinity$)
      $
      ```
    ]
  )
]

#slide(title: [#latex -- multiple optional parameters])[
  #set text(size: .6em)
  #grid(
    columns: (3fr, 1fr, 5fr),
    gutter: 1em,
    [
      #v(2em)
      ```latex
      % Missing { inserted.
      \newcommand{\mysum}[3][i][n]{
        \sum_{#1 = 0}^#2 #3
      }
      $$
        \mysum{x_i}
        \mysum[j][\infty]{x_j}
      $$
      ```
    ],
    { v(6em); align(center, $==>$) },
    example[
      ```typst
      #let mysum(exp, index: $i$, limit: $n$) = {
        $sum_(index = 0)^limit exp$
      }
      $
        #mysum($x_i$)
        #mysum($x_j$, index: $j$, limit: $infinity$)
      $
      ```
    ]
  )
]

#slide(title: "Partial application")[
  #let example = example.with(size: .8em)
  #example[
    ```typst
    #{
      let mysum(exp, index: $i$, limit: $n$) = $sum_(index = 0)^limit exp$

      mysum = mysum.with(limit: $infinity$)
      $ #mysum($x_i$) $

      let mysum = mysum.with(limit: $4$, index: $x$)
      $ #mysum($x$) = 0 + 1 + ... + 4 = 10 $
    }
    ```
  ]
]
