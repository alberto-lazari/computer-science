#set text(
  size: 14pt,
  // Sans serif font
  font: ("Helvetica", "Arial")
)
#set heading(numbering: "1.1 –")
#set list(marker: ([•], [--]))
// Comment-style lecture number annotation (# Lecture n)
#let lecture(number) = {
  set text(fill: gray)
  [\# Lecture #number]
}

#outline(
  title: "Index",
  indent: true
)
#pagebreak()

#lecture(2)
= DFS (Depth First Search)
*Complexity*: $O (n + m)$

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
*Complexity*: $O (n + m)$

= MST (Minimum[-weight] Spanning Tree)
$"MST" (G (V, E), s)$

Tree created from a source vertex $s$, the root of the tree

#lecture(4)
== Prim
*Complexity*: $O (m dot n)$

Make cuts to separate a growing set $A$ (initialized to ${s}$), and find _light edges_.
Add the light edge found with the cut to $A$ and repeat, until you have a tree (no more vertices outside $V \\ A$)

The search for the light edge is $O (m)$ and is repeated $n$ times, but it can be optimized

=== Prim with heap
*Complexity*: $O (m log n)$

Use a heap to store vertices, ordered on their cost to reach from a vertex already processed (light edge that crosses the cut)
For every vertex that you put in $A$ (actually that you extract from the heap $H$) check if you can update the cost of the vertices still in $H$

In order to keep trace of the actual edges, instead of the vertices, it's needed to save the parent of every vertex you update

The complexity is actually $O (n log n + m log n)$, but graph $G$ is connected $=> m >= n - 1$

#lecture(5)
== Kruskal
*Complexity*: $O (m dot n)$ (when implemented with adjacency list, because of frequent cycle checks)

Extremely simple:
+ $A$ is an empty forest;
+ Sort $E$ by weight (ascending order);
+ If adding $e in E$ to $A$ keeps it a forest (doesn't introduce cycles) add it

=== Kruskal with disjoint sets
*Complexity*: $O (m log n)$ (same of Prim with heap)

Use union-find data structure: connected components are disjoint sets to join in $O (log n)$ time. Finds if a node is in a set in $O (log n)$ time $=>$ cycle checks in logarithmic time

It's still an open problem to find MST implementation in $O (m)$

#lecture(7)
= SS (Single-Source) Shortest Paths
$"SSSP" (G (V, E), s in V)$, where $G$ directed, weighted graph

Returns: $"len" (v) = "dist" (s, v), forall v in V$

== Non-negative weights -- Dijkstra
*Complexity*: $O (m dot n)$

Complexity can be lowered to $O ((m + n) log n)$ with heaps, similar to Prim

#lecture(8)
== General case -- Bellman-Ford
*Complexity*: $O (m dot n)$

Need to forbid negative cycles in shortest paths, they lead to infinitely small paths $->$ doesn't even make sense to speak about shortest paths

Bellman-Ford returns either $"SSSP" (G, s)$ or a declaration that $G$ has a negative cycle

Refine every shortest path every iteration (check every edge).
In $n - 1$ iterations it reaches a fix-point.
If it doesn't it means a negative cycle exist

In 2022 a *near-linear* algorithm was found

= AP (All Pair) Shortest Paths
Returns: $"dist" (v, u), forall v, u in V$

Running Bellman-Ford $n$ times have complexity $O (m dot n^2)$.
With dynamic programming complexity can be reduced up to $O (n^3 dot log n)$

== Floyd-Warshal
*Complexity*: $O (n^3)$

Iterate on 3 vertices $u, v, k in V$ in 3 nested loops, testing whether using $k$ in the path is better

To catch negative cycles it's sufficient to check that $"dist" (v, v) >= 0, forall v in V$

#lecture(10)
= Maximum flows
== Definitions
*Flow network*: graph where edges have a capacity $c : E -> RR^+$.
A source $s$ and a sink $t$ are specified

*Flow*: $f : E -> RR^+, |f| = display(sum_((s, v) in E)) f (s, v)$, basically the flow on the first edges \
Flow is conserved through the graph and has to be $<=$ than capacity for all edges

== Ford-Fulkerson
*Complexity*: $O (m dot |f^*|)$, where $|f^*|$: maximum flow

#lecture(11)
= NP-hardness
Similar polynomial and NP-hard problems:
- Eulerian vs Hamiltonian circuit: cycle traversing every edge ($O (n)$) vs vertex (NP-hard) only once
- MST vs TSP: give paths to (spanning tree, $O (m dot log n)$) vs a tour between (NP-hard) all vertices, minimizing the sum of the weights of the edges used

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
- *Complexity*: $O (n + m)$
- *Approximation factor*: 2

*Matching*: set of edges with no common vertex

== Metric TSP
- *Complexity*: $O (m dot log n)$
- *Approximation factor*: 2 (tight)

Build an MST with Prim/Kruskal and return the full preorder chain (DFS with pre and post visits (with repetitions)) of the tree

=== Eulerian circuit approach
// TODO: find complexity
- *Complexity*: polynomial
- *Approximation factor*: $2 \/ 3$

Find a minimum weight perfect matching between odd-degree vertices and add those edges to the MST.
Now the graph has all vertices with even degree $=>$ it is Eulerian

Return the Eulerian cycle of the graph

A $3 \/ 2 - epsilon$ approximation has been found, where $epsilon = 10^(-36)$

#lecture(17)
== Set cover
- *Complexity*: $O (??)$
- *Approximation factor*: ??

=== Greedy approach
