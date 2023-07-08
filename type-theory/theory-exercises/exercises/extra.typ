#import "/common.typ": *

#exercise(
  section: (num: "5", title: "How to translate predicative logic with equality into type theory"),
  ex: 3,
  [The following judgment

  $fa(x in A) ex(y in B) R(x, y) ->$
  $ fa(x1 in A, x2 in A) ex(y1 in B, y2 in B) ( (R(x1, y1) & R(x2, y2)) & (x1 =_A x2 -> y1 =_B y1) ) tr ctx(Gamma) $

  is derivable in type theory with the types described so far, assuming that $A type ctx(Gamma)$ and $B type ctx(Gamma)$ and $R(x, y) type ctx(Gamma)$ are derivable in type theory \
  ?? ??]
)


#pagebreak()
#exercise(
  section: (num: "5", title: "How to translate predicative logic with equality into type theory"),
  ex: 15,
  solution: false,
  [Show that by using the *Propositional Equality with Path Induction*, for any type $A$ and $a in A$, there exists a proof-term #q
  $ #q in Sigma_(z in Sigma_(x in A) ...) "and other scary things..." $],
)
