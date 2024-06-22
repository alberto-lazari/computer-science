#import "/common.typ": *

= Shor's factorization algorithm
An interesting quantum algorithm, that brings great performance improvements and has real-world implications is Shor's integer factorization algorithm.

== Classical integer factorization
Factorizing an integer $n$ is generally intractable on classical computational models, since the fastest known algorithm has a sub-exponential complexity of $O(e^((log n)^(1/3) (log log n)^(2/3)))$.

Many cryptography-related algorithms and protocols exploit this fact to ensure (algorithmically)-unbreakable encryption.

== Quantum factorization
Shor's algorithm provides an exponential speedup over classical approaches: it uses a number of quantum gates of order $O((log n)^2 (log log n) (log log log n))$.

The high-level steps of Shor's algorithm are:
+ The problem of finding $n$'s integer factors is reduced to finding the period of a function
  $f(x) = a^x "mod" n$.
  The objective is finding the smallest positive integer $r$, such that $a^r equiv 1 "mod" n$, $r$ being the period of $f$
+ Quantum phase estimation process: applies modular exponentiation and the inverse QFT to a uniform superposition of all possible states (initialized with a H gate)
+ Post processing process: uses the period $r$ to find the factorization of $n$

== Implications
