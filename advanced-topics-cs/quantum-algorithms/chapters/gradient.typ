#import "/common.typ": *

= Gradient estimation
Classical computers are able to estimate the gradient of a $d$-dimension function $f : [0, 1]^d -> RR_+$ at the origin by evaluating $f$ in $O(d)$ time.

Quantum computers are able to do it by evaluating $f$ once, a constant amount of time.

== Jordan's quantum gradient algorithm
Given a linear $d$-dimension function $f(x) = a^top x + b, quad a in RR^d$ the algorithm returns
  $a = nabla f(0)$.

A binary oracle $U_f$ of the function is needed: a matrix such that
$ U_f#ket($arrow(x)$)ket(arrow(y)) =
  ket(arrow(x))ket(arrow(y) plus.square arrow(f(x)))
$

Where $ket(arrow(x))$ is a register composed of $d$ $q$-qubit registers,
  representing the arguments $x_1, x_2, ..., x_d$ of $f ==>
  ket(arrow(x)) = ket(arrow(x_1))ket(arrow(x_2))...ket(arrow(x_d))
$

In particular, when $ket(arrow(y))$ is the initial quantum state
$ U_f#ket($arrow(x)$)ket(arrow(0)) =
  ket(arrow(x))ket(arrow(f(x)))
$

The algorithm returns $a$, which is $nabla f(0)$, the gradient of $f$ at the origin, by applying the $H$ gate on $ket(arrow(x))$, QFT on $ket(arrow(y))$, then $U_f$ on the result.
In order to measure $a$, $"QFT"^(-1)$ is applied.

== Nonlinear functions
If $f$ is nonlinear, an approximation can be constructed as $g(x) = nabla f(0)^top x$.
Then Jordan's algorithm can be applied to $g$, in order to estimate $nabla f(0)$.

$g(x)$ can be expressed (for $m$ large enough) as
$ sum_(k = -m)^m a_n f(k x) $

The complexity is $O(m)$.
