#import "/common.typ": *

#new-section-slide[Encoder]
#slide(title: [Trivial cases])[
  #case($pi$,
    $P to encode(P)$,
    $k() = P; pi to k = encode(P); encode(pi)$,
  )
  #pause

  #case($P$,
    $0 to 0$,
    $tau. P to tau. encode(P)$,
    $k() to k$,
    $P + Q to encode(P) + encode(Q)$,
    $P | Q to encode(P) | encode(Q)$,
  )
]

#slide(title: [Evaluation -- expressions])[
  $"eval"_e : "expr" to NN$
  #pause

  $"eval"_e (n) = n \
    "eval"_e (e_1 "op" e_2) = "eval"_e (e_1) "op" "eval"_e (e_2) \
    #uncover("3-")[
      // Fix indent
      #h(0pt)
      $"eval"_e (x) = thin ? #uncover(4)[#to `error: unbound variable x`]$
    ]
  $

  #uncover("2-")[
    #box(stroke: 1.5pt, inset: .5em, inline-rule("op",
      $+$, $-$, $*$, $"/"$,
    ))
  ]
]

#slide(title: [Evaluation -- booleans])[
  $"eval"_b : "boolean" to {"true", "false"}$
  #pause

  $"eval"_b ("true") = "true" & "eval"_b ("false") = "false" \
    "eval"_b ("not" b) = not b \
    "eval"_b (b_1 "or" b_2) = b_1 or b_2 #h(3em) &
    "eval"_b (b_1 "and" b_2) = b_1 and b_2 \
    "eval"_b (e_1 "op" e_2) = "eval"_e (e_1) "op" "eval"_e (e_2) \
  $

  #align(center, box(stroke: 1.5pt, inset: .5em, inline-rule("op",
    $=$, $!=$,
    $<$, $>$,
    $lt.eq.slant$, $gt.eq.slant$,
  )))
]
