#import "/common.typ": *

= 3.2 Natural numbers type -- Ex 3
Define the addition operation using the rules of the natural number type
$ x + y in nat ctx(x in nat, y in nat) $
such that $x + 0 = x in nat ctx(x in nat)$.

== Solution
The addition $x + y$ can be defined as:
$ elnat(y, x, (w, z). succ(z)) $

Let $Gamma = x in nat, y in nat$; \
$x + y in nat ctx(x in nat, y in nat)$ is derivable:

#align(center, box[
  #set text(size: 8pt)
  #prooftree(
        axiom($Gamma cont$),
      rule(label: "var)", $y in nat ctx(Gamma)$),
        axiom($Gamma cont$),
      rule(label: $"F-"nat)$, $nat type ctx(Gamma)$),
        axiom($Gamma cont$),
      rule(label: "var)", $x in nat ctx(Gamma)$),
                axiom($Gamma cont$),
              rule(label: "F-c)", $Gamma, w in nat cont$),
            rule(label: $"F-"nat)$, $nat type ctx(Gamma, w in nat)$),
          rule(label: "F-c)", $Gamma, w in nat, z in nat cont$),
        rule(label: "var)", $z in nat ctx(Gamma, w in nat, z in nat)$),
      rule(label: $upright(I_2)"-"nat)$, $succ(z) in nat ctx(Gamma, w in nat, z in nat)$),
    rule(n: 4, label: $"E-"nat)$, $elnat(y, x, (w, z). succ(z)) in nat ctx(Gamma)$)
  )
])

Where $Gamma cont = x in nat, y in nat cont$ derivable:
$
#prooftree(
  axiom($ctx() cont$),
  rule(label: $"F-"nat)$, $nat type ctx()$),
  rule(label: "F-c)", $x in nat cont$),
  rule(label: $"F-"nat)$, $nat type ctx(x in nat)$),
  rule(label: "F-c)", $x in nat, y in nat cont$)
)
$

== Correctness
It is correct, in fact:

=== Base case
$y = 0 => x + y = x + 0 = x$

By the $upright(C_1)"-"nat$) rule:
$ elnat(0, x, (w, z). succ(z)) = x in nat ctx(x in nat) $

=== Inductive case
$y = succ(v) ctx(v in nat) => x + y = x + succ(v) = succ(x + v)$

By the $upright(C_2)"-"nat$) rule:
$ elnat(succ(v), x, (w, z). succ(z)) = succ(elnat(v, x, (w, z). succ(z))) in nat ctx(x in nat, v in nat) $


= 3.2 Natural numbers type -- Ex 4
Define the addition operation using the rules of the natural number type
$ x + y in nat ctx(x in nat, y in nat) $
such that $0 + x = x in nat ctx(x in nat)$.

== Solution
The addition $x + y$ can be defined as:
$ elnat(x, y, (w, z). succ(z)) $

Let $Gamma = x in nat, y in nat$; \
$x + y in nat ctx(x in nat, y in nat)$ is derivable:

#align(center, box[
  #set text(size: 8pt)
  #prooftree(
        axiom($Gamma cont$),
      rule(label: "var)", $x in nat ctx(Gamma)$),
        axiom($Gamma cont$),
      rule(label: $"F-"nat)$, $nat type ctx(Gamma)$),
        axiom($Gamma cont$),
      rule(label: "var)", $y in nat ctx(Gamma)$),
                axiom($Gamma cont$),
              rule(label: "F-c)", $Gamma, w in nat cont$),
            rule(label: $"F-"nat)$, $nat type ctx(Gamma, w in nat)$),
          rule(label: "F-c)", $Gamma, w in nat, z in nat cont$),
        rule(label: "var)", $z in nat ctx(Gamma, w in nat, z in nat)$),
      rule(label: $upright(I_2)"-"nat)$, $succ(z) in nat ctx(Gamma, w in nat, z in nat)$),
    rule(n: 4, label: $"E-"nat)$, $elnat(x, y, (w, z). succ(z)) in nat ctx(Gamma)$)
  )
])

Where $Gamma cont = x in nat, y in nat cont$ derivable:
$
#prooftree(
  axiom($ctx() cont$),
  rule(label: $"F-"nat)$, $nat type ctx()$),
  rule(label: "F-c)", $x in nat cont$),
  rule(label: $"F-"nat)$, $nat type ctx(x in nat)$),
  rule(label: "F-c)", $x in nat, y in nat cont$)
)
$

== Correctness
It is correct, in fact:

=== Base case
$x = 0 => x + y = 0 + y = y$

By the $upright(C_1)"-"nat$) rule:
$ elnat(0, y, (w, z). succ(z)) = y in nat ctx(y in nat) $

=== Inductive case
$x = succ(v) ctx(v in nat) => x + y = succ(v) + y = succ(v + y)$

By the $upright(C_2)"-"nat$) rule:
$ elnat(succ(v), y, (w, z). succ(z)) = succ(elnat(v, y, (w, z). succ(z))) in nat ctx(v in nat, y in nat) $
