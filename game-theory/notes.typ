#import "@local/unipd-doc:0.0.1": *

#show: notes()
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
#let pref = $succ.eq$
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

#lecture[2 -- 12/10]
= Static games
Players move at the same time (turn-based)

/ Normal form game: $GG = { S_1, S_2, ..., S_n; v_1, v_2, ..., v_n }$ \
  It can be represented as a table

== Best response
Best possible action for a player: the one that maximizes the outcome, based on other players actions

/ Belief: other players' possible strategies

== Nash equilibrium
Joint strategy that, if played, leaves no player with regrets

Similar to Pareto efficiency, but from a different perspective:
- Pareto efficiency: global best payoff (of all the players at the same time)
- Nash equilibrium: local best payoff (of every player, egoistic)

Nash equilibrium can be broken by external factors (R in grade problem)

#lecture[5 -- 18/10]
= Electoral systems
Particular systems can advantage certain types of candidates

Systems:
- Plurality voting: relative majority
- Two-phase run-off
- Borda counting: points based on the preference (last 0 pts, second-last 1 pt, ...)
- Approval voting: most approval wins
- Instant run-off:
  - Least preferred is eliminated
  - Repeat until one candidate
  - May lead to paradoxes (increasing preference to candidate may lead to him losing)

#lecture[6 -- 19/10]
#let maj = pref
#let iff = $<==>$
/ Majority rule: $a maj b iff$ more people prefer a to b

= Cournot duopoly
Duopolys lead to better outcome for the environment

= Tragedy of commons
Common resources get misused when private interest prevails

#lecture[08/11]
= Exercises
- Find NEs: find all best strategies. If they match in some cases there is a pure NE
- Find mixed NEs: calculate probabilities for all players. If probabilities are $0 <= p <= 1$ then there is a mixed NE
- Pareto dominant strategies

= Linear transformations
== NE invariance
NEs are invariant to (positive) linear transformations on utility functions: \
if utility $u_i (s)$ is changed with $u'_i (s) = alpha u_i (s) + x$, with $alpha > 0$ the NAs are the same

#lecture[11 -- 09/11]
= Dynamic games
There is an order in the moves: one players moves first, the other later and is aware of the previous moves

== Perfect information
No Nature moves (simultaneous) involved

= Zero-sum games
== Minmax theorem
Game $GG$ has NE in pure strategies $<==> "maximin"_i = "minimax"_i (= u_i("NE")) forall "players" i$

Same for $"minimax"^p$ theorem in mixed strategies
