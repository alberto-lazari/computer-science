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

#slide(title: "Functions")[
]
