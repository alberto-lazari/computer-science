#import "/common.typ": *

#exercise(
  section: (num: "3.6", title: "Martin-Löf's Intensional Propositional Equality"),
  ex: 7,
  [Prove that there exists a proof-term $pf$ such that.
  $ pf in Id(N1, star, w) ctx(w in N1) $
  is derivable.]
)
There exists a proof-term $pf = ElN1(w, id(star)), (x). id(x)$, such that
$ pf in Id(N1, star, w) ctx(w in N1) $
is derivable, in fact $ElN1(w, id(star)) in Id(N1, star, w) ctx(Gamma)$ is derivable:
#align(center, box[
  #set text(8pt)
  #prooftree(
        axiom($Gamma cont$),
      rule(label: var, $w in N1 ctx(Gamma)$),
          axiom($Gamma cont$),
        rule(label: FS, $N1 type ctx(Gamma)$),
          axiom($Gamma cont$),
        rule(label: IS, $star in N1 ctx(Gamma)$),
          axiom($Gamma cont$),
        rule(label: var, $w in N1 ctx(Gamma)$),
      rule(n: 3, label: FId, $Id(N1, star, w) type ctx(Gamma)$),
        axiom($Gamma cont$),
        rule(label: IS, $star in N1 ctx(Gamma)$),
      rule(label: IId, $id(star) in Id(N1, star, star) ctx(Gamma)$),
    rule(n: 3, label: ES, $ElN1(w, id(star)) in Id(N1, star, w) ctx(Gamma)$)
  )
])

Where $Gamma cont$ derivable, because:
- $Gamma = w in N1$
- $w in N1 cont$ derivable:
$
  #prooftree(
    axiom($ctx() cont$),
    rule(label: $FS$, $N1 type ctx()$),
    rule(label: $Fc$, $w in N1 cont$),
  )
$


#exercise(
  section: (num: "3.6", title: "Martin-Löf's Intensional Propositional Equality"),
  ex: 8,
  [Prove that there exists a proof-term $pf$ such that.
  $ pf in Id(N1, x, w) ctx(x in N1, w in N1) $
  is derivable.]
)
There exists a proof-term $pf = ElN1(x, ElN1(w, id(star))), (y). id(y)$, such that
$ pf in Id(N1, x, w) ctx(x in N1, w in N1) $
is derivable, in fact $ElN1(x, ElN1(w, id(star))) in Id(N1, x, w) ctx(Gamma)$ is derivable:
#align(center, box[
  #set text(8pt)
  #prooftree(
        axiom(label: $pi_1$, $Gamma cont$),
      rule(label: var, $x in N1 ctx(Gamma)$),
          axiom(label: $pi_1$, $Gamma cont$),
        rule(label: FS, $N1 type ctx(Gamma)$),
          axiom(label: $pi_1$, $Gamma cont$),
        rule(label: var, $x in N1 ctx(Gamma)$),
          axiom(label: $pi_1$, $Gamma cont$),
        rule(label: var, $w in N1 ctx(Gamma)$),
      rule(n: 3, label: FId, $Id(N1, x, w) type ctx(Gamma)$),
      axiom(label: $pi_2$, $ElN1(w, id(star)) in Id(N1, star, w) ctx(Gamma)$),
    rule(n: 3, label: ES, $ElN1(x, ElN1(w, id(star))) in Id(N1, x, w) ctx(Gamma)$)
  )
])

Where:
#pi-enum[
+ $Gamma cont$ derivable, because:
  - $Gamma = x in N1, w in N1$
  - $x in N1, w in N1 cont$ derivable:
  $
    #prooftree(
      axiom($ctx() cont$),
      rule(label: $FS$, $N1 type ctx()$),
      rule(label: $Fc$, $x in N1 cont$),
      rule(label: $FS$, $N1 type ctx(x in N1)$),
      rule(label: $Fc$, $x in N1, w in N1 cont$),
    )
  $

+ $ElN1(w, id(star)) in Id(N1, star, w) ctx(Gamma)$ derivable:
  #align(center, box[
    #set text(8pt)
    #prooftree(
          axiom(label: $pi_1$, $Gamma cont$),
        rule(label: var, $w in N1 ctx(Gamma)$),
            axiom(label: $pi_1$, $Gamma cont$),
          rule(label: FS, $N1 type ctx(Gamma)$),
            axiom(label: $pi_1$, $Gamma cont$),
          rule(label: IS, $star in N1 ctx(Gamma)$),
            axiom(label: $pi_1$, $Gamma cont$),
          rule(label: var, $w in N1 ctx(Gamma)$),
        rule(n: 3, label: FId, $Id(N1, star, w) type ctx(Gamma)$),
          axiom(label: $pi_1$, $Gamma cont$),
          rule(label: IS, $star in N1 ctx(Gamma)$),
        rule(label: IId, $id(star) in Id(N1, star, star) ctx(Gamma)$),
      rule(n: 3, label: ES, $ElN1(w, id(star)) in Id(N1, star, w) ctx(Gamma)$)
    )
  ])
]
