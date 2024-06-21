#import "/common.typ": *

= Quantum Fourier transform
The quantum Fourier transform algorithm (QFT) aims to compute the DFT of a vector $x in CC^(2^n)$.

The classic DFT is defined as
$ y_j = display(sum_(k = 0)^(2^n - 1)) x_k dot e^((2 pi i j k) / 2^n) quad
  forall j = 0, 1, ..., 2^n - 1
$

The matrix $Q_n$ that implements the $n$-qubit QFT is
$ (Q_n)_(j k) = 1 / sqrt(2^n) omega_n^(j k) quad
  forall jstr, arrow(k) in {0, 1}^n quad
  omega_n = e^((2 pi i) / 2^n)
$

=== Complexity
It is not easy to declare a precise complexity for the algorithm that implements $Q_n$, but it uses a polynomial amount of resources.
By using the _elementary gate complexity_ measure the complexity can be declared as polynomial, which-in any case at all-is a huge improvement over the classical DFT algorithm (fast Fourier transform), that has a complexity of $O(n dot e^n)$.

This leads to an exponential speedup of the QFT over the classic algorithm.
