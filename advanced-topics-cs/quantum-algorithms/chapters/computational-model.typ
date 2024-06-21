#import "/common.typ": *

= Computational model
In order to understand quantum algorithms it is necessary to define the tensor product operation between matrices and to present some primitive constructs.

== Tensor product
Let $A in CC^(m times n), B in CC^(p times q), D in CC^(m p times n q)$

The tensor product $tensor$ is defined as a bilinear operator between vector spaces:
$ tensor : A times B -> D $

In the course the $tensor$ operator always refers to the Kronecker product, a special case of the more generic tensor product.

/ Kronecker product:
$ D := A tensor B = mat(
    a_11 B, ..., a_(1 n) B;
    a_21 B, ..., a_(2 n) B;
    dots.v, , dots.v;
    a_(m 1) B, ..., a_(m n) B
  )
$

Tensor product has many properties to take into account:
+ $(A tensor C) (B tensor D) = A B tensor C D$
+ $(A tensor C) (u tensor w) = A u tensor C w$
+ $(u + v) tensor w = u tensor w + v tensor w$
+ $u tensor (v + w) = u tensor v + u tensor w$
+ $(a u) tensor (b w) = a b (u tensor w)$
+ $(A tensor B)^dagger = A^dagger tensor B^dagger$

== Primitive constructs
/ Bra-kets: ket $ket(psi)$ denotes a column vector in $CC^n$, while bra $bra(psi)$ denotes a row vector in $(CC^n)^dagger$, such that $bra(psi) = ket(psi)^dagger$

Properties:
- $ket(psi)ket(phi) = ket(psi) tensor ket(phi)$
- $inner(psi, phi) = angle.l psi, phi angle.r =>$ inner product

/ Binary strings: $jstr in {0, 1}^q$ denotes a binary string of $q$ digits, such that
  $j = display(sum_(k = 1)^q) jstr_k dot 2^(q - k)$

$ket(jstr) = ket(j_1 j_2 ... j_q) =
  ket(j_1)ket(j_2)...ket(j_q) =
$ basis vector of $(CC^2)^(tensor q)$ with a $1$ in position $j$

== Quantum states
A state in a quantum computer coincides with a single (possibly composite) register of qubits. \
A register of $q$ qubits can be represented with a vector $ket(psi)$ in $(CC^2)^(tensor q)$ (which is $subset.eq CC^(2^q)$).

A state $ket(psi)$ can be represented as $display(sum_(jstr in {0, 1}^q)) alpha_j ket(jstr)$, with $alpha_i in CC$.

Which is equivalent to $display(mat(
  alpha_1;
  alpha_2;
  alpha_3;
  dots.v;
  alpha_(2^q);
))$

/ Basis states / superpositions: a $q$-qubits register $ket(psi)$ represents a basis state if
  $ket(psi) = ket(jstr)$, for some $jstr in {0, 1}^q$.
  Otherwise, it is a superposition.

/ Product states / entanglements: a $q$-qubits quantum state $ket(psi)$ is a product state if
  $ket(psi) = ket(psi_1)ket(psi_2)...ket(psi_q)$, where $q_i$ is a 1-qubit state.
  Otherwise, it is an entangled state.
