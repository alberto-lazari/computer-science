#import "/common.typ": *

#new-section("Markup languages")
#slide(title: "Procedural markup")[
  #line-by-line(start: 2, mode: "transparent")[
    - Basic built-in commands for simple actions
    - Macros for complex procedures
  ]
]

#slide(title: "Troff")[
  #grid(
    columns: (1fr, 1fr),
    [
      - Early typesetting system
      - Imperative and strictly procedural
    ],
    [
      ```troff
      .ce
      This is a single centered line
      .LP
      .ce 3
      followed by
      a sequence of three (3)
      centred lines
      ```
    ],
  )
]

#slide(title: tex)[
  #grid(
    columns: (4fr, 3fr),
    [
      - Smart line breaks
      - Advanced layout algorithms
      #show: pause(2)
      - Still procedural
    ],
    [
      #set text(size: 10.5pt)
      ```tex
      \magnification=\magstep1
      \baselineskip=12pt
      \hsize=6.3truein
      \vsize=8.7truein
      \font\footbf=cmbx10 at 8truept

      \font\bigrm=cmr12 at 14pt
      \centerline{\bigrm The title}

      \bigskip\bigskip
      \centerline{\bf Abstract}
      \smallskip
      {\narrower\noindent
      The abstract.\par}

      \bigskip
      \beginsection 1. Introduction.

      This is the start of the introduction.
      \bye
      ```
    ],
  )
]

#slide(title: "Descriptive markup")[
  #line-by-line(start: 2, mode: "transparent")[
    - Structure rather than appearance
    - Same structure, different styling
    - Reusability
    - Less boilerplate
  ]
]

#slide(title: latex)[
  #grid(
    columns: (2fr, 1fr),
    [
      #line-by-line(mode: "transparent")[
        - Set of useful #tex macros
        - _Describe content_ vs. _describe output_
        - Document class for the style
      ]
    ],
    [
      #set text(size: 16pt)
      ```latex
      \documentclass{article}
      \begin{document}

      \section{Introduction}
      This is a simple example

      \begin{itemize}
        \item First item
        \item Second item
      \end{itemize}

      \end{document}
      ```
    ],
  )
]

#slide(title: "Markdown")[
  #grid(
    columns: (4fr, 3fr),
    [
      #line-by-line(mode: "transparent")[
        - Lightweight syntax for more powerful language (HTML)
        - Intuitive
        - Limited
      ]
    ],
    [
      #set text(size: 18pt)
      ```markdown
      # Markdown
      Text can be *emphasized* or **strong**.
      Here is a [link](https://github.com)

      Plain text is:
      - Simple to write
      - Easy to read
      ```
    ],
  )
]
