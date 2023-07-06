#import "/common.typ": *

= 3.1 Singleton type -- Ex 3
Show that the rule E-S) is derivable in the type theory $T_1$ replacing the rule ES) elimination with the E-$n1prog)$ rule and adding the substitution and weakening rules and the sanitary checks rules set out in the previous sections.

- Rule E-S)
$
#prooftree(
  axiom($t in n1 ctx(Gamma)$),
  axiom($M(z) type ctx(Gamma, z in n1)$),
  axiom($c in M(star) ctx(Gamma)$),
  rule(n: 3, label: "E-S)", $eln1(t, c) in M(t) ctx(Gamma)$),
)
$
- Rule E-$n1prog)$
$
#prooftree(
  axiom($D(w) type ctx(Sigma, w in n1)$),
  axiom($d in D(star) ctx(Sigma)$),
  rule(n: 2, label: $"E-"n1prog)$, $eln1(w, d) in D(w) ctx(Sigma, w in n1)$),
)
$

== Solution
Assuming:
#pi-enum[
  + $t in n1 ctx(Gamma)$
  + $M(z) type ctx(Gamma, z in n1)$
  + $c in M(star) ctx(Gamma)$
]

The rule E-S) is derivable:
$
#prooftree(
      axiom(label: $pi_2$, $M(z) type ctx(Gamma, z in n1)$),
      axiom(label: $pi_3$, $c in M(star) ctx(Gamma)$),
    rule(n: 2, label: $"E-"n1prog)$, $eln1(z, c) in M(z) ctx(Gamma, z in n1)$),
    axiom(label: $pi_1$, $t in n1 ctx(Gamma)$),
  rule(n: 2, label: "sub-ter)", $eln1(t, c) in M(t) ctx(Gamma)$),
)
$
