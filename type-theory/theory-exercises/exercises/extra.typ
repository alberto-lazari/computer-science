#import "/common.typ": *

#exercise(
  section: (num: "5", title: "How to translate predicative logic with equality into type theory"),
  ex: 3,
  [The following judgment

  $fa(x in A) ex(y in B) R(x, y) to$
  $ fa(x1 in A, x2 in A) ex(y1 in B, y2 in B) (space (R(x1, y1) amp R(x2, y2)) amp (x1 =_A x2 to y1 =_B y2) space) tr ctx(Gamma) $

  is derivable in type theory with the types described so far, assuming that $A type ctx(Gamma)$ and $B type ctx(Gamma)$ and $R(x, y) type ctx(Gamma)$ are derivable in type theory \
  ?? ??]
)
Assuming:
#pi-enum[
  + $A type ctx(Gamma)$
  + $B type ctx(Gamma)$
  + $R(x, y) type ctx(Gamma)$
]
The judgment \
$fa(x in A) ex(y in B) R(x, y) to$
$ fa(x1 in A, x2 in A) ex(y1 in B, y2 in B) (space (R(x1, y1) amp R(x2, y2)) amp (x1 =_A x2 to y1 =_B y2) space) tr ctx(Gamma) $
is derivable: (I suppose?)
