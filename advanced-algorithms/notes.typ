#set text(
  size: 14pt,
  // Sans serif font
  font: ("Helvetica", "Arial")
)
#set heading(numbering: "1.1 -")

= DFS (Depth First Search)
*Complexity*: $O (n + m)$

= BFS (Breadth First Search)
*Complexity*: $O (m_s)$

= MST (Minimum[-weight] Spanning Tree)
MST $(G (V, E), s)$

Tree created from a source vertex $s$, the root of the tree

== Prim
*Complexity*: $O (m dot n)$

Make cuts to separate a growing set $A$ (initialized to ${s}$), and find _light edges_.
Add the light edge found with the cut to $A$ and repeat, until you have a tree (no more vertexes outside $V \\ A$).

The search for the light edge is $O (m)$ and is repeated $n$ times, but it can be optimized.

=== Prim with heap
*Complexity*: $O (m log n)$

Use a heap to store vertexes, ordered on their cost to reach from a vertex already processed (light edge that crosses the cut).
For every vertex that you put in $A$ (actually that you extract from the heap $H$) check if you can update the cost of the vertexes still in $H$.

In order to keep trace of the actual edges, instead of the vertexes, it's needed to save the parent of every vertex you update.

The complexity is actually $O (n log n + m log n)$, but graph $G$ is connected $=> m >= n - 1$

== Kruskal
Extremely simple:
+ $A$ is an empty forest;
+ Sort $E$ by weight (ascending order);
+ If adding $e in E$ to  $A$ keeps it a forest (doesn't introduce cycles) add it.

Implemented with adjacency list has complexity $O (m dot n)$, because of frequent cycle checks.

=== Kruskal with disjoint sets
Use union-find data structure: connected components are disjoint sets to join in $O (log n)$ time. Finds if a node is in a set in $O (log n)$ time $=>$ cycle checks in logarithmic time.

This allows to reach Prim's $O (m log n)$
