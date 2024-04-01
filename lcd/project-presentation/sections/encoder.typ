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
    "eval"_e (e_1 "op" e_2) = e_1 "op" e_2 \
    "eval"_e (x) = thin ? #[ #pause #to `error: unbound variable x` ]
  $
]
