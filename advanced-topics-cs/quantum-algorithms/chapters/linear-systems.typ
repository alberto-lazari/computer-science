#import "/common.typ": *

= Linear systems solving
Linear systems can be solved by a quantum algorithm.

Given a linear system $A x = b, quad A in CC^(2^n times 2^n), b in CC^(2^n)$ \
The solution $x$ of the system is encoded in a quantum state $ket(psi)$ such that
$ mat(delim: "||", ket(psi) - ket("amp"(x))) lt.eq.slant epsilon $

For some precision parameter $epsilon > 0$.

$ket("amp"(x))$ is the amplitude encoding of the solution as a quantum state, equivalent to
$ ket("amp"(x))
  :=
  display(sum_(jstr in {0, 1}^n)) x_j / (||x||) ket(jstr)
  =
  mat(
    x_1 \/||x||;
    x_2 \/||x||;
    dots.v;
    x_(2^n - 1) \/||x||;
  )
$

By encoding the result in a quantum state it cannot be immediately measured.
The algorithm is supposed to be used as a stepping stone for other operations, as there is no performance improvement over classical methods if the aim is to measure the solution.
