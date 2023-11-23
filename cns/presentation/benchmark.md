# Benchmarking
How to measure fuzzers' performances?
- Code coverage strategy (Google's FuzzBench): no clear winner is found
- Unique crashes: how to identify uniqueness (stack trace doesn't work well) -> false positives/negatives

Tools sometimes overfit to a certain benchmark: the aim is not find more vulnerabilities, but perform better for a specific benchmark

## A new benchmark
Goals to reach for a benchmark:
1. Real programs
2. Relevant bugs
3. Identifiable bugs (not duplicate)
4. Avoid overfitting

# FixReverter
Tool to inject real bugs in programs (undo fixes)

- Identify bugfix cases
- Analyze reachability and dependence of found cases
- Inject bugs
- Naive bug checker: cut out every trivial bug (that is reached too easily or too often)
- Triage phase: test all the possible combinations of bugs to identify *individual-causes* and *combination-causes*

## RevBugBench
Benchmark on 10 programs with 8000 re-introduced bugs

# Bugfix
Patterns:
1. `ABORT`: conditional-abort (e.g. early returns)
2. `EXEC`: conditional-execute (add case to `if`)
3. `ASSIGN`: conditional-assign

# Bug injection
- Not reached
- Reached
- Triggered

# Bug triage
For loop

# Benchmark results
Comparison of 5 fuzzers
