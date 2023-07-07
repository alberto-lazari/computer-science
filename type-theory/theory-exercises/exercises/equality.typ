#import "/common.typ": *

#exercise(
  section: (num: "3.6", title: "Martin-Löf's Intensional Propositional Equality"),
  ex: 8,
  [Prove that there exists a proof-term $pf$ such that.
  $ pf in Id(N1, x, w) ctx(x in N1, w in N1) $
  is derivable.]
)

#align(center, box[
  #set text(7pt)
  #prooftree(
        axiom($...$),
      rule($Id(N1, z1, z2) type ctx(Gamma, z1 in N1, z2 in N1, z3 in Id(N1, z1, z2))$),
        axiom($...$),
      rule($$),
        axiom($...$),
      rule($$),
        axiom($...$),
      rule($$),
        axiom($...$),
      rule($$),
    rule(n: 5, label: EId, $ElId(id(star), (y). id(y)) in Id(N1, x, w) ctx(x in N1, w in N1)$)  
  )
])
