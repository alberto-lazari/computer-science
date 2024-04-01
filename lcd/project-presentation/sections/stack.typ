#import "/common.typ": *

#new-section-slide[Technological stack]
#slide(title: [Programming language])[
  Choice: OCaml

  Widely used ML dialect
  #pause

  === #text(green)[Pros]
  - Pattern matching!
  #pause
  - I know ML
  #pause
  - Popular parser generators available
]

#slide(title: [Parser generator])[
  OCaml versions of lex and yacc available
  - ocamllex, the standard
  - Menhir, more recent twist on ocamlyacc
]

#slide(title: [Package manager])[
  - Language setup with `opam init`
  - Project build and installation with `opam install .`
  - Powerful build system with Dune
]
