#import "/common.typ": *

#exercise(
  section: (num: "3.6", title: "Martin-Löf's Intensional Propositional Equality"),
  ex: 7,
  [Prove that there exists a proof-term $pf$ such that.
  $ pf in Id(N1, star, w) ctx(w in N1) $
  is derivable.]
)
There exists a proof-term $pf = ElId(ElN1(w, id(star)), (x). id(x))$, such that
$ pf in Id(N1, star, w) ctx(w in N1) $
is derivable, in fact:

let $Gamma = w in N1$; \
let $Delta = z1 in N1, z2 in N1, z3 in Id(N1, z1, z2)$; \
$ElId(ElN1(w, id(star)), (x). id(x)) in Id(N1, x, w) ctx(Gamma)$ is derivable:
#align(center, box[
  #set text(7pt)
  #prooftree(
      axiom($Id(N1, z1, z2) type ctx(Gamma, Delta)$),
        axiom($Gamma cont$),
      rule(label: IS, $star in N1 ctx(Gamma)$),
        axiom($Gamma cont$),
      rule(label: var, $w in N1 ctx(Gamma)$),
      axiom($ElN1(w, id(star)) in Id(N1, star, w) ctx(Gamma)$),
        axiom($Gamma cont$),
        rule(label: FS, $N1 type ctx(Gamma)$),
        rule(label: Fc, $Gamma, x in N1 cont$),
        rule(label: var, $x in N1 ctx(Gamma, x in N1)$),
      rule(label: IId, $id(x) in Id(N1, x, x) ctx(Gamma, x in N1)$),
    rule(n: 5, label: EId, $ElId(ElN1(w, id(star)), (x). id(x)) in Id(N1, star, w) ctx(Gamma)$)
  )
])

Where
+ $Gamma cont$ derivable, because:
  - $Gamma = w in N1$
  - $w in N1 cont$ derivable:
  $
    #prooftree(
      axiom($ctx() cont$),
      rule(label: $FS$, $N1 type ctx()$),
      rule(label: $Fc$, $w in N1 cont$),
    )
  $

+ $Id(N1, z1, z2) type ctx(Gamma, Delta)$ derivable:
  $
    #prooftree(
          axiom($Gamma, Delta cont$),
        rule(label: FS, $N1 type ctx(Gamma, Delta)$),
          axiom($Gamma, Delta cont$),
        rule(label: var, $z1 in N1 ctx(Gamma, Delta)$),
          axiom($Gamma, Delta cont$),
        rule(label: var, $z2 in N1 ctx(Gamma, Delta)$),
      rule(n: 3, label: FId, $Id(N1, z1, z2) type ctx(Gamma, Delta)$)
    )
  $ \
  Where $Gamma, Delta cont$ derivable, because:
  - $Delta = z1 in N1, z2 in N1, z3 in Id(N1, z1, z2)$
  - $Gamma, z1 in N1, z2 in N1, z3 in Id(N1, z1, z2) cont$ derivable:

  #let gamma-z1-z2-cont = (
    axiom($Gamma cont$),
    rule(label: FS, $N1 type ctx(Gamma)$),
    rule(label: Fc, $Gamma, z1 in N1 cont$),
    rule(label: FS, $N1 type ctx(Gamma, z1 in N1)$),
    rule(label: Fc, $Gamma, z1 in N1, z2 in N1 cont$)
  )

  #align(center, box[
    #set text(8pt)
    #prooftree(
          ..gamma-z1-z2-cont,
        rule(label: FS, $N1 type ctx(Gamma, z1 in N1, z2 in N1)$),
          ..gamma-z1-z2-cont,
        rule(label: var, $z1 in N1 ctx(Gamma, z1 in N1, z2 in N1)$),
          ..gamma-z1-z2-cont,
        rule(label: var, $z2 in N1 ctx(Gamma, z1 in N1, z2 in N1)$),
      rule(n: 3, label: FId, $Id(N1, z1, z2) type ctx(Gamma, z1 in N1, z2 in N1)$),
      rule(label: Fc, $Gamma, z1 in N1, z2 in N1, z3 in Id(N1, z1, z2) cont$)
    )
  ])

+ $ElN1(w, id(star)) in Id(N1, star, w) ctx(Gamma)$ derivable:
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


#exercise(
  section: (num: "3.6", title: "Martin-Löf's Intensional Propositional Equality"),
  ex: 8,
  [Prove that there exists a proof-term $pf$ such that.
  $ pf in Id(N1, x, w) ctx(x in N1, w in N1) $
  is derivable.]
)
There exists a proof-term $pf = ElId(ElN1(x, ElN1(w, id(star))), (y). id(y))$, such that
$ pf in Id(N1, x, w) ctx(x in N1, w in N1) $
is derivable, in fact:

let $Gamma = x in N1, w in N1$; \
let $Delta = z1 in N1, z2 in N1, z3 in Id(N1, z1, z2)$; \
$ElId(ElN1(x, ElN1(w, id(star))), (y). id(y)) in Id(N1, x, w) ctx(Gamma)$ is derivable:
#align(center, box[
  #set text(7pt)
  #prooftree(
      axiom($Id(N1, z1, z2) type ctx(Gamma, Delta)$),
        axiom($Gamma cont$),
      rule(label: var, $x in N1 ctx(Gamma)$),
        axiom($Gamma cont$),
      rule(label: var, $w in N1 ctx(Gamma)$),
      axiom($ElN1(x, ElN1(w, id(star))) in Id(N1, x, w) ctx(Gamma)$),
        axiom($Gamma cont$),
        rule(label: FS, $N1 type ctx(Gamma)$),
        rule(label: Fc, $Gamma, y in N1 cont$),
        rule(label: var, $y in N1 ctx(Gamma, y in N1)$),
      rule(label: IId, $id(y) in Id(N1, y, y) ctx(Gamma, y in N1)$),
  rule(n: 5, label: EId, $ElId(ElN1(x, ElN1(w, id(star))), (y). id(y)) in Id(N1, x, w) ctx(Gamma)$)
  )
])

Where
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

+ $Id(N1, z1, z2) type ctx(Gamma, Delta)$ derivable:
  $
    #prooftree(
          axiom($Gamma, Delta cont$),
        rule(label: FS, $N1 type ctx(Gamma, Delta)$),
          axiom($Gamma, Delta cont$),
        rule(label: var, $z1 in N1 ctx(Gamma, Delta)$),
          axiom($Gamma, Delta cont$),
        rule(label: var, $z2 in N1 ctx(Gamma, Delta)$),
      rule(n: 3, label: FId, $Id(N1, z1, z2) type ctx(Gamma, Delta)$)
    )
  $ \
  Where $Gamma, Delta cont$ derivable, because:
  - $Delta = z1 in N1, z2 in N1, z3 in Id(N1, z1, z2)$
  - $Gamma, z1 in N1, z2 in N1, z3 in Id(N1, z1, z2) cont$ derivable:

  #let gamma-z1-z2-cont = (
    axiom($Gamma cont$),
    rule(label: FS, $N1 type ctx(Gamma)$),
    rule(label: Fc, $Gamma, z1 in N1 cont$),
    rule(label: FS, $N1 type ctx(Gamma, z1 in N1)$),
    rule(label: Fc, $Gamma, z1 in N1, z2 in N1 cont$)
  )

  #align(center, box[
    #set text(8pt)
    #prooftree(
          ..gamma-z1-z2-cont,
        rule(label: FS, $N1 type ctx(Gamma, z1 in N1, z2 in N1)$),
          ..gamma-z1-z2-cont,
        rule(label: var, $z1 in N1 ctx(Gamma, z1 in N1, z2 in N1)$),
          ..gamma-z1-z2-cont,
        rule(label: var, $z2 in N1 ctx(Gamma, z1 in N1, z2 in N1)$),
      rule(n: 3, label: FId, $Id(N1, z1, z2) type ctx(Gamma, z1 in N1, z2 in N1)$),
      rule(label: Fc, $Gamma, z1 in N1, z2 in N1, z3 in Id(N1, z1, z2) cont$)
    )
  ])

+ $ElN1(x, ElN1(w, id(star))) in Id(N1, x, w) ctx(Gamma)$ derivable:
#align(center, box[
  #set text(7pt)
  #prooftree(
        axiom($Gamma cont$),
      rule(label: var, $x in N1 ctx(Gamma)$),
        axiom($dots.v$),
      rule(label: FId, $Id(N1, x, w) type ctx(Gamma)$),
        axiom($dots.v$),
      rule(label: $$, $ElN1(w, id(star)) in Id(N1, star, w) ctx(Gamma)$),
    rule(n: 3, label: ES, $ElN1(x, ElN1(w, id(star))) in Id(N1, x, w) ctx(Gamma)$)
  )
])
