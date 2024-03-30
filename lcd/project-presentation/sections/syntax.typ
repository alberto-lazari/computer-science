#import "/common.typ": *

#new-section-slide[Syntax]
#slide(title: [Syntax I defined])[
  - vCCS adapted syntax, for parser
  - CCS syntax, for output pretty printing

  #pause
  All inspired from CAAL's syntax
]

#new-section-slide[Value-passing CCS syntax]
#slide(title: [Constants])[
  - $n in NN$
  - $k in K$
  - $x in "Var"$
  - $a in cal(A)$
]

#slide(title: [Expressions])[
  #rule("e", $n$,
    $(e)$,
    $x$,
    $e "abop" e$,
  )

  #inline-rule("abop",
    $+$, $-$, $*$, $"/"$,
  )
]

#slide(title: [Booleans])[
  #rule("b", $"true" | "false"$,
    $(b)$,
    $"not" b$,
    $b "and" b | b "or" b$,
    $e "bbop" e$,
  )

  #inline-rule("bbop",
    $=$, $!=$,
    $<$, $>$,
    $lt.eq.slant$, $gt.eq.slant$,
  )
]

#slide(title: [Processes])[
  #grid(
    columns: (1fr, 1fr),
    rule("P", $0$,
      $(P)$,
      $"act". P$,
      $k | k("args")$,
      $"if" b "then" P$,
      $P + P | P thin | thin P$,
      $P[f] | P \\ L$,
    ), [
      #inline-rule("act",
        $tau$, $a(x)$, $tick a(e)$
      )

      #inline-rule("args",
        $epsilon$, $e$, $e, "args"$
      )

      #inline-rule($f$,
        $epsilon$, $a"/"a$, $a"/"a, f$
      )

      #inline-rule("channels",
        $epsilon$, $a$, $a, "channels"$
      )

      #inline-rule($L$,
        $a$, ${}$, ${"channels"}$
      )
    ]
  )
]

#slide(title: [Program])[
  #rule($pi$, $P$,
    $k = P; pi$,
    $k("params") = P; pi$,
  )

  #inline-rule("params", $epsilon$,
    $x$,
    $x, "params"$,
  )
]


#new-section-slide[Pure CCS syntax]
#slide(title: [Constants])[
  - $k in K$
  - $a in cal(A)$
]

#slide(title: [Processes])[
  #grid(
    columns: (1fr, 1fr),
    rule("P", $0$,
      $(P)$,
      $"act". P$,
      $k$,
      $P + P$,
      $P thin | thin P$,
      $P[f] | P \\ L$,
    ), [
      #inline-rule("act",
        $tau$, $a$, $tick a$
      )

      #inline-rule($f$,
        $a"/"a$, $a"/"a, f$
      )

      #inline-rule("channels",
        $a$, $a, "channels"$
      )

      #inline-rule($L$,
        $a$, ${"channels"}$
      )
    ]
  )
]

#slide(title: [Program])[
  #rule($pi$, $P$,
    $k = P; pi$,
  )
]
