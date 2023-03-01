# Introduction
## Real-time system
- aggregate of computers, i/o and software interacting with a *physical environment*
- can't be represented by a sequential program -> inherently concurrent and parallel
- everything seen through a real world time perspective: timely, being on time

## Embedded system
Very close to i/o, reality. It needs to have very few layers
Opposite of general purpose, that is abstracting

## Prerequisites of automation of control
Sensing: use a sensor as a source from which a system reads input
Computation: make calculation based on input read from sensors, learn about the environment
Actuation: do actions, based on the computation results. Output

Automation of control -> cybernetics (science of control systems)

### Samplig
- Sample (sensing) and actuation happens at the same time, in parallel
- The actuation is based on the previous cycle sample
- Sampling happens periodically, on a determined time peroid

Can be:
- oversampling, if you are doing it more frequently than you should
- undersampling -> performance is lower, because you miss information

The sampling period is harmonic if periods are multiple of one another. They can be made artificially harmonic with over/undersampling

# Lecture 2 (03/01)
Flow is controlled by time in a rts -> bounded

We want to remove complexity of OS (with embedded system structure), because it adds unpredictable behavior -> determinism is needed

*Predictable* -> pre-dictable, know before it happens

## Predictable vs determinism
- Predicibility is weaker than determinism, it's easier to relate to. Determinism is not always manageable, too many details (registers, bus, cpu, memory, ...)
- Predictability allows to think worst-case wise
- Testing is not enogh, probability can't save us. Errors may still happen

## Concurrent vs parallel
- Concurrent: multiple individual tasks, assigned to actors that collaborate for a unified goal
- Parallel: multiple tasks, independent from one another. Non-collaborative

## Tasks
- Recurrent unit of work, concurrent with other tasks
- Tipically never ends, is repeated over time
- Controls period of time in which jobs have to be executed

### Job
Actual work to do, in a cetain time, defined by task

Task τ knows the time its first job has to start, wihch can be delayed from the actual start (boot) by a phase φ

<!-- TODO: complete up to jitter etc -->
### Release time
