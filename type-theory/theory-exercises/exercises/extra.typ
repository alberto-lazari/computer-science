#import "/common.typ": *

#exercise(
  section: (num: "5", title: "How to translate predicative logic with equality into type theory"),
  ex: 15,
  solution: false,
  [Show that by using the *Propositional Equality with Path Induction*, for any type $A$ and $a in A$, there exists a proof-term #q
  $ #q in sum(z in sum(x in A) Idp(A, a, x)) fa(w in sum(x in A) Idp(A, a, x)) Idp(sum(x in A) Idp(A, a, x), z, w) $],
)

#let q1 = $a$
#let q2 = $idp(a)$
#let elid2 = $idp(alpha)$
#let elsum2 = $(x1, x2). ElIdp(x2, elid2)$
#let q3 = $Elsum(w, elsum2)$
#let qtot = $angle.l alpha, lambda w. q3 angle.r$

First, I transform the universal quantifier into a dependent product, in order to be able to derive it in type theory. The original judgment so becomes
$ sum(z in sum(x in A) Idp(A, a, x)) prod(w in sum(x in A) Idp(A, a, x)) Idp(sum(x in A) Idp(A, a, x), z, w) $

I will assume the following rules, that are essential to use the *Propositional Equality with Path Induction*:

#box[
  #set text(8pt)
  $#prooftree(
      axiom($A type ctx(Gamma)$),
      axiom($a in A ctx(Gamma)$),
      axiom($b in A ctx(Gamma)$),
    rule(n: 3, label: FIdp, $Idp(A, a, b) type ctx(Gamma)$)
  )
  #h(2em)
  #prooftree(
      axiom($a in A ctx(Gamma)$),
    rule(label: IIdp, $idp(a) in Idp(A, a, a) ctx(Gamma)$)
  )$
  #v(1em)
  #prooftree(
      axiom($C(y, z) type ctx(Gamma, y in A, z in Idp(A, a, y))$),
      axiom($a in A ctx(Gamma)$),
      axiom($b in A ctx(Gamma)$),
      axiom($p in Idp(A, a, b) ctx(Gamma)$),
      axiom($c in C(a, idp(a)) ctx(Gamma)$),
    rule(n: 5, label: EIdp, $ElIdp(p, c) in C(b, p) ctx(Gamma)$)
  )
]

These are different than the ones written in page 34 of the course notes, in fact a subscript $upright(sans(p))$ was added to $FId$ and $IId$, in order to distinguish the ones related to Propositional Equality with Path Induction from the ones defined for Martin-Löf's Propositional Equality.
The subscript was also added to the term $id(x)$, for the same reason ($id(x) in Id(A, x, x)$, but $id(x) in.not Idp(A, x, x)$).
Another small change in $EIdp$ was that $z in Idp(A, a, y)$, not $z in Id(A, a, y)$.

#box(stroke: 0.5pt, width: 100%, inset: 0.5em, [
  === Propositional Equality with Path Induction
  #set text(8pt)
  #v(0.5em)
  $#prooftree(
      axiom($A type ctx(Gamma)$),
      axiom($a in A ctx(Gamma)$),
      axiom($b in A ctx(Gamma)$),
    rule(n: 3, label: FId, $Idp(A, a, b) type ctx(Gamma)$)
  )
  #h(2em)
  #prooftree(
      axiom($a in A ctx(Gamma)$),
    rule(label: IId, $id(a) in Idp(A, a, a) ctx(Gamma)$)
  )$
  #v(1em)
  #prooftree(
      axiom($C(y, z) type ctx(Gamma, y in A, z in Id(A, a, y))$),
      axiom($a in A ctx(Gamma)$),
      axiom($b in A ctx(Gamma)$),
      axiom($p in Idp(A, a, b) ctx(Gamma)$),
      axiom($c in C(a, id(a)) ctx(Gamma)$),
    rule(n: 5, label: EIdp, $ElIdp(p, c) in C(b, p) ctx(Gamma)$)
  )

  #align(center, [Page 34 of the course notes])
])

== Solution
Assuming:
#a-enum[
  + $A type ctx()$
  + $a in A ctx()$
]

#let phi = $phi.alt$
- Let $alpha = angle.l a, idp(a) angle.r$
- Let $#q = qtot$
- Let $phi = sum(x in A) Idp(A, a, x)$
- Let $psi(z, w) = Idp(phi, z, w)$

#let judgment = $qtot in sum(z in phi) prod(w in phi) psi(z, w) ctx()$
#judgment derivable:
#align(center, box[
  #set text(9pt)
  #prooftree(
      axiom(label: $pi_1$, $alpha in phi ctx()$),
        axiom(label: $pi_2$, $q3 in psi(alpha, w) ctx(w in phi)$),
      rule(label: Iprod, $lambda w. q3 in prod(w in phi) psi(alpha, w) ctx()$),
        axiom(label: $pi_3$, $psi(z, w) type ctx(z in phi, w in phi)$),
      rule(label: Fprod, $prod(w in phi) psi(z, w) type ctx(z in phi)$),
    rule(n: 3, label: Isum, judgment)
  )
])

#let var-cont(var) = (
    axiom(label: $a_1$, $A type ctx()$),
  rule(label: Fc, $var in A cont$),
)

Where:
#pi-enum[
#{ judgment = $angle.l q1, q2 angle.r in sum(x in A) Idp(A, a, x) ctx()$ }
+ $alpha in phi ctx()$ derivable, because:
  - $alpha = angle.l a, idp(a) angle.r$
  - $phi = sum(x in A) Idp(A, a, x)$
  - #judgment derivable:
  #align(center, box[
    #set text(6pt)
    #prooftree(
          axiom(label: $a_2$, $q1 in A ctx()$),
            axiom(label: $a_2$, $a in A ctx()$),
          rule(label: FIdp, $q2 in Idp(A, a, a) ctx()$),
              axiom(label: $a_1$, $A type ctx()$),
              ..var-cont($x$),
            rule(n: 2, label: "ind-ty)", $A type ctx(x in A)$),
              axiom(label: $a_2$, $a in A ctx()$),
              ..var-cont($x$),
            rule(n: 2, label: "ind-ter)", $a in A ctx(x in A)$),
              ..var-cont($x$),
            rule(label: var, $x in A ctx(x in A)$),
          rule(n: 3, label: FIdp, $Idp(A, a, x) type ctx(x in A)$),
        rule(n: 3, label: Isum, judgment)
    )
  ])

#{ judgment = $q3 in Idp(phi, alpha, w) ctx(w in phi)$ }
+ $q3 in psi(alpha, w) ctx(w in phi)$ derivable, because:
  - $psi(alpha, w) = Idp(phi, alpha, w)$
  - #judgment derivable:
  #align(center, box[
    #set text(7pt)
    #prooftree(
        axiom(label: $pi_(2.5)$, $Idp(phi, alpha, z) type ctx(w in phi, z in phi)$),
            axiom(label: $pi_(3.1)$, $phi type ctx()$),
          rule(label: Fc, $w in phi cont$),
        rule(label: var, $w in phi ctx(w in phi)$),
        axiom(label: $pi_(2.1)$, $elsum2 in Idp(phi, alpha, angle.l x1, x2 angle.r) ctx(w in phi, x1 in A, x2 in Idp(A, a, x1))$),
      rule(n: 3, label: Esum, judgment)
    )
  ])

  Where:
  #pi-enum[
  #{ judgment = $elsum2 in Idp(phi, alpha, angle.l x1, x2 angle.r) ctx(Gamma)$ }
  + $elsum2 in Idp(phi, alpha, angle.l x1, x2 angle.r) ctx(w in phi, x1 in A, x2 in Idp(A, a, x1))$ derivable, because:
    - Let $Gamma = w in phi, x1 in A, x2 in Idp(A, a, x1)$
    - #judgment derivable:
    #align(center, box[
      #set text(7.5pt)
      #prooftree(
          axiom($pi_(2.2)$),
            axiom(label: $pi_(2.3)$, $Gamma cont$),
          rule(label: var, $a in A ctx(Gamma)$),
            axiom(label: $pi_(2.3)$, $Gamma cont$),
          rule(label: var, $x1 in A ctx(Gamma)$),
            axiom(label: $pi_(2.3)$, $Gamma cont$),
          rule(label: var, $x2 in Idp(phi, a, x1) ctx(Gamma)$),
              axiom(label: $pi_1$, $alpha in phi ctx()$),
              axiom(label: $pi_(2.3)$, $Gamma cont$),
            rule(n: 2, label: "ind-te)", $alpha in phi ctx(Gamma)$),
          rule(label: FIdp, $elid2 in Idp(phi, alpha, alpha) ctx(Gamma)$),
        rule(n: 5, label: EIdp, judgment)
      )
    ])

  #{ judgment = $Idp(phi, alpha, angle.l y, z angle.r) type ctx(Sigma)$ }
  + $Idp(phi, alpha, angle.l y, z angle.r) type ctx(Gamma, y in A, z in Idp(A, a, y))$ derivable, because:
    - Let $Sigma = Gamma, y in A, z in Idp(A, a, y)$
    - #judgment derivable:
    #align(center, box[
      #set text(8pt)
      #prooftree(
            axiom(label: $pi_(3.1)$, $phi type ctx()$),
            axiom(label: $pi_(2.2.1)$, $Sigma cont$),
          rule(n: 2, label: "ind-ty)", $phi type ctx(Sigma)$),
            axiom(label: $pi_1$, $alpha in phi ctx()$),
            axiom(label: $pi_(2.2.1)$, $Sigma cont$),
          rule(n: 2, label: "ind-ter)", $alpha in phi ctx(Sigma)$),
          axiom(label: $pi_(2.2.2)$, $angle.l y, z angle.r in phi ctx(Sigma)$),
        rule(n: 3, label: FIdp, judgment)
      )
    ])

    Where:
    #pi-enum[
    #{ judgment = $Gamma, y in A, z in Idp(A, a, y) cont$ }
    + $Sigma cont$ derivable, because:
      - $Sigma = Gamma, y in A, z in Idp(A, a, y)$
      - #judgment derivable:
        #let gamma-ya-cont = (
            axiom(label: $a_1$, $A type ctx()$),
            axiom(label: $pi_(2.3)$, $Gamma cont$),
          rule(n: 2, label: "ind-ty)", $A type ctx(Gamma)$),
          rule(label: Fc, $Gamma, y in A cont$),
        )
        #align(center, box[
          #set text(6pt)
          #prooftree(
                axiom(label: $a_1$, $A type ctx()$),
                ..gamma-ya-cont,
              rule(n: 2, label: "ind-ty)", $A type ctx(Gamma, y in A)$),
                axiom(label: $a_2$, $a in A ctx()$),
                ..gamma-ya-cont,
              rule(n: 2, label: "ind-ter)", $a in A ctx(Gamma, y in A)$),
                ..gamma-ya-cont,
              rule(label: var, $y in A ctx(Gamma, y in A)$),
            rule(n: 3, label: FIdp, $Idp(A, a, y) type ctx(Gamma, y in A)$),
            rule(label: Fc, judgment)
          )
        ])

    #{ judgment = $angle.l y, z angle.r in sum(x in A) Idp(A, a, x) ctx(Sigma)$ }
    + $angle.l y, z angle.r in phi ctx(Sigma)$ derivable, because:
      - $phi = sum(x in A) Idp(A, a, x)$
      - #judgment derivable:
      #align(center, box[
        #prooftree(
              axiom(label: $pi_(2.2.1)$, $Sigma cont$),
            rule(label: var, $y in A ctx(Sigma)$),
              axiom(label: $pi_(2.2.1)$, $Sigma cont$),
            rule(label: var, $z in Idp(A, a, y) ctx(Sigma)$),
            axiom(label: $pi_(2.2.3)$, $Idp(A, a, x) ctx(Sigma, x in A)$),
          rule(n: 3, label: Isum, judgment)
        )
      ])

    #{ judgment = $Idp(A, a, x) ctx(Sigma, x in A)$ }
    + #judgment derivable:
      #let sigma-xa-cont = (
          axiom(label: $a_1$, $A type ctx()$),
          axiom(label: $pi_(2.2.1)$, $Sigma cont$),
        rule(n: 2, label: "ind-ty)", $A type ctx(Sigma)$),
        rule(label: Fc, $Sigma, x in A cont$),
      )
      #align(center, box[
        #set text(6pt)
        #prooftree(
              axiom(label: $a_1$, $A type ctx()$),
              ..sigma-xa-cont,
            rule(n: 2, label: "ind-ty)", $A type ctx(Sigma, x in A)$),
              axiom(label: $a_2$, $a in A ctx()$),
              ..sigma-xa-cont,
            rule(n: 2, label: "ind-ter)", $a in A ctx(Sigma, x in A)$),
              ..sigma-xa-cont,
            rule(label: var, $x in A ctx(Sigma, x in A)$),
          rule(n: 3, label: FIdp, judgment)
        )
      ])
    ]

  #{ judgment = $Delta, x2 in Idp(A, a, x1) cont$ }
  + $Gamma cont$ derivable, because:
    - $Gamma = w in phi, x1 in A, x2 in Idp(A, a, x1)$
    - Let $Delta = w in phi, x1 in A$
    - #judgment derivable:
      #align(center, box[
        #set text(10pt)
        #prooftree(
              axiom(label: $a_1$, $A type ctx()$),
              axiom(label: $pi_(2.4)$, $Delta cont$),
            rule(n: 2, label: "ind-ty)", $A type ctx(Delta)$),
              axiom(label: $a_2$, $a in A ctx()$),
              axiom(label: $pi_(2.4)$, $Delta cont$),
            rule(n: 2, label: "ind-ter)", $a in A ctx(Delta)$),
              axiom(label: $pi_(2.4)$, $Delta cont$),
            rule(label: var, $x1 in A ctx(Delta)$),
          rule(n: 3, label: FIdp, $Idp(A, a, x1) type ctx(Delta)$),
          rule(label: Fc, judgment)
        )
      ])

  #{ judgment = $w in phi, x1 in A cont$ }
  + $Delta cont$ derivable, because:
    - $Delta = w in phi, x1 in A cont$
    - #judgment derivable:
      #align(center, box[
        #prooftree(
            axiom(label: $a_1$, $A type ctx()$),
              axiom(label: $pi_(3.1)$, $phi type ctx()$),
            rule(label: Fc, $w in phi cont$),
          rule(n: 2, label: "ind-ty)", $A type ctx(w in phi)$),
          rule(label: Fc, judgment)
        )
      ])

  #{ judgment = $Idp(phi, alpha, z) type ctx(w in phi, z in phi)$ }
  + #judgment derivable:
    #align(center, box[
      #set text(7pt)
      #prooftree(
            axiom(label: $pi_(3.1)$, $phi type ctx()$),
            axiom(label: $pi_(3.2)$, $w in phi, z in phi cont$),
          rule(n: 2, label: "ind-ty)", $phi type ctx(w in phi, z in phi)$),
            axiom(label: $pi_1$, $alpha in phi ctx()$),
            axiom(label: $pi_(3.2)$, $w in phi, z in phi cont$),
          rule(n: 2, label: "ind-ter)", $alpha in phi ctx(w in phi, z in phi)$),
            axiom(label: $pi_(3.2)$, $w in phi, z in phi cont$),
          rule(label: var, $z in phi ctx(w in phi, z in phi)$),
        rule(n: 3, label: FIdp, judgment)
      )
    ])

    #{ judgment = $w in phi, z in phi cont$ }
    Where #judgment derivable:
      #align(center, box[
        #prooftree(
            axiom(label: $pi_(3.1)$, $phi type ctx()$),
              axiom(label: $pi_(3.1)$, $phi type ctx()$),
            rule(label: Fc, $w in phi cont$),
          rule(n: 2, label: "ind-ty)", $phi type ctx(w in phi)$),
          rule(label: Fc, judgment)
        )
      ])
  ]

#{ judgment = $Idp(phi, z, w) type ctx(z in phi, w in phi)$ }
+ $psi(z, w) type ctx(z in phi, w in phi)$ derivable, because:
  - $psi(z, w) = Idp(phi, z, w)$
  - #judgment derivable:
  #align(center, box[
    #set text(9pt)
    #prooftree(
          axiom(label: $pi_(3.1)$, $phi type ctx()$),
          axiom(label: $pi_(3.2)$, $z in phi, w in phi cont$),
        rule(n: 2, label: "ind-ty)", $phi type ctx(z in phi, w in phi)$),
          axiom(label: $pi_(3.2)$, $z in phi, w in phi cont$),
        rule(label: var, $z in phi ctx(z in phi, w in phi)$),
          axiom(label: $pi_(3.2)$, $z in phi, w in phi cont$),
        rule(label: var, $w in phi ctx(z in phi, w in phi)$),
      rule(n: 3, label: FIdp, judgment)
    )
  ])

  Where:
  #pi-enum[
  #{ judgment = $sum(x in A) Idp(A, a, x) type ctx()$ }
  + $phi type ctx()$ derivable, because:
    - $phi = sum(x in A) Idp(A, a, x)$
    - #judgment derivable:
    #align(center, box[
      #set text(8pt)
      #prooftree(
            axiom(label: $a_1$, $A type ctx()$),
            ..var-cont($x$),
          rule(n: 2, label: "ind-ty)", $A type ctx(x in A)$),
            axiom(label: $a_2$, $a in A ctx()$),
            ..var-cont($x$),
          rule(n: 2, label: "ind-ter)", $a in A ctx(x in A)$),
            ..var-cont($x$),
          rule(label: var, $x in A ctx(x in A)$),
        rule(n: 3, label: FIdp, $Idp(A, a, x) type ctx(x in A)$),
        rule(label: Fsum, judgment)
      )
    ])

  #{ judgment = $z in phi, w in phi cont$ }
  + #judgment derivable:
    #align(center, box[
      #prooftree(
          axiom(label: $pi_(3.1)$, $phi type ctx()$),
            axiom(label: $pi_(3.1)$, $phi type ctx()$),
          rule(label: Fc, $z in phi cont$),
        rule(n: 2, label: "ind-ty)", $phi type ctx(z in phi)$),
        rule(label: Fc, judgment)
      )
    ])
  ]
]
