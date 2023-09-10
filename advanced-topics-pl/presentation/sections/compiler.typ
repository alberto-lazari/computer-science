#import "/common.typ": *

#new-section("Compiler")

#slide[
  Steps to compile source files to PDF:
  #uncover(1, mode: "transparent")[
    + Parsing
  ]
  #uncover("1-2")[
    2. Evaluation
  ]
  #uncover(1, mode: "transparent")[
    3. Lifting
    +  Layout
    +  Export
  ]
]

#slide(title: "Evaluation")[
  No syntax errors $=>$ evaluation can happen:
  #line-by-line(start: 2, mode: "transparent")[
    1. Joined content value
    2. Top level bindings
  ]
]

#slide(title: [Evaluation -- markup])[
  #line-by-line(mode: "transparent")[
    - Markup nodes $->$ `content`
    - Code blocks evaluated to final value (joined) $->$ `content`
    - Everything joined in the process
  ]
]

#slide(title: [Evaluation -- bindings])[
  When evaluating a ```typst #let``` binding:
  - Store `(name, value)` in the scope #uncover(2)[(closures are values)]
  - Return `none`
]

#slide(title: [Evaluation -- bindings])[
  Closures can't be statically checked (only syntax)

  #only(1, example(error: "expected equals sign
   ┌─ /sections/compiler.typ:67:16
   │
67 │         let g(x)(y) = { x + y }
   │                 ^              "
  )[
    ```typst
    #let f() = {
      let g(x)(y) = { x + y }
    }
    ```
  ])
  #only(2, grid(columns: (auto, auto), gutter: 2em,
    example[
      ```typst
      #let x = 0
      #let val() = {
        x += 1
      }
      This compiles fine
      ```
    ],
    example(error: "variables from outside the function are read-only and cannot be modified")[
      ```typst
      #let x = 0
      #let val() = {
        x += 1
      }
      #val()
      ```
    ],
  ))
  #only(3, grid(columns: (auto, auto), gutter: 2em,
    example(error: "variables from outside the function are read-only and cannot be modified")[
      ```typst
      #let x = 0
      #let val() = {
        x += 1
      }
      #val()
      ```
    ],
    example[
      ```typst
      #let x = 0
      #let val = {
        x += 1
      }
      #x
      ```
    ],
  ))
]

#slide(title: "Modules")[
]
