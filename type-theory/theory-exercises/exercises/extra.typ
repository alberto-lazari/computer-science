#import "/common.typ": *

#exercise(
  section: (num: "5", title: "How to translate predicative logic with equality into type theory"),
  ex: 3,
  solution: false,
  [The following judgment

  $fa(x in A) ex(y in B) R(x, y) to$
  $ fa(x1 in A, x2 in A) ex(y1 in B, y2 in B) (space (R(x1, y1) amp R(x2, y2)) amp (x1 =_A x2 to y1 =_B y2) space) tr ctx(Gamma) $

  is derivable in type theory with the types described so far, assuming that $A type ctx(Gamma)$ and $B type ctx(Gamma)$ and $R(x, y) type ctx(Gamma)$ are derivable in type theory \
  ?? ??]
)

#let phi = $phi.alt$
// For some reason spacing is broken on Id
#let Id = $#h(0em) Id$
- Let $phi = fa(x in A) ex(y in B) R(x, y)$
- Let $psi = fa(x1 in A, x2 in A) ex(y1 in B, y2 in B) (space (R(x1, y1) amp R(x2, y2)) amp (x1 =_A x2 to y1 =_B y2) space)$

By *Def. 5.3*:
$ phi to psi tr ctx(Gamma) $
is derivable in type theory if there exists a proof-term #pf such that
$ pf in (phi to psi)^I ctx(Gamma) $
is derivable in type theory.

$(phi to psi)^I = prod(z1 in phi^I) psi^I$

Where:
- $phi^I = prod(x in A) sum(y in B) R(x, y)$
- $psi^I = prod(x1 in A) prod(x2 in A) sum(y1 in B) sum(y2 in B) ((R(x1, y1) times R(x2, y2)) times (prod(z2 in Id(A, x1, x2)) Id(B, y1, y2)))$

Hence, the exercise reduces to finding a proof-term #pf such that
$ pf in prod(z1 in phi^I) psi^I ctx(Gamma) $

== Solution
Assuming:
#a-enum[
  + $A type ctx(Gamma)$
  + $B type ctx(Gamma)$
  + $R(x, y) type ctx(Gamma, x in A, y in B)$
]

#let psi1(var) = $psi^I_1(var)$
#let psi2(var1, var2) = $psi^I_2(var1, var2)$
#let pf1 = $pf_1$
#let pf2 = $pf_2$
- Let $pf = lambda z1. lambda x1. lambda x2. angle.l pf1, pf2 angle.r$

  Where:
  - $pf1 = ...$
  - $pf2 = ...$

- Let $psi1(y1) = sum(y2 in B) psi2(y1, y2)$

  Where: \
  $psi2(y1, y2) = (R(x1, y1) times R(x2, y2)) times (prod(z2 in Id(A, x1, x2)) Id(B, y1, y2))$

$lambda z1. lambda x1. lambda x2. angle.l pf1, pf2 angle.r in prod(z1 in phi^I) prod(x1 in A) prod(x2 in A) sum(y1 in B) psi1(y1) ctx(Gamma)$ derivable:
#align(center, box[
  #set text(7pt)
  #prooftree(
      axiom(label: $pi_1$, $pf1 in B ctx(Gamma, z1 in phi^I, x1 in A, x2 in A)$),
      axiom(label: $pi_2$, $pf2 in psi1(pf1) ctx(Gamma, z1 in phi^I, x1 in A, x2 in A)$),
      axiom(label: $pi_3$, $psi1(y1) type ctx(Gamma, z1 in phi^I, x1 in A, x2 in A, y1 in B)$),
    rule(n: 3, label: Isum, $angle.l pf1, pf2 angle.r in sum(y1 in B) psi1(y1) ctx(Gamma, z1 in phi^I, x1 in A, x2 in A)$),
    rule(label: Iprod, $lambda x2. angle.l pf1, pf2 angle.r in prod(x2 in A) sum(y1 in B) psi1(y1) ctx(Gamma, z1 in phi^I, x1 in A)$),
    rule(label: Iprod, $lambda x1. lambda x2. angle.l pf1, pf2 angle.r in prod(x1 in A) prod(x2 in A) sum(y1 in B) psi1(y1) ctx(Gamma, z1 in phi^I)$),
    rule(label: Iprod, $lambda z1. lambda x1. lambda x2. angle.l pf1, pf2 angle.r in prod(z1 in phi^I) prod(x1 in A) prod(x2 in A) sum(y1 in B) psi1(y1) ctx(Gamma)$)
  )
])

#pi-enum[
+ $pf1 in B ctx(Gamma, z1 in phi^I, x1 in A, x2 in A)$ derivable, because:
  - $pf1 = ...$
  - ...

+ $pf2 in psi1(pf1) ctx(Gamma, z1 in phi^I, x1 in A, x2 in A)$ derivable, because:
  - $pf2 = ...$
  - $psi1(pf1) = sum(y2 in B) psi2(pf1, y2)$
  - ...

+ $psi1(y1) type ctx(Gamma, z1 in phi^I, x1 in A, x2 in A, y1 in B)$ derivable, because:
  - $psi1(y1) = sum(y2 in B) psi2(y1, y2)$
  - $psi2(y1, y2) = (R(x1, y1) times R(x2, y2)) times (prod(z2 in Id(A, x1, x2)) Id(B, y1, y2))$
  - let $Gamma_3 = Gamma, z1 in phi^I, x1 in A, x2 in A, y1 in B$; \
    $sum(y2 in B) (R(x1, y1) times R(x2, y2)) times (prod(z2 in Id(A, x1, x2)) Id(B, y1, y2)) type ctx(Gamma_3)$ derivable:
    #align(center, box[
      #set text(7pt)
      #prooftree(
            axiom(label: $pi_3.1$, $Id(B, y1, y2) type ctx(Gamma_3, y2 in B, z2 in Id(A, x1, x2))$),
          rule(label: Fprod, $prod(z2 in Id(A, x1, x2)) Id(B, y1, y2) type ctx(Gamma_3, y2 in B)$),
            axiom(label: $pi_3.4$, $R(x1, y1) type ctx(Gamma_3, y2 in B)$),
            axiom(label: $pi_3.5$, $R(x2, y2) type ctx(Gamma_3, y2 in B)$),
          rule(n: 2, label: $"F-"times)$, $R(x1, y1) times R(x2, y2) type ctx(Gamma_3, y2 in B)$),
        rule(n: 2, label: $"F-"times)$, $(R(x1, y1) times R(x2, y2)) times (prod(z2 in Id(A, x1, x2)) Id(B, y1, y2)) type ctx(Gamma_3, y2 in B)$),
        rule(label: Fsum, $sum(y2 in B) (R(x1, y1) times R(x2, y2)) times (prod(z2 in Id(A, x1, x2)) Id(B, y1, y2)) type ctx(Gamma_3)$)
      )
    ])

    Where:
    #pi-enum[
    + $Id(B, y1, y2) type ctx(Gamma_3, y2 in B, z2 in Id(A, x1, x2))$ derivable, because:
      - let $Delta_(3.1) = z1 in phi^I, x1 in A, x2 in A, y1 in B, y2 in B, z2 in Id(A, x1, x2)$
      - $Id(B, y1, y2) type ctx(Gamma, Delta_(3.1))$ derivable
      #align(center, box[
        #set text(9pt)
        #prooftree(
              axiom(label: $a_2$, $B type ctx(Gamma)$),
              axiom(label: $pi_3.2$, $Gamma, Delta_(3.1) cont$),
            rule(n: 2, label: "ind-ty)", $B type ctx(Gamma, Delta_(3.1))$),
              axiom(label: $pi_3.2$, $Gamma, Delta_(3.1) cont$),
            rule(label: var, $y1 in B ctx(Gamma, Delta_(3.1))$),
              axiom(label: $pi_3.2$, $Gamma, Delta_(3.1) cont$),
            rule(label: var, $y2 in B ctx(Gamma, Delta_(3.1))$),
          rule(n: 3, label: FId, $Id(B, y1, y2) type ctx(Gamma, Delta_(3.1))$)
        )
      ])
    + $Gamma, Delta_(3.1) cont$ derivable, because:
      - let $Delta_(3.2) = z1 in phi^I, x1 in A, x2 in A, y1 in B, y2 in B$
      - $Gamma, Delta_(3.2), z2 in Id(A, x1, x2) cont$ derivable:
      #align(center, box[
        #set text(9pt)
        #prooftree(
              axiom(label: $a_1$, $A type ctx(Gamma)$),
              axiom(label: $pi_3.3$, $Gamma, Delta_(3.2) cont$),
            rule(n: 2, label: "ind-ty)", $A type ctx(Gamma, Delta_(3.2))$),
              axiom(label: $pi_3.3$, $Gamma, Delta_(3.2) cont$),
            rule(label: var, $y1 in B ctx(Gamma, Delta_(3.2))$),
              axiom(label: $pi_3.3$, $Gamma, Delta_(3.2) cont$),
            rule(label: var, $y2 in B ctx(Gamma, Delta_(3.2))$),
          rule(n: 3, label: FId, $Id(A, x1, x2) type ctx(Gamma, Delta_(3.2))$),
          rule(label: Fc, $Gamma, Delta_(3.2), z2 in Id(A, x1, x2) cont$)
        )
      ])
    + $Gamma, Delta_(3.2) cont$ derivable, because:
      - $Delta_(3.2) = z1 in phi^I, x1 in A, x2 in A, y1 in B, y2 in B$
      - $Gamma, z1 in phi^I, x1 in A, x2 in A, y1 in B, y2 in B cont$ derivable:
      #align(center, box[
        #set text(9pt)
        #prooftree(
            axiom(label: $a_2$, $B type ctx(Gamma)$),
                axiom(label: $a_2$, $B type ctx(Gamma)$),
                axiom(label: $...$, $Gamma, z1 in phi^I, x1 in A, x2 in A cont$),
              rule(n: 2, label: "ind-ty)", $B type ctx(Gamma, z1 in phi^I, x1 in A, x2 in A)$),
            rule(label: Fc, $Gamma, z1 in phi^I, x1 in A, x2 in A, y1 in B cont$),
          rule(n: 2, label: "ind-ty)", $B type ctx(Gamma, z1 in phi^I, x1 in A, x2 in A, y1 in B)$),
          rule(label: Fc, $Gamma, z1 in phi^I, x1 in A, x2 in A, y1 in B, y2 in B cont$)
        )
      ])
    + $R(x1, y1) type ctx(Gamma_3, y2 in B)$ derivable, because:
      - Let $Delta_(3.4) = ...$
    ]
]


#exercise(
  section: (num: "5", title: "How to translate predicative logic with equality into type theory"),
  ex: 15,
  solution: false,
  [Show that by using the *Propositional Equality with Path Induction*, for any type $A$ and $a in A$, there exists a proof-term #q
  $ #q in sum(z in sum(x in A) Idp(A, a, x)) fa(w in sum(x in A) Idp(A, a, x)) Idp(sum(x in A) Idp(A, a, x), z, w) $],
)

#let q1 = $a$
#let q2 = $id(a)$
#let el = $#q _3$
#let q3 = $Elsum(w, (x, y). el)$
#let qtot = $angle.l alpha, lambda w. q3 angle.r$

First, I transform the universal quantifier into a dependent product, in order to be able to derive it in type theory. The original judgment so becomes
$ sum(z in sum(x in A) Idp(A, a, x)) prod(w in sum(x in A) Idp(A, a, x)) Idp(sum(x in A) Idp(A, a, x), z, w) $

== Solution
Assuming:
#a-enum[
  + $A type ctx()$
  + $a in A ctx()$
]

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
    rule(label: Fc, $var in A cont ctx()$),
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
    #set text(8pt)
    #prooftree(
        axiom(label: $pi_3$, $Idp(phi, z, w) type ctx(w in phi, z in phi)$),
            axiom(label: $pi_(3.1)$, $phi type ctx()$),
          rule(label: Fc, $w in phi cont ctx()$),
        rule(label: var, $w in phi ctx(w in phi)$),
          axiom($...$),
        rule($el in Idp(phi, alpha, angle.l x, y angle.r) ctx(w in phi, x in A, y in Idp(A, a, x))$),
      rule(n: 3, label: Esum, judgment)
    )
  ])

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
