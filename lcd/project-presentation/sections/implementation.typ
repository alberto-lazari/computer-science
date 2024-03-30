#import "/common.typ": *

#new-section-slide[Implementation]
#slide(title: [Abstract syntax tree])[
  #set align(center)
  #grid(
    columns: (1fr, 2fr),
    [Store syntax elements],
    ```ocaml
    type act =
      | Tau
      | Input of string * string
      | Output of string * expr
    type proc =
      | Nil
      | Act of act * proc
      | Const of string * expr list
      | If of boolean * proc
      | Sum of proc * proc
      | Paral of proc * proc
      | Red of proc * (string * string) list
    ```
  )
]

#slide(title: [Parser])[
  #set align(center)
  #grid(
    columns: (1fr, 2fr),
    grid(gutter: 1em)[
      Tokens
    ][#sym.arrow.b][
      AST nodes
    ],
    ```ocaml
    %token <string> ID
    %token TAU
    %token POINT
    %token IF THEN
    %token PIPE
    act:
      | TAU { Tau }
      | a = ID LPAREN x = ID RPAREN { Input (a, x) }
    proc:
      | a = act POINT p = proc { Act (a, p) }
      | IF b = boolean THEN p = proc { If (b, p) }
      | p1 = proc PIPE p2 = proc { Paral (p1, p2) }
    ```
  )
]

#slide(title: [Lexer])[
  #set align(center)
  #grid(
    columns: (1fr, 2fr),
    grid(gutter: 1em)[
      Characters sequences
    ][#sym.arrow.b][
      Parser tokens
    ],
    ```ocaml
    let blank    = [' ' '\t' '\n']+
    let letter   = ['a'-'z' 'A'-'Z']
    let tau      = "τ" | "tau"
    rule read = parse
      | blank+  { read lexbuf }
      | '='     { EQ }
      | tau     { TAU }
      | '.'     { POINT }
      | "if"    { IF }
      | "then"  { THEN }
      | '|'     { PIPE }
      | id      { ID (Lexing.lexeme lexbuf) }
    ```
  )
]
