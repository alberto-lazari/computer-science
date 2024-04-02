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

#focus-slide[
  Let's start a small digression...
]

#include "expansion.typ"

#focus-slide[
  Now, back to the encoder
  #utils.register-section[Encoder]
]

#slide(title: [Expansion])[
  Given a finite domain $D subset.eq NN$

  $encodepi(k(x_1, ..., x_n) = P ";" pi) = encodepi(expandk(D, k(x_1, ..., x_n) = P) ";" pi)$

  $encode(a_n (x). P) = a_n. encode(P)
    #h(8em)
    encode(a(x). P) = expanda(D, a(x). P)$

  $encode(P[f]) = expandf(D, P[f])
    #h(3em)
    encode(P[f_n_1, ..., f_n_h]) = encode(P)[f_n_1, ..., f_n_h]
  $
]
