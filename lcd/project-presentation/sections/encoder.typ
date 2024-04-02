#import "/common.typ": *

#new-section-slide[Encoder]
#slide(title: [Trivial cases])[
  #set text(.9em)
  #let grid = grid.with(columns: (4fr, 3fr))
  #box(stroke: (bottom: 1pt), inset: (y: 15pt), grid(
    $encodepi() : "Prog"_"vCCS" to "Prog"$,
    $encode() : "Proc"_"vCCS" to "Proc"$
  ))

  #set align(top)
  #grid(
    $encodepi(P) = encode(P) \
      encodepi(k = P ";" pi) =
        ( k = encode(P); "encode"(pi) )
    $,
    pause + $encode(0) = 0 \
      encode(tau. P) = tau. encode(P) \
      encode(k) = k \
      encode(P + Q) = encode(P) + encode(Q) \
      encode(P | Q) = encode(P) | encode(Q)
    $
  )
]

#slide(title: [Evaluation -- expressions])[
  #box(width: 100%, stroke: (bottom: 1pt), inset: (y: 15pt),
    $evale : "expr" to NN$
  )
  #pause

  $evale (n) = n \
    evale (e_1 "op" e_2) = evale (e_1) "op" evale (e_2) \
    #uncover("3-")[
      // Fix indent
      #h(0pt)
      $evale (x) = thin ? #uncover(4)[#to `error: unbound variable x`]$
    ]
  $

  #uncover("2-")[
    #box(stroke: 1.5pt, inset: .5em, inline-rule("op",
      $+$, $-$, $*$, $"/"$,
    ))
  ]
]

#slide(title: [Evaluation -- booleans])[
  #box(width: 100%, stroke: (bottom: 1pt), inset: (y: 15pt),
    $evalb : "boolean" to {"true", "false"}$
  )
  #pause

  $evalb ("true") = "true" & evalb ("false") = "false" \
    evalb ("not" b) = not b \
    evalb (b_1 "or" b_2) = b_1 or b_2 #h(3em) &
    evalb (b_1 "and" b_2) = b_1 and b_2 \
    evalb (e_1 "op" e_2) = evale (e_1) "op" evale (e_2) \
  $

  #align(center, box(stroke: 1.5pt, inset: .5em, inline-rule("op",
    $=$, $!=$,
    $<$, $>$,
    $lt.eq.slant$, $gt.eq.slant$,
  )))
]

#slide(title: [Evaluation])[
  #let grid = grid.with(columns: (4fr, 3fr))
  #grid($encode(tick a(e). P) = tick a_n. encode(P)$, $n = evale(e)$)

  #grid($encode(k(e_1, ..., e_h)) = k_(n_1, ..., n_h)$, $n_i = evale(e_i)$)

  #grid(inset: (y: 5pt),
    $encode("if" b "then" P) =
      display(cases(
        encode(P) \ 0
      ))
    $,
    $evalb(b) = "true" \ evalb(b) = "false"$
  )
]

#slide(title: [Variable substitution -- booleans/expressions])[
  #set text(.8em)
  #let grid = grid.with(columns: (1fr, 1fr), gutter: 2em)
  #box(width: 100%, stroke: (bottom: 1pt), inset: (bottom: 15pt), grid(
    ${sub(" ", " ")}_b : "boolean" to "Var" to NN to "boolean"$,
    ${sub(" ", " ")}_e : "expr" to "Var" to NN to "expr"$,
  ))
  #pause

  #set align(top)
  #grid(
    $("not" b){sub(n, x)}_b = "not" b{sub(n, x)}_b \
      (b_1 "and" b_2){sub(n, x)}_b = b_1 {sub(n, x)}_b "and" b_2 {sub(n, x)}_b \
      (b_1 "or" b_2){sub(n, x)}_b = b_1 {sub(n, x)}_b "or" b_2 {sub(n, x)}_b \
      (e_1 "op" e_2){sub(n, x)}_b = e_1 {sub(n, x)}_e "op" e_2 {sub(n, x)}_e \
      b{sub(n, x)}_b = b
    $ + pause,
    $n{sub(n, x)}_e = n \
      y{sub(n, x)}_e = display(cases(
        n quad & "if" x = y \
        y      & "otherwise"
      )) \
      (e_1 "op" e_2){sub(n, x)}_e = e_1 {sub(n, x)}_e "op" e_1 {sub(n, x)}_e
    $
  )
]

#slide(title: [Variable substitution -- processes])[
  #set text(.8em)
  #box(width: 100%, stroke: (bottom: 1pt), inset: (bottom: 15pt),
    ${sub(" ", " ")} : "Proc"_"vCCS" to "Var" to NN to "Proc"_"vCCS"$
  )
  #pause

  #let grid = grid.with(columns: (1fr, 1fr))
  #set align(top)
  #grid(
    $0{sub(n, x)} = 0 \
      (P + Q){sub(n, x)} = P{sub(n, x)} + Q{sub(n, x)} \
      (P | Q){sub(n, x)} = P{sub(n, x)} | Q{sub(n, x)} \
      (P[f]){sub(n, x)} = P{sub(n, x)}[f] \
      (P \\ L){sub(n, x)} = P{sub(n, x)} \\ L
    $ + pause,
    $(a(y). P){sub(n, x)} = display(cases(
        a(y). P{sub(n, x)} quad & "if" y != x \
        a(y). P                 & "otherwise"
      )) \
      (tick a(e). P){sub(n, x)} = tick a(e{sub(n, x)}_e). P \
      k(e_1, ..., e_n){sub(n, x)} = k(e_1 {sub(n, x)}_e, ..., e_n {sub(n, x)}_e) \
      ("if" b "then" P){sub(n, x)} = "if" b{sub(n, x)}_b "then" P{sub(n, x)}
    $
  )
]

#slide(title: [Variable expansion])[
  Problem: cannot expand for infinite number of values

  $"in"(x). k(x) space --> space
    "in"_0. k_0 + "in"_1. k_1 + "in"_2. k_2 + "in"_3. k_3 + ...$
  #pause

  $==>$ Finite value domain needed

  $"in"(x). k(x) -->^(D = {0, 1, 2}) "in"_0. k_0 + "in"_1. k_1 + "in"_2. k_2$
]

#slide(title: [Expansion -- constant parameter])[
  Expand first parameter: $k(x_1, x_2) -->^(D = {0, 1}) k_0 (x_2); k_1 (x_2)$
  #pause

  #box(width: 100%, stroke: (bottom: 1pt), inset: (bottom: 15pt),
    $expandk(D,) : 2^NN to "Prog"_"vCCS" to "Prog"_"vCCS"$
  )
  #pause

  $expandk("Ø", k(x_1, ..., x_h) = P ";" pi) = pi
    #h(8em)
    expandk(D, pi) = pi
  $

  $expandk({n} thin union thin S, k(x_1, x_2, ..., x_h) = P ";" pi) = \
    quad k_n (x_2, ..., x_h) = P{sub(n, x_1)}; expandk(S, k(x_1, x_2, ..., x_h) = P ";" pi)$
]
