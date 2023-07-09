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
