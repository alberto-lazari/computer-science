#import "/common.typ": *

#exercise(
  section: (num: "3.2", title: "Natural Numbers Type"),
  ex: 3,
  [Define the addition operation using the rules of the natural number type
  $ x + y in Nat ctx(x in Nat, y in Nat) $
  such that $x + 0 = x in Nat ctx(x in Nat)$.]
)
The addition $x + y$ can be defined as:
$ ElNat(y, x, (w, z). succ(z)) $

Let $Gamma = x in Nat, y in Nat$; \
$x + y in Nat ctx(x in Nat, y in Nat)$ is derivable:

#align(center, box[
  #set text(8pt)
  #prooftree(
        axiom($Gamma cont$),
      rule(label: var, $y in Nat ctx(Gamma)$),
        axiom($Gamma cont$),
      rule(label: FNat, $Nat type ctx(Gamma)$),
        axiom($Gamma cont$),
      rule(label: var, $x in Nat ctx(Gamma)$),
        axiom($Gamma cont$),
        rule(label: Fc, $Gamma, w in Nat cont$),
        rule(label: FNat, $Nat type ctx(Gamma, w in Nat)$),
        rule(label: Fc, $Gamma, w in Nat, z in Nat cont$),
        rule(label: var, $z in Nat ctx(Gamma, w in Nat, z in Nat)$),
      rule(label: I2Nat, $succ(z) in Nat ctx(Gamma, w in Nat, z in Nat)$),
    rule(n: 4, label: ENat, $ElNat(y, x, (w, z). succ(z)) in Nat ctx(Gamma)$)
  )
])

Where $Gamma cont$ derivable, because $Gamma = x in Nat, y in Nat$ and $x in Nat, y in Nat cont$ derivable:

#let Nat-type = (
    axiom($ctx() cont$),
  rule(label: FNat, $Nat type ctx()$),
)
#let var-cont(var) = (
  ..Nat-type,
  rule(label: Fc, $#var in Nat cont$),
)

$
  #prooftree(
    ..var-cont("x"),
    rule(label: FNat, $Nat type ctx(x in Nat)$),
    rule(label: Fc, $x in Nat, y in Nat cont$)
  )
$

== Correctness
The definition is correct, in fact:

=== Base case
$y = 0 => x + y = x + 0 = x$

This is true, because:
- $x + 0 = ElNat(0, x, (w, z). succ(z))$
- $ElNat(0, x, (w, z). succ(z)) = x in Nat ctx(x in Nat)$ derivable:
#align(center, box[
  #set text(8pt)
  #prooftree(
        ..var-cont("x"),
      rule(label: FNat, $Nat type ctx(x in Nat)$),
        ..var-cont("x"),
      rule(label: var, $x in Nat ctx(x in Nat)$),
          ..var-cont("x"),
        rule(label: FNat, $Nat type ctx(x in Nat)$),
        rule(label: Fc, $x in Nat, w in Nat cont$),
        rule(label: FNat, $Nat type ctx(x in Nat, w in Nat)$),
        rule(label: Fc, $x in Nat, w in Nat, z in Nat cont$),
        rule(label: var, $z in Nat ctx(x in Nat, w in Nat, z in Nat)$),
      rule(label: I2Nat, $succ(z) in Nat ctx(x in Nat, w in Nat, z in Nat)$),
    rule(n: 3, label: C1Nat, $ElNat(0, x, (w, z). succ(z)) = x in Nat ctx(x in Nat)$)
  )
])

=== Inductive case
$y = succ(v) ctx(v in Nat) => x + y = x + succ(v) = succ(x + v)$

This is true, because:
- $x + succ(v) = ElNat(succ(v), x, (w, z). succ(z))$
- $succ(x + v) = succ(ElNat(v, x, (w, z). succ(z)))$
- Let $Gamma = x in Nat, v in Nat$; \
  $ElNat(succ(v), x, (w, z). succ(z)) = succ(ElNat(v, x, (w, z). succ(z))) in Nat ctx(Gamma)$ derivable:
#align(center, box[
  #set text(8pt)
  #prooftree(
        axiom($Gamma cont$),
      rule(label: var, $v in Nat ctx(Gamma)$),
        axiom($Gamma cont$),
      rule(label: FNat, $Nat type ctx(Gamma)$),
        axiom($Gamma cont$),
      rule(label: var, $x in Nat ctx(Gamma)$),
        axiom($Gamma cont$),
        rule(label: Fc, $Gamma, w in Nat cont$),
        rule(label: FNat, $Nat type ctx(Gamma, w in Nat)$),
        rule(label: Fc, $Gamma, w in Nat, z in Nat cont$),
        rule(label: var, $z in Nat ctx(Gamma, w in Nat, z in Nat)$),
      rule(label: I2Nat, $succ(z) in Nat ctx(Gamma, w in Nat, z in Nat)$),
    rule(n: 4, label: C2Nat, $ElNat(succ(v), x, (w, z). succ(z)) = succ(ElNat(v, x, (w, z). succ(z))) in Nat ctx(Gamma)$)
  )
])

Where $Gamma cont$ derivable, because $Gamma = x in Nat, v in Nat$ and $x in Nat, v in Nat cont$ derivable:
$
  #prooftree(
    ..var-cont("x"),
    rule(label: FNat, $Nat type ctx(x in Nat)$),
    rule(label: Fc, $x in Nat, v in Nat cont$)
  )
$

#exercise(
  section: (num: "3.2", title: "Natural Numbers Type"),
  ex: 4,
  [Define the addition operation using the rules of the natural number type
  $ x + y in Nat ctx(x in Nat, y in Nat) $
  such that $0 + x = x in Nat ctx(x in Nat)$.]
)
The addition $x + y$ can be defined as:
$ ElNat(x, y, (w, z). succ(z)) $

Let $Gamma = x in Nat, y in Nat$; \
$x + y in Nat ctx(x in Nat, y in Nat)$ is derivable:
#align(center, box[
  #set text(8pt)
  #prooftree(
        axiom($Gamma cont$),
      rule(label: var, $x in Nat ctx(Gamma)$),
        axiom($Gamma cont$),
      rule(label: FNat, $Nat type ctx(Gamma)$),
        axiom($Gamma cont$),
      rule(label: var, $y in Nat ctx(Gamma)$),
        axiom($Gamma cont$),
        rule(label: Fc, $Gamma, w in Nat cont$),
        rule(label: FNat, $Nat type ctx(Gamma, w in Nat)$),
        rule(label: Fc, $Gamma, w in Nat, z in Nat cont$),
        rule(label: var, $z in Nat ctx(Gamma, w in Nat, z in Nat)$),
      rule(label: I2Nat, $succ(z) in Nat ctx(Gamma, w in Nat, z in Nat)$),
    rule(n: 4, label: ENat, $ElNat(x, y, (w, z). succ(z)) in Nat ctx(Gamma)$)
  )
])

Where $Gamma cont$ derivable, because $Gamma = x in Nat, y in Nat$ and $x in Nat, y in Nat cont$ derivable:
$
  #prooftree(
    ..Nat-type,
    rule(label: Fc, $x in Nat cont$),
    rule(label: FNat, $Nat type ctx(x in Nat)$),
    rule(label: Fc, $x in Nat, y in Nat cont$)
  )
$

== Correctness
The definition is correct, in fact:

=== Base case
$x = 0 => x + y = 0 + y = y$

Note that the exercise requires that $0 + x = x in Nat ctx(x in Nat)$, but that is equivalent to proving that $0 + y = y in Nat ctx(y in Nat)$, by renaming $y$ to $x$ in the latter, and this is true, because:
- $0 + y = ElNat(0, y, (w, z). succ(z))$
- $ElNat(0, y, (w, z). succ(z)) = y in Nat ctx(y in Nat)$ derivable:
#align(center, box[
  #set text(8pt)
  #prooftree(
        ..var-cont("y"),
      rule(label: FNat, $Nat type ctx(y in Nat)$),
        ..var-cont("y"),
      rule(label: var, $y in Nat ctx(y in Nat)$),
          ..var-cont("y"),
        rule(label: FNat, $Nat type ctx(y in Nat)$),
        rule(label: Fc, $y in Nat, w in Nat cont$),
        rule(label: FNat, $Nat type ctx(y in Nat, w in Nat)$),
        rule(label: Fc, $y in Nat, w in Nat, z in Nat cont$),
        rule(label: var, $z in Nat ctx(y in Nat, w in Nat, z in Nat)$),
      rule(label: I2Nat, $succ(z) in Nat ctx(y in Nat, w in Nat, z in Nat)$),
    rule(n: 3, label: C1Nat, $ElNat(0, y, (w, z). succ(z)) = y in Nat ctx(y in Nat)$)
  )
])

=== Inductive case
$x = succ(v) ctx(v in Nat) => x + y = succ(v) + y = succ(v + y)$

This is true, because:
- $succ(v) + y = ElNat(succ(v), y, (w, z). succ(z))$
- $succ(v + y) = succ(ElNat(v, y, (w, z). succ(z)))$
- Let $Gamma = v in Nat, y in Nat$; \
  $ElNat(succ(v), y, (w, z). succ(z)) = succ(ElNat(v, y, (w, z). succ(z))) in Nat ctx(Gamma)$ derivable:
#align(center, box[
  #set text(8pt)
  #prooftree(
        axiom($Gamma cont$),
      rule(label: var, $v in Nat ctx(Gamma)$),
        axiom($Gamma cont$),
      rule(label: FNat, $Nat type ctx(Gamma)$),
        axiom($Gamma cont$),
      rule(label: var, $y in Nat ctx(Gamma)$),
        axiom($Gamma cont$),
        rule(label: Fc, $Gamma, w in Nat cont$),
        rule(label: FNat, $Nat type ctx(Gamma, w in Nat)$),
        rule(label: Fc, $Gamma, w in Nat, z in Nat cont$),
        rule(label: var, $z in Nat ctx(Gamma, w in Nat, z in Nat)$),
      rule(label: I2Nat, $succ(z) in Nat ctx(Gamma, w in Nat, z in Nat)$),
    rule(n: 4, label: C2Nat, $ElNat(succ(v), y, (w, z). succ(z)) = succ(ElNat(v, y, (w, z). succ(z))) in Nat ctx(Gamma)$)
  )
])

Where $Gamma cont$ derivable, because $Gamma = v in Nat, y in Nat$ and $v in Nat, y in Nat cont$ derivable:
$
  #prooftree(
    ..var-cont("v"),
    rule(label: FNat, $Nat type ctx(v in Nat)$),
    rule(label: Fc, $v in Nat, y in Nat cont$)
  )
$


#exercise(
  section: (num: "3.2", title: "Natural Numbers Type"),
  ex: 6,
  [Define the predecessor operator
  $ #p (x) in Nat ctx(x in Nat) $
  such that
  $
    &#p (0) = 0 \
    &#p (succ(#n)) = #n
  $]
)
The predecessor $#p (x)$ can be defined as:
$ ElNat(x, 0, (w, z). w) $

$#p (x) in Nat ctx(x in Nat)$ is derivable:

#align(center, box[
  #set text(7pt)
  #prooftree(
        ..var-cont("x"),
      rule(label: var, $x in Nat ctx(x in Nat)$),
        ..var-cont("x"),
      rule(label: FNat, $Nat type ctx(x in Nat)$),
        ..var-cont("x"),
      rule(label: I1Nat, $0 in Nat ctx(x in Nat)$),
        ..var-cont("x"),
        rule(label: FNat, $Nat type ctx(x in Nat)$),
        rule(label: Fc, $x in Nat, w in Nat cont$),
        rule(label: FNat, $Nat type ctx(x in Nat, w in Nat)$),
        rule(label: Fc, $x in Nat, w in Nat, z in Nat cont$),
      rule(label: var, $w in Nat ctx(x in Nat, w in Nat, z in Nat)$),
    rule(n: 4, label: ENat, $ElNat(x, 0, (w, z). w) in Nat ctx(x in Nat)$)
  )
])

== Correctness
The definition is correct, in fact:

=== Base case
$x = 0 => #p (x) = #p (0) = 0$

This is true, because:
- $#p (0) = ElNat(0, 0, (w, z). w)$
- $ElNat(0, 0, (w, z). w) = 0 in Nat ctx()$ derivable:
$
  #prooftree(
      ..Nat-type,
        axiom($ctx() cont$),
      rule(label: I1Nat, $0 in Nat ctx()$),
        ..var-cont("w"),
        rule(label: FNat, $Nat type ctx(w in Nat)$),
        rule(label: Fc, $w in Nat, z in Nat cont$),
      rule(label: var, $w in Nat ctx(w in Nat, z in Nat)$),
    rule(n: 3, label: C1Nat, $ElNat(0, 0, (w, z). w) = 0 in Nat ctx()$)
  )
$

=== Inductive case
$x = succ(y) ctx(y in Nat) => #p (x) = #p (succ(y)) = y$

This is true, because:
- $#p (succ(y)) = ElNat(succ(y), 0, (w, z). w)$
- $ElNat(succ(y), 0, (w, z). w) = y in Nat ctx(y in Nat)$ derivable:
#align(center, box[
  #set text(8pt)
  #prooftree(
        ..var-cont("y"),
      rule(label: var, $y in Nat ctx(y in Nat)$),
        ..var-cont("y"),
      rule(label: FNat, $Nat type ctx(y in Nat)$),
        axiom($ctx() cont$),
      rule(label: I1Nat, $0 in Nat ctx()$),
        ..var-cont("y"),
        rule(label: FNat, $Nat type ctx(y in Nat)$),
        rule(label: Fc, $y in Nat, w in Nat cont$),
        rule(label: FNat, $Nat type ctx(y in Nat, w in Nat)$),
        rule(label: Fc, $y in Nat, w in Nat, z in Nat cont$),
      rule(label: var, $w in Nat ctx(y in Nat, w in Nat, z in Nat)$),
    rule(n: 4, label: C2Nat, $ElNat(succ(y), 0, (w, z). w) = y in Nat ctx(y in Nat)$)
  )
])
