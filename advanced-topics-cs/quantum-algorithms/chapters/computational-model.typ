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

== Primitive constructs
/ Bra-kets: Ket $ket(psi)$ denotes a column vector in $CC^n$, while bra $bra(psi)$ denotes a row vector in $(CC^n)^dagger$, such that $bra(psi) = ket(psi)^dagger$

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

A state $ket(psi)$ can be represented as $display(sum_(jstr in {0, 1}^q)) alpha_j ket(jstr)$, $alpha_i in CC$,
which is equivalent to
$display(mat(
  alpha_1;
  alpha_2;
  dots.v;
  alpha_(2^q);
))$

/ Basis states / superpositions: A $q$-qubits register $ket(psi)$ represents a basis state if
  $ket(psi) = ket(jstr)$, for some $jstr in {0, 1}^q$.
  Otherwise, it is a superposition.

/ Product states / entanglements: A $q$-qubits quantum state $ket(psi)$ is a product state if
  $ket(psi) = ket(psi_1)ket(psi_2)...ket(psi_q)$, where $q_i$ is a 1-qubit state.
  Otherwise, it is an entangled state.

== Operations on qubits
/ Operations: An operation, or gate, is a unitary matrix $U in CC^(2^q times 2^q)$

$==>$ Operations on quantum states are always:
- Linear
- Reversible

/ Measurement: Gate allowing to gather information on the state.
  Applying a measurement to a $q$-qubits state $ket(psi) = display(sum_(jstr in {0, 1}^q)) alpha_j ket(jstr)$ returns the binary string $arrow(k) in {0,1}^q$ with probability $|alpha_k|^2$

After applying a measurement gate on a state, the original state is not recoverable.

=== Basic operations
There are some basic gates that are used to create more complex operations:
- $X$ gate: performs a bit flip $=> X#ket(0) = ket(1), quad X#ket(1) = ket(0)$
  $ X = mat(0, 1; 1, 0) $
- $H$ (Hadamard) gate: returns uniform superposition of basis states (when run in parallel on all qubits):
  $ H^(tensor q)#ket($arrow(0)$) = 1 / (sqrt(2^q)) display(sum_(jstr in {0, 1}^q)) ket(jstr) $
- $"CX"$ (Controlled $X$/NOT) gate: two-qubit gate that can create or destroy entanglement.

  $"CX"_12$ flips target qubit (qubit 2), when control qubit (qubit 1) is $ket(1)$, leaves qubit 2 as it is otherwise:
  $"CX"_21#ket(01) = ket(01),
    "CX"_21#ket(11) = ket(10)
  $ \
  $"CX"_21$ is the same, but with target qubit 1 and control qubit 2:
  $"CX"_21#ket(10) = ket(10),
    "CX"_21#ket(11) = ket(01)
  $

  $ "CX"_12 = mat(
    1, 0, 0, 0;
    0, 1, 0, 0;
    0, 0, 0, 1;
    0, 0, 1, 0;
  )
  #h(4em)
  "CX"_21 = mat(
    0, 1, 0, 0;
    1, 0, 0, 0;
    0, 0, 1, 0;
    0, 0, 0, 1;
  ) $
