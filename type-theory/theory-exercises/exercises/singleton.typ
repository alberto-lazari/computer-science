#import "/common.typ": *

#exercise(
  section: (num: "3.1", title: "Singleton type and exercises"),
  ex: 3,
  solution: false,
  [Show that the rule E-S) is derivable in the type theory $T_1$ replacing the rule ES) elimination with the E-$N1prog)$ rule and adding the substitution and weakening rules and the sanitary checks rules set out in the previous sections.]
)

- Rule E-S)
$
  #prooftree(
    axiom($t in N1 ctx(Gamma)$),
    axiom($M(z) type ctx(Gamma, z in N1)$),
    axiom($c in M(star) ctx(Gamma)$),
    rule(n: 3, label: "E-S)", $ElN1(t, c) in M(t) ctx(Gamma)$),
  )
$
- Rule E-$N1prog)$
$
  #prooftree(
    axiom($D(w) type ctx(Sigma, w in N1)$),
    axiom($d in D(star) ctx(Sigma)$),
    rule(n: 2, label: $"E-"N1prog)$, $ElN1(w, d) in D(w) ctx(Sigma, w in N1)$),
  )
$

== Solution
Assuming:
#pi-enum[
  + $t in N1 ctx(Gamma)$
  + $M(z) type ctx(Gamma, z in N1)$
  + $c in M(star) ctx(Gamma)$
]

The rule E-S) is derivable:
$
  #prooftree(
        axiom(label: $pi_2$, $M(z) type ctx(Gamma, z in N1)$),
        axiom(label: $pi_3$, $c in M(star) ctx(Gamma)$),
      rule(n: 2, label: $"E-"N1prog)$, $ElN1(z, c) in M(z) ctx(Gamma, z in N1)$),
      axiom(label: $pi_1$, $t in N1 ctx(Gamma)$),
    rule(n: 2, label: "sub-ter)", $ElN1(t, c) in M(t) ctx(Gamma)$),
  )
$
