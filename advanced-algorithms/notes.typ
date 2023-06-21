#set text(
  size: 13pt,
  // Sans serif font
  font: ("Arial"),
)
#set heading(numbering: "1.1 –")
#set list(marker: ([•], [--]))

#let make_title(title: none, author: none, date: none) = {
  v(5em)
  align(center, text(size: 20pt, title))
  align(center, text(size: 14pt, author))
  align(center, text(size: 14pt, date))
  v(5em)
}

// Comment-style lecture number annotation (# Lecture n)
#let lecture(number) = {
  set text(gray)
  [\# Lecture #number]
}


#make_title(
  title: "Advanced Algorithms Notes",
  author: "Alberto Lazari",
  date: "II Semester – 2023",
)

#outline(
  title: "Index",
  indent: true,
)
#pagebreak()

#lecture(2)
= DFS (Depth First Search)
/ Complexity: $O (n + m)$

== Applications
Derived using DFS (or BFS) in $O (n + m)$
- Path between source vertex $s$ to arbitrary $t$: add a `parent` field to vertices. When $t$ is found return the parents backtrace
- Find cycle: use `parent` field on vertices and `ancestor` on edges
- Connected components:
  + run DFS (or BFS) $n$ times
  + Keep a counter $k$ to increment on every "untouched" source vertex
  + Assign $k$ to $v."id"$, instead of 1 $->$ label vertexes based on its component
  + If at the end $k > 1$, then multiple components were found

#lecture(3)
= BFS (Breadth First Search)
/ Complexity: $O (n + m)$

= MST (Minimum[-weight] Spanning Tree)
$"MST" (G = (V, E), s)$

Tree created from a source vertex $s$, the root of the tree

#lecture(4)
== Prim
/ Complexity: $O (m dot n)$

Make cuts to separate a growing set $A$ (initialized to ${s}$), and find _light edges_.
Add the light edge found with the cut to $A$ and repeat, until you have a tree (no more vertices outside $V \\ A$)

The search for the light edge is $O (m)$ and is repeated $n$ times, but it can be optimized

=== Prim with heap
/ Complexity: $O (m log n)$

Use a heap to store vertices, ordered on their cost to reach from a vertex already processed (light edge that crosses the cut)
For every vertex that you put in $A$ (actually that you extract from the heap $H$) check if you can update the cost of the vertices still in $H$

In order to keep trace of the actual edges, instead of the vertices, it's needed to save the parent of every vertex you update

The complexity is actually $O (n log n + m log n)$, but graph $G$ is connected $=> m >= n - 1$

#lecture(5)
== Kruskal
/ Complexity: $O (m dot n)$ (when implemented with adjacency list, because of frequent cycle checks)

Extremely simple:
+ $A$ is an empty forest;
+ Sort $E$ by weight (ascending order);
+ If adding $e in E$ to $A$ keeps it a forest (doesn't introduce cycles) add it

=== Kruskal with disjoint sets
/ Complexity: $O (m log n)$ (same of Prim with heap)

Use union-find data structure: connected components are disjoint sets to join in $O (log n)$ time. Finds if a node is in a set in $O (log n)$ time $=>$ cycle checks in logarithmic time

It's still an open problem to find MST implementation in $O (m)$

#lecture(7)
= SS (Single-Source) Shortest Paths
$"SSSP" (G = (V, E), s in V)$, where $G$ directed, weighted graph

Returns: $"len" (v) = "dist" (s, v), forall v in V$

== Non-negative weights -- Dijkstra
/ Complexity: $O (m dot n)$

Similar to Prim:
+ Growing region (vertices set) $X = {s}$
+ Select minimum-weight vertex $e$ between $X$ and $V \\ X : e = (u, v)$, where $u in X$ and $v in.not X$
+ Add $v$ to $X$ and set $"SP" (v) = "SP" (u) + w (e)$

=== Dijkstra with heap
/ Complexity: $O ((m + n) log n)$

Similar to Prim implementation with heaps

#lecture(8)
== General case -- Bellman-Ford
/ Complexity: $O (m dot n)$

Need to forbid negative cycles in shortest paths, they lead to infinitely small paths $->$ doesn't even make sense to speak about shortest paths

Bellman-Ford returns either $"SSSP" (G, s)$ or a declaration that $G$ has a negative cycle

Refine every shortest path every iteration (check every edge).
In $n - 1$ iterations it reaches a fix-point.
If it doesn't it means a negative cycle exist

In 2022 a *near-linear* algorithm was found

= AP (All Pair) Shortest Paths
Returns: $"dist" (v, u), forall v, u in V$

Running Bellman-Ford $n$ times have complexity $O (m dot n^2)$.
With dynamic programming complexity can be reduced up to $O (n^3 log n)$

== Floyd-Warshal
/ Complexity: $O (n^3)$

Iterate on 3 vertices $u, v, k in V$ in 3 nested loops, testing whether using $k$ in the path is better

To catch negative cycles it's sufficient to check that $"dist" (v, v) >= 0, forall v in V$

#lecture(10)
= Maximum flows
== Definitions
/ Flow network: graph where edges have a capacity $c : E -> RR^+$.
A source $s$ and a sink $t$ are specified

/ Flow: $f : E -> RR^+, |f| = display(sum_((s, v) in E)) f (s, v)$, basically the flow on the first edges \
Flow is conserved through the graph and has to be $<=$ than capacity for all edges

== Ford-Fulkerson
/ Complexity: $O (m dot |f^*|)$, where $|f|$: maximum flow

#lecture(11)
= NP-hardness
Similar polynomial and NP-hard problems:
- Eulerian vs Hamiltonian circuit: cycle traversing every edge ($O (n)$) vs vertex (NP-hard) only once
- MST vs TSP: give paths to (spanning tree, $O (m log n)$) vs a tour between (NP-hard) all vertices, minimizing the sum of the weights of the edges used

- Class P: Polynomial time problems
- Class NP: Non-deterministic Polynomial
- Class NP-hard: if proving a problem polynomial would mean all NP is polynomial it's NP-hard

== Reduction
A $<$ B $->$ B is used to solve A

A $<_p$ B $->$ A reduces to B in polynomial time: a polynomial algorithm exists to convert an input instance for A in one for B that is then used to solve A

if A is NP-hard and A $<_p$ B $==>$ B is NP-hard

== NP-hard Problems
- *SAT*: first NP-hard proved, by Cook-Levin theorem
- *3-SAT*: SAT $<_p$ 3-SAT
- *Maximum Independent Set*: 3-SAT $<_p$ MIS (maximum number of vertices with no edge between them)
- *Hamiltonian circuit*
- *TSP* (Traveling Salesperson Problem): Hamiltonian circuit $<_p$ TSP
- *Metric TSP*: TSP with triangular inequality on paths (direct paths are always shorter than the ones using other vertices)
- *Maximum clique*: largest complete sub-graph
- *Minimum vertex cover*: minimum number of vertices that "touches" all edges
- *Minimum set cover*: vertex cover $<_p$ set cover (minimum number of subsets tu cover an original set)

#lecture(12)
= Approximation algorithms
== Vertex cover
/ Complexity: $O (n + m)$
/ Approximation factor: 2

/ Matching: set of edges with no common vertex

== Metric TSP
/ Complexity: $O (m log n)$
/ Approximation factor: 2 (tight)

Build an MST with Prim/Kruskal and return the full preorder chain (DFS with pre and post visits (with repetitions)) of the tree

=== Eulerian circuit approach
// TODO: find complexity
/ Complexity: polynomial
/ Approximation factor: $2 \/ 3$

Find a minimum weight perfect matching between odd-degree vertices and add those edges to the MST.
Now the graph has all vertices with even degree $=>$ it is Eulerian

Return the Eulerian cycle of the graph

A $3 \/ 2 - epsilon$ approximation has been found, where $epsilon = 10^(-36)$

#lecture(17)
== Set cover
/ Complexity: $O (n dot |F| dot min {n, |F|})$, where $n = |X|$ (cubic)
/ Approximation factor: $ceil(log_2 n) + 1 = Theta (log n)$

Variables:
- $X$: original set, with all possible elements
- $F$: set of subsets of $X$

Greedy algorithm on subset in $F$ with most elements in $X$.
At each step select the subset and remove its elements from $X$ and repeat

= Randomized algorithms
- Las Vegas: always correct (randomized quicksort)
- Monte Carlo: may return wrong values, though high probability of correct result
  - One sided: decision problems give only false positives/negatives
  - Two sided: decision problems may fail in any case

#lecture(19)

/ High probability: algorithm $A_Pi$ for problem $Pi$
$ "has complexity" f (n) \/ "is correct" $
with high probability if
$ exists c, d > 0. "Pr" (A "has complexity" > c f (n)) \/ "Pr" (A "is not correct") < 1 / (n^d) $

= Minimum cut -- Karger
/ Complexity: $O (n^4 log n)$

Minimum number of edges to remove, in order to disconnect the (multi)graph

== Algorithm
Repeat _Full Contraction_ $k$ times, to reduce error

Karger returns the minimum with _high probability_ ($"Pr (fail)" < display(1 / n^d)$) with $k = display((d n^2 ln n) / 2) = Theta (n^2 log n)$

== Definitions
=== Multigraphs
/ Multiplicity: $m : SS -> NN, m (e) = "occurrences of an element" e in "multiset" SS$

$cal(G = (V, E))$ is a multigraph, where $cal(E)$ is a multiset

=== Full Contraction
/ Complexity: $O (n^2)$

Choose a random edge and contract on it, until two vertices remain

/ Contraction: contract a graph $cal(G)$ on edge $(u, v) in cal(E)$ (join vertices of the edge):
- Delete $u$
- Delete all edges between $u$ and $v$
- Move all edges of $u$ to $v$

== Karger-Stein
/ Complexity: $O (n^2 log^3 n)$

Avoids first $display(n / sqrt(2))$ iterations

== 2020 version
/ Complexity: $O (m log n)$

#lecture(21)
= Chernoff bounds
Upper bounds on probability of the value of a variable $X = display(sum_(i = 1)^n) X_i$

$ "Pr" (X > (1 + delta) mu) < ( e^delta / (1 + delta)^(1 + delta) )^mu $
$forall delta > 0, mu = E[X]$

== Variants
- $"Pr" (X < (1 - delta) mu) < e^( (- mu delta^2) / 2 )$, when $0 < delta <= 1$
- $"Pr" (X > (1 + delta) mu) < e^( (- mu delta^2) / 2 )$, when $0 < delta <= 2e - 1$
