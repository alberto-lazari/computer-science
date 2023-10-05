#import "@local/unipd-doc:0.0.1": *

#set text(font: "Arial")
#show: unipd-doc(
  title:    [Game Theory],
  subtitle: [Notes],
  author:   [Alberto Lazari],
  date:     [I Semester A.Y. 2023-2024],
)

#lecture[1 -- 04/10]
= Exam
- Written test (0-27 pts)
- Extra points:
  + No project (3 free points)
  + Group project (up to 7 pts)
- Score $>=$ 31 $=>$ 30L

= Decision problems
Can be represented with *decision trees*

== 1-player problems
#let pref = $eq.succ$
/ Preference: $a pref b -->$ $a$ is preferred over $b$

Properties:
- Complete: either $a pref b$ or $b pref a$
- Transitive: $a pref b$ and $b pref c => a pref c$
- Congruence on utility functions: $u(a) >= u(b) => a pref b$

/ Rational player: player that maximizes its utility function

== Decision trees
- Nodes are choices
- Leaves are payoffs of the choice (value/preference)

Payoffs are the sum of the results of utility function.
They basically represent the preference of a specific choice (the input)

/ Collapse: the collapsed tree is the tree of depth 1, with each edge that is a path in the original tree

= Lotteries
== Outcomes probability
Outcomes of the utility functions may not always be certain.
When randomness comes in a rational player has to choose based on the probability of preferable outcomes

/ Lottery: probability distribution $p$ over set of outcomes $X = {x_1, ..., x_n}$

Randomness can actually be modelled as an external player _Nature_ that takes choices

== VNM model
Theorem: if $pref$ on lotteries satifies:
- Rationality
- Continuity axiom
- Independence

= Decisions over time
- Players and nature alternate turns in choice
- The player will base choices over nature's ones
