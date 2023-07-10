#import "/common.typ": *

#exercise(
  section: (num: "5", title: "How to translate predicative logic with equality into type theory"),
  ex: 15,
  solution: false,
  [Show that by using the *Propositional Equality with Path Induction*, for any type $A$ and $a in A$, there exists a proof-term #q
  $ #q in sum(z in sum(x in A) Idp(A, a, x)) fa(w in sum(x in A) Idp(A, a, x)) Idp(sum(x in A) Idp(A, a, x), z, w) $],
)

#let q1 = $a$
#let q2 = $id(a)$
#let elid2 = $id(alpha)$
#let elsum2 = $ElIdp(x2, elid2)$
#let q3 = $Elsum(w, elsum2)$
#let qtot = $angle.l alpha, lambda w. q3 angle.r$

First, I transform the universal quantifier into a dependent product, in order to be able to derive it in type theory. The original judgment so becomes
$ sum(z in sum(x in A) Idp(A, a, x)) prod(w in sum(x in A) Idp(A, a, x)) Idp(sum(x in A) Idp(A, a, x), z, w) $

== Solution
Assuming:
#a-enum[
  + $A type ctx()$
  + $a in A ctx()$
]

#let phi = $phi.alt$
- Let $alpha = angle.l a, id(a) angle.r$
- Let $#q = qtot$
- Let $phi = sum(x in A) Idp(A, a, x)$
- Let $psi(z) = Idp(sum(x in A) Idp(A, a, x), z, w)$

#let judgment = $qtot in sum(z in phi) prod(w in phi) psi(z) ctx()$
#judgment derivable:
#align(center, box[
  #set text(9pt)
  #prooftree(
      axiom(label: $pi_1$, $alpha in phi ctx()$),
        axiom(label: $pi_2$, $q3 in psi(alpha) ctx(w in phi)$),
      rule(label: Iprod, $lambda w. q3 in prod(w in phi) psi(alpha) ctx()$),
        axiom(label: $pi_3$, $psi(z) type ctx(z in phi, w in phi)$),
      rule(label: Fprod, $prod(w in phi) psi(z) type ctx(z in phi)$),
    rule(n: 3, label: Isum, judgment)
  )
])

Where:
#pi-enum[
#{ judgment = $angle.l q1, q2 angle.r in sum(x in A) Idp(A, a, x) ctx()$ }
+ $alpha in phi ctx()$ derivable, because:
  - $alpha = angle.l a, id(a) angle.r$
  - $phi = sum(x in A) Idp(A, a, x)$
  - #judgment derivable:
  #let var-cont(var) = (
      axiom(label: $a_1$, $A type ctx()$),
    rule(label: Fc, $var in A cont$),
  )
  #align(center, box[
    #set text(7pt)
    #prooftree(
          axiom(label: $a_2$, $q1 in A ctx()$),
            axiom(label: $a_2$, $a in A ctx()$),
          rule(label: IId, $q2 in Idp(A, a, a) ctx()$),
              axiom(label: $a_1$, $A type ctx()$),
              ..var-cont($x$),
            rule(n: 2, label: "ind-ty)", $A type ctx(x in A)$),
              ..var-cont($x$),
            rule(label: var, $a in A ctx(x in A)$),
              ..var-cont($x$),
            rule(label: var, $x in A ctx(x in A)$),
          rule(n: 3, label: FId, $Idp(A, a, x) type ctx(x in A)$),
        rule(n: 3, label: Isum, judgment)
    )
  ])

#{ judgment = $q3 in Idp(phi, alpha, w) ctx(w in phi)$ }
+ $q3 in psi(alpha) ctx(w in phi)$ derivable, because:
  - Let $phi = sum(x in A) Idp(A, a, x)$
  - $psi(alpha) = Idp(sum(x in A) Idp(A, a, x), alpha, w)$
  - #judgment derivable:
  #align(center, box[
    #set text(7pt)
    #prooftree(
        axiom(label: $pi_3$, $Idp(phi, z, w) type ctx(w in phi, z in phi)$),
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
      #set text(7pt)
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
          rule(label: IId, $elid2 in Idp(phi, alpha, alpha) ctx(Gamma)$),
        rule(n: 5, label: EIdp, judgment)
      )
    ])

  + $Idp(phi, alpha, angle.l y, z angle.r) type ctx(Gamma, y in A, z in Idp(A, a, y))$ derivable: ...

  #{ judgment = $Delta, x2 in Idp(A, a, x1) cont$ }
  + $Gamma cont$ derivable, because:
    - $Gamma = w in phi, x1 in A, x2 in Idp(A, a, x1)$
    - Let $Delta = w in phi, x1 in A$
    - #judgment derivable:
    #align(center, box[
      #set text(7pt)
      #prooftree(
            axiom(label: $a_1$, $A type ctx()$),
            axiom(label: $pi_(2.4)$, $Delta cont$),
          rule(n: 2, label: "ind-ty)", $A type ctx(Delta)$),
          axiom($a in A ctx(Delta)$),
          axiom($x1 in A ctx(Delta)$),
        rule(n: 3, label: FId, $Idp(A, a, x1) type ctx(Delta)$),
        rule(label: Fc, judgment)
      )
    ])

  #{ judgment = $w in phi, x1 in A cont$ }
  + $Delta cont$ derivable, because:
    - $Delta = w in phi, x1 in A cont$
    - #judgment derivable:
    #align(center, box[
      #set text(7pt)
      #prooftree(
          axiom(label: $a_1$, $A type ctx()$),
            axiom(label: $pi_(3.1)$, $phi type ctx()$),
          rule(label: Fc, $w in phi cont$),
        rule(n: 2, label: "ind-ty)", $A type ctx(w in phi)$),
        rule(label: Fc, judgment)
      )
    ])
  ]

#{ judgment = $Idp(phi, z, w) type ctx(z in phi, w in phi)$ }
+ $psi(z) type ctx(z in sum(x in A) Idp(A, a, x), w in phi)$ derivable, because:
  - Let $phi = sum(x in A) Idp(A, a, x)$
  - $psi(z) = Idp(phi, z, w)$
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
      rule(n: 3, label: FId, judgment)
    )
  ])

  Where:
  #pi-enum[
  #{ judgment = $sum(x in A) Idp(A, a, x) type ctx()$ }
  + $phi type ctx()$ derivable, because:
    - $phi = sum(x in A) Idp(A, a, x)$
    - #judgment derivable:
    #align(center, box[
      #set text(9pt)
      #prooftree(
            axiom(label: $a_1$, $A type ctx()$),
            ..var-cont($x$),
          rule(n: 2, label: "ind-ty)", $A type ctx(x in A)$),
            ..var-cont($x$),
          rule(label: var, $a in A ctx(x in A)$),
            ..var-cont($x$),
          rule(label: var, $x in A ctx(x in A)$),
        rule(n: 3, label: FId, $Idp(A, a, x) type ctx(x in A)$),
        rule(label: Fsum, judgment)
      )
    ])

  #{ judgment = $z in phi, w in phi cont$ }
  + #judgment derivable:
  #align(center, box[
    #set text(9pt)
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
