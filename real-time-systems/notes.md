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
