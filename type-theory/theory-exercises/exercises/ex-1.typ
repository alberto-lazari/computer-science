#import "/common.typ": *

= Section 3.1 -- Ex 3
Show that the rule E-S) is derivable in the type theory $T_1$ replacing the rule ES) elimination with the E-$N1prog)$ rule and adding the substitution and weakening rules and the sanitary checks rules set out in the previous sections.

- Rule E-S)
$
#prooftree(
  axiom($t in N1 ctx(Gamma)$),
  axiom($M(z) type ctx(Gamma, z in N1)$),
  axiom($c in M(star) ctx(Gamma)$),
  rule(n: 3, label: "E-S)", $El(t, c) in M(t) ctx(Gamma)$),
)
$
- Rule E-$N1prog)$
$
#prooftree(
  axiom($D(w) type ctx(Sigma, w in N1)$),
  axiom($d in D(star) ctx(Sigma)$),
  rule(n: 2, label: $"E-"N1prog)$, $El(w, d) in D(w) ctx(Sigma, w in N1)$),
)
$

== Solution
Assuming:
+ $t in N1 ctx(Gamma)$
+ $M(z) type ctx(Gamma, z in N1)$
+ $c in M(star) ctx(Gamma)$

The rule E-S) is derivable:
$
#prooftree(
      axiom(label: "2.", $M(z) type ctx(Gamma, z in N1)$),
      axiom(label: "3.", $c in M(star) ctx(Gamma)$),
    rule(n: 2, label: $"E-"N1prog)$, $El(z, c) in M(z) ctx(Gamma, z in N1)$),
    axiom(label: "1.", $t in N1 ctx(Gamma)$),
  rule(n: 2, label: "sub-ter)", $El(t, c) in M(t) ctx(Gamma)$),
)
$
