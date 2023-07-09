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
  + $R(x, y) type ctx(Gamma)$
]

Let $pf = ??$
