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
      rule(label: var, $y in nat ctx(Gamma)$),
        axiom($Gamma cont$),
      rule(label: fnat, $nat type ctx(Gamma)$),
        axiom($Gamma cont$),
      rule(label: var, $x in nat ctx(Gamma)$),
        axiom($Gamma cont$),
        rule(label: fc, $Gamma, w in nat cont$),
        rule(label: fnat, $nat type ctx(Gamma, w in nat)$),
        rule(label: fc, $Gamma, w in nat, z in nat cont$),
        rule(label: var, $z in nat ctx(Gamma, w in nat, z in nat)$),
      rule(label: i2nat, $succ(z) in nat ctx(Gamma, w in nat, z in nat)$),
    rule(n: 4, label: enat, $elnat(y, x, (w, z). succ(z)) in nat ctx(Gamma)$)
  )
])

Where $Gamma cont$ derivable, because $Gamma = x in nat, y in nat$ and $x in nat, y in nat cont$ derivable:

#let nat-type = (
    axiom($ctx() cont$),
  rule(label: fnat, $nat type ctx()$),
)
#let var-cont(var) = (
  ..nat-type,
  rule(label: fc, $#var in nat cont$),
)

$
  #prooftree(
    ..var-cont("x"),
    rule(label: fnat, $nat type ctx(x in nat)$),
    rule(label: fc, $x in nat, y in nat cont$)
  )
$

== Correctness
The definition is correct, in fact:

=== Base case
$y = 0 => x + y = x + 0 = x$

This is true, because:
- $x + 0 = elnat(0, x, (w, z). succ(z))$
- $elnat(0, x, (w, z). succ(z)) = x in nat ctx(x in nat)$ derivable:
#align(center, box[
  #set text(size: 8pt)
  #prooftree(
        ..var-cont("x"),
      rule(label: fnat, $nat type ctx(x in nat)$),
        ..var-cont("x"),
      rule(label: var, $x in nat ctx(x in nat)$),
          ..var-cont("x"),
        rule(label: fnat, $nat type ctx(x in nat)$),
        rule(label: fc, $x in nat, w in nat cont$),
        rule(label: fnat, $nat type ctx(x in nat, w in nat)$),
        rule(label: fc, $x in nat, w in nat, z in nat cont$),
        rule(label: var, $z in nat ctx(x in nat, w in nat, z in nat)$),
      rule(label: i2nat, $succ(z) in nat ctx(x in nat, w in nat, z in nat)$),
    rule(n: 3, label: c1nat, $elnat(0, x, (w, z). succ(z)) = x in nat ctx(x in nat)$)
  )
])

=== Inductive case
$y = succ(v) ctx(v in nat) => x + y = x + succ(v) = succ(x + v)$

This is true, because:
- $x + succ(v) = elnat(succ(v), x, (w, z). succ(z))$
- $succ(x + v) = succ(elnat(v, x, (w, z). succ(z)))$
- Let $Gamma = x in nat, v in nat$; \
  $elnat(succ(v), x, (w, z). succ(z)) = succ(elnat(v, x, (w, z). succ(z))) in nat ctx(Gamma)$ derivable:

#align(center, box[
  #set text(size: 8pt)
  #prooftree(
        axiom($Gamma cont$),
      rule(label: var, $v in nat ctx(Gamma)$),
        axiom($Gamma cont$),
      rule(label: fnat, $nat type ctx(Gamma)$),
        axiom($Gamma cont$),
      rule(label: var, $x in nat ctx(Gamma)$),
        axiom($Gamma cont$),
        rule(label: fc, $Gamma, w in nat cont$),
        rule(label: fnat, $nat type ctx(Gamma, w in nat)$),
        rule(label: fc, $Gamma, w in nat, z in nat cont$),
        rule(label: var, $z in nat ctx(Gamma, w in nat, z in nat)$),
      rule(label: i2nat, $succ(z) in nat ctx(Gamma, w in nat, z in nat)$),
    rule(n: 4, label: c2nat, $elnat(succ(v), x, (w, z). succ(z)) = succ(elnat(v, x, (w, z). succ(z))) in nat ctx(Gamma)$)
  )
])

Where $Gamma cont$ derivable, because $Gamma = x in nat, v in nat$ and $x in nat, v in nat cont$ derivable:
$
  #prooftree(
    ..var-cont("x"),
    rule(label: fnat, $nat type ctx(x in nat)$),
    rule(label: fc, $x in nat, v in nat cont$)
  )
$

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
      rule(label: var, $x in nat ctx(Gamma)$),
        axiom($Gamma cont$),
      rule(label: fnat, $nat type ctx(Gamma)$),
        axiom($Gamma cont$),
      rule(label: var, $y in nat ctx(Gamma)$),
        axiom($Gamma cont$),
        rule(label: fc, $Gamma, w in nat cont$),
        rule(label: fnat, $nat type ctx(Gamma, w in nat)$),
        rule(label: fc, $Gamma, w in nat, z in nat cont$),
        rule(label: var, $z in nat ctx(Gamma, w in nat, z in nat)$),
      rule(label: i2nat, $succ(z) in nat ctx(Gamma, w in nat, z in nat)$),
    rule(n: 4, label: enat, $elnat(x, y, (w, z). succ(z)) in nat ctx(Gamma)$)
  )
])

Where $Gamma cont$ derivable, because $Gamma = x in nat, y in nat$ and $x in nat, y in nat cont$ derivable:
$
  #prooftree(
    ..nat-type,
    rule(label: fc, $x in nat cont$),
    rule(label: fnat, $nat type ctx(x in nat)$),
    rule(label: fc, $x in nat, y in nat cont$)
  )
$

== Correctness
The definition is correct, in fact:

=== Base case
$x = 0 => x + y = 0 + y = y$

Note that the exercise requires that $0 + x = x in nat ctx(x in nat)$, but that is equivalent to proving that $0 + y = y in nat ctx(y in nat)$, by renaming $y$ to $x$ in the latter, and this is true, because:
- $0 + y = elnat(0, y, (w, z). succ(z))$
- $elnat(0, y, (w, z). succ(z)) = y in nat ctx(y in nat)$ derivable:

#align(center, box[
  #set text(size: 8pt)
  #prooftree(
        ..var-cont("y"),
      rule(label: fnat, $nat type ctx(y in nat)$),
        ..var-cont("y"),
      rule(label: var, $y in nat ctx(y in nat)$),
          ..var-cont("y"),
        rule(label: fnat, $nat type ctx(y in nat)$),
        rule(label: fc, $y in nat, w in nat cont$),
        rule(label: fnat, $nat type ctx(y in nat, w in nat)$),
        rule(label: fc, $y in nat, w in nat, z in nat cont$),
        rule(label: var, $z in nat ctx(y in nat, w in nat, z in nat)$),
      rule(label: i2nat, $succ(z) in nat ctx(y in nat, w in nat, z in nat)$),
    rule(n: 3, label: c1nat, $elnat(0, y, (w, z). succ(z)) = y in nat ctx(y in nat)$)
  )
])

=== Inductive case
$x = succ(v) ctx(v in nat) => x + y = succ(v) + y = succ(v + y)$

By the $upright(C_2)"-"nat$) rule:
$ elnat(succ(v), y, (w, z). succ(z)) = succ(elnat(v, y, (w, z). succ(z))) in nat ctx(v in nat, y in nat) $


= 3.2 Natural numbers type -- Ex 6
Define the predecessor operator
$ #p (x) in nat ctx(x in nat) $
such that
$
  &#p (0) = 0 \
  &#p (succ(#n)) = #n
$

== Solution
The predecessor $#p (x)$ can be defined as:
$ elnat(x, 0, (w, z). w) $

$#p (x) in nat ctx(x in nat)$ is derivable:

#align(center, box[
  #set text(size: 7pt)
  #prooftree(
        ..var-cont("x"),
      rule(label: var, $x in nat ctx(x in nat)$),
        ..var-cont("x"),
      rule(label: fnat, $nat type ctx(x in nat)$),
        ..var-cont("x"),
      rule(label: i1nat, $0 in nat ctx(x in nat)$),
        ..var-cont("x"),
        rule(label: fnat, $nat type ctx(x in nat)$),
        rule(label: fc, $x in nat, w in nat cont$),
        rule(label: fnat, $nat type ctx(x in nat, w in nat)$),
        rule(label: fc, $x in nat, w in nat, z in nat cont$),
      rule(label: var, $w in nat ctx(x in nat, w in nat, z in nat)$),
    rule(n: 4, label: enat, $elnat(x, 0, (w, z). w) in nat ctx(x in nat)$)
  )
])

== Correctness
The definition is correct, in fact:

=== Base case
$x = 0 => #p (x) = #p (0) = 0$

This is true, because:
- $#p (0) = elnat(0, 0, (w, z). w)$
- $elnat(0, 0, (w, z). w) = 0 in nat ctx()$ derivable:
$
  #prooftree(
      ..nat-type,
        axiom($ctx() cont$),
      rule(label: i1nat, $0 in nat ctx()$),
        ..var-cont("w"),
        rule(label: fnat, $nat type ctx(w in nat)$),
        rule(label: fc, $w in nat, z in nat cont$),
      rule(label: var, $w in nat ctx(w in nat, z in nat)$),
    rule(n: 3, label: c1nat, $elnat(0, 0, (w, z). w) = 0 in nat ctx()$)
  )
$

=== Inductive case
$x = succ(y) ctx(y in nat) => #p (x) = #p (succ(y)) = y$

This is true, because:
- $#p (succ(y)) = elnat(succ(y), 0, (w, z). w)$
- $elnat(succ(y), 0, (w, z). w) = y in nat ctx(y in nat)$ derivable:
#align(center, box[
  #set text(size: 8pt)
  #prooftree(
        ..var-cont("y"),
      rule(label: var, $y in nat ctx(y in nat)$),
        ..var-cont("y"),
      rule(label: fnat, $nat type ctx(y in nat)$),
        axiom($ctx() cont$),
      rule(label: i1nat, $0 in nat ctx()$),
        ..var-cont("y"),
        rule(label: fnat, $nat type ctx(y in nat)$),
        rule(label: fc, $y in nat, w in nat cont$),
        rule(label: fnat, $nat type ctx(y in nat, w in nat)$),
        rule(label: fc, $y in nat, w in nat, z in nat cont$),
      rule(label: var, $w in nat ctx(y in nat, w in nat, z in nat)$),
    rule(n: 4, label: c2nat, $elnat(succ(y), 0, (w, z). w) = y in nat ctx(y in nat)$)
  )
])
