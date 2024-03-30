#import "/common.typ": *

#new-section-slide[Compiler components]
#slide(title: [Architecture])[
  - vCCS parser
  - CCS interface
  - vCCS to CCS encoder
  - vCCS encoding utilities
]

#slide(title: [vCCS parser])[
  Classic components to parse a language
  - Abstract syntax tree (AST)
  - Parser
  - Lexer
]

#slide(title: [CCS interface])[
  Basic CCS support for the encoder results
  - AST
  - Pretty printer
]

#slide(title: [vCCS to CCS encoder])[
  Implementation of $encode()$

  Defined by structural induction on vCCS processes
  #pause

  Considerations:
  - Programs are the root nodes of my syntax
  #pause
  - More syntax cases than just $pi$ and $P$ to consider in practice
]

#slide(title: [vCCS encoding utilities])[
  Functions that solve CCS encoding sub-tasks
  #pause

  - Booleans/expressions evaluation \
    $tick"out"((1 + 3) "/" 2)$ #to $tick"out"(2)$
  #pause

  - Variable substitution \
    $k(x)$ #to $k(1)$
  #pause

  - Variable expansion \
    $"in"(x). k(x)$ #to $"in"_1(x). k(1) + "in"_2(x). k(2) + ...$
]
