#import "/common.typ": *

#new-section-slide[Syntax]

#new-section-slide[Value-passing CCS syntax]

#slide(title: [Constants])[
  - $n in NN$
  - $k in K$
  - $x in "Var"$
  - $a in cal(A)$
]

#slide(title: [Expressions])[
  #rule("e",
    $n$,
    $(e)$,
    $x$,
    $e "abop" e$,
  )

  #rule(inline: true, "abop",
    $+$, $-$, $*$, $"/"$,
  )
]
