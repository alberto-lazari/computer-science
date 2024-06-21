#import "/common.typ": *

= Amplitude amplification
Amplitude amplification is a technique used to distinguish a good state $ket(psi_G)$ from a bad state $ket(psi_B)$ by flipping the sign of $ket(psi_G)$,
  in order to find a state that has a large overlap with $ket(psi_G)$.

== Grover's black-box search algorithm
A special case of amplitude amplification is Grover's black-box search algorithm.

Let $f : {0, 1}^n -> {0, 1}$ be an unknown function, that takes as input an $n$-qubits binary string and outputs 1 for a unique string $lstr$, 0 otherwise.
$ f(arrow(x)) = cases(
  1 quad "if" arrow(x) = lstr,
  0 quad "otherwise"
) $

The good state $ket(psi_G)$ searched by the algorithm is the one in which $f(arrow(x))$ returns 1.
It does it by repeatedly brute forcing every possible string and amplifying the good state at every step, until the probability of obtaining $lstr$ from a measurement is almost 1.

=== Complexity
The optimal number of iterations $k$ is around $pi / 4 sqrt(2^n) ==> O(2^(n / 2))$.
Compared to a classic algorithm with complexity $O(2^n)$, the quantum version provides a quadratic speedup.
