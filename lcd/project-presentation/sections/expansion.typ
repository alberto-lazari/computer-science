#import "/common.typ": *

#new-section-slide[Expansion]
#slide(title: [Missing cases])[
  #let grid = grid.with(columns: (1fr, 1fr), gutter: 2em)
  #grid([
    #uncover("2-")[Variable binders]

    $encodepi(k(x_1, ..., x_h) = P ";" pi) = space ?$

    $encode(a(x). P) = space ?$
  ],
  uncover(3)[
    Also channel manipulators

    $encode(P \\ L) = space ?$

    $encode(P[f]) = space ?$
  ])
]

#slide(title: [The problem])[
  Cannot expand for infinite number of values

  $"in"(x). k(x) space --> space
    "in"_0. k_0 + "in"_1. k_1 + "in"_2. k_2 + "in"_3. k_3 + ...$
  #pause

  $==>$ Finite value domain needed

  $"in"(x). k(x) -->^(D = {0, 1, 2}) "in"_0. k_0 + "in"_1. k_1 + "in"_2. k_2$
]

#slide(title: [Variable substitution])[
  Let's introduce variable substitution first:

  $P{sub(n, x)}$ #to replace all (free) occurrences of $x$ with value $n$
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

#slide(title: [Constant parameter])[
  Expand first parameter: $k(x_1, x_2) -->^(D = {0, 1}) k_0 (x_2); k_1 (x_2)$
  #pause

  #box(width: 100%, stroke: (bottom: 1pt), inset: (bottom: 15pt),
    $expandk(D) : 2^NN to "Prog"_"vCCS" to "Prog"_"vCCS"$
  )
  #pause

  $expandk("Ø", k(x_1, ..., x_h) = P ";" pi) = pi
    #h(8em)
    expandk(D, pi) = pi
  $

  $expandk({n} thin union thin S, k(x_1, x_2, ..., x_h) = P ";" pi) = \
    quad k_n (x_2, ..., x_h) = P{sub(n, x_1)}; expandk(S, k(x_1, x_2, ..., x_h) = P ";" pi)$
]

#slide(title: [Input variable])[
  #box(width: 100%, stroke: (bottom: 1pt), inset: (bottom: 15pt),
    $expanda(D) : 2^NN to "Proc"_"vCCS" to "Proc"_"vCCS"$
  )
  #pause

  $expanda("Ø", a(x). P) = 0$

  $expanda({n}, a(x). P) = a_n (x). P{sub(n, x)}$

  $expanda({n} thin union thin S, a(x). P) = a_n (x). P{sub(n, x)} + expanda(S, a(x). P)$

  $expanda(D, P) = P$
]

#slide(title: [Redirection function])[
  #box(width: 100%, stroke: (bottom: 1pt), inset: (bottom: 15pt),
    $expandf(D) : 2^NN to "Proc"_"vCCS" to "Proc"_"vCCS"$
  )
  #pause

  $expandf("Ø", P[f]) = P$

  $expandf({n_1, n_2, ..., n_h}, P[f]) = P[f_n_1, f_n_2, ..., f_n_h]$

  $expandf(D, P) = P$

  Where $f = a"/"b, c"/"d, ... space ==> space f_n = a_n"/"b_n, c_n"/"d_n, ...$
]

#slide(title: [Restricted channels])[
  #box(width: 100%, stroke: (bottom: 1pt), inset: (bottom: 15pt),
    $expandL(D) : 2^NN to "Proc"_"vCCS" to "Proc"_"vCCS"$
  )
  #pause

  $expandL("Ø", P \\ L) = P$

  $expandL({n_1, n_2, ..., n_h}, P \\ L) = P \\ (L_n_1 union L_n_2 union ... union L_n_h)$

  $expandL(D, P) = P$

  Where $L = a, b, ... space ==> space L_n = a_n, b_n ...$
]
