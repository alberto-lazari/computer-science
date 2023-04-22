# Introduction
## Real-time system
- Aggregate of computers, i/o and software interacting with a **physical environment**
- Can't be represented by a sequential program -> inherently concurrent and parallel
- Everything seen through a real world time perspective: timely, being on time

## Embedded system
Very close to i/o, reality. It needs to have very few layers
Opposite of general purpose, that is abstracting

## Prerequisites of automation of control
Sensing: use a sensor as a source from which a system reads input
Computation: make calculation based on input read from sensors, learn about the environment
Actuation: do actions, based on the computation results. Output

Automation of control -> cybernetics (science of control systems)

### Sampling
- Sample (sensing) and actuation happens at the same time, in parallel
- The actuation is based on the previous cycle sample
- Sampling happens periodically, on a determined time period

Can be:
- oversampling, if you are doing it more frequently than you should
- undersampling -> performance is lower, because you miss information

The sampling period is harmonic if periods are multiple of one another. They can be made artificially harmonic with over/undersampling

# Lecture 2 (03/01)
Flow is controlled by time in a rts -> bounded

We want to remove complexity of OS (with embedded system structure), because it adds unpredictable behavior -> determinism is needed

**Predictable**
: pre-dictable, know before it happens

## Predictable vs determinism
- Predicibility is weaker than determinism, it's easier to relate to. Determinism is not always manageable, too many details (registers, bus, CPU, memory, ...)
- Predictability allows to think worst-case wise
- Testing is not enough, probability can't save us. Errors may still happen

## Concurrent vs parallel
- Concurrent: multiple individual tasks, assigned to actors that collaborate for a unified goal
- Parallel: multiple tasks, independent from one another. Non-collaborative

## Tasks
- Recurrent unit of work, concurrent with other tasks
- Never ends, is repeated over time
- Controls period of time in which jobs have to be executed
- Not actual software, just a logical aggregate of jobs

### Job
Actual work to do, in a certain time, defined by task

Task $\tau$ knows the time its first job has to start, which can be delayed from the actual start (boot) by a phase $\varphi$

<!-- TODO: complete up to jitter etc p 25 -->
### Release time

# Lecture 3 (03/06)
## Time-driven scheduling
- Schedule is fixed during design period
- A clock intervals time periods
- Scheduler make execution decisions during intervals, listening to clock cycles
- Clock sends interval information through **interrupts**, an information external to the CPU.

### Interrupts
Interrupts are called like that because they interrupt the normal flow of execution. The CPU checks for interrupts before the fetch phase of the pipeline

When an interrupt is detected the current context is saved (PC for instance) and the interrupt is managed. The interrupt has information on how to manage it and what to do (which instructions, ...)

Interrupts cause **preemption**, a premature release of the execution. Preemption costs time, so its better to avoid it with a dedicated schedule -> assume the systems don't have preemption: it's needed to design schedules that complete jobs in time

An interrupt does not actually require preemption. It uses a minimal CPU space to manage it and resumes the current job execution

## Priority-driven scheduling
- Preemption is needed, to release the current job in favor of a higher priority one
- Problem: how to guarantee predicibility?
- We need to manage a queue of jobs
- When a job is done the scheduler picks an interrupted job from the queue to complete its execution

### Preemption
When a new job arrives it is pushed into the queue with an interruption. If the job is located on the head of the queue preemption happens -> the current job is suspended and the new, high priority job is done

<!-- TODO: watch definition of deadlines p 28 -->
## Earliest Deadline First (EDF)
Priority is based on absolute deadlines. The closer the deadline, the higher the priority of the job.

> EDF scheduling is **optimal** for single-CPU systems (with independent jobs and preemption)

*Liu & Layland: 1973*

## Least Laxity First (LLF)
**Laxity**
: $L_i(t) = time$ left before the deadline, after the end of the execution of job i (if the job was started right now, at time t). \
The algorithm chooses the one that has the less margin to complete in time

Problem: priority keeps changing during time, so it's highly expensive because of continuous preemption -> in reality it's not used at all

<!-- TODO: look better -->
## Clock-based schedule
- No preemption
- Result: a table representing scheduling actions to do

### Frame (minor cycle)
Period of time between clock signals in which more than one job can fit (without doing preemption)

Contraints on frame duration $f$:

1. $\forall J \in Jobs.\ f > max(|J|)$
2. ...
<!-- TODO: complete -->

# Lecture 4 (09/03)
Priority schedulings

## Fixed Priority Scheduling (FPS)
System with preemption: two methods to choose priority

### Rate Monotonic (RMS)
- Faster rate jobs (lower period) has precedence
- At least ln(2) < 70% of utilization -> not always RMS can satisfy all jobs
- 100% if periods are harmonic
- Has better performances than EDF on utilization > 100%

### Deadline Monotonic
Higher urgency (shorter relative deadline) has precedence

### Job duration
$\omega_{i, j} = e_i + Interference$, where

<!-- TODO: complete -->
$$
    Interference = \sum_{k = 1 .. i - 1} \omega_{i, j} + \varphi_i - \varphi_k ...
$$

Fix-point equation, because $\omega$ appears in both members

## Time Demand Analysis (TDA)
Study when $\omega(t) \leq t$ \
$\implies$ when supply satisfies demand

<!-- TODO: resume lecture 6 -->

# Lecture 5 (13/03)
Priority of a task is relative to its deadline (or period) and criticality.

Solutions to unwanted preemption in critical situations:
- Deferred preemption: temporarily ignore preemption to complete a more important job. Delay must be small
- Cooperative dispatching: job gives the CPU to another (specific) job

## Events
Can be:
- Periodic
- Aperiodic
- Sporadic: not below a minimal frequency

# Lecture 7 (20/03)
Up to now tasks are independent. In reality they are concurrent (they collaborate)

## Information passing
Can be
- Asynchronous: memory sharing. Tasks write information on memory locations; everyone can read
- Synchronous: communication with messages. Uses a communication channel in which to send and receive information, instead of writing on memory

Communication though has to live with preemption. What happens if a task gets interrupted while working on something important? And if a message never arrives in a synchronous communication?

Asynchronous communication is way more acceptable: no unlimited waiting of a message. If the precedent task did not write a result in time, the next reads an old value, it won't wait forever

<!-- Various disses to Sperduti -->

## Self-suspension
Happens when a job knows it will wait for something (probably external world related)

# Lecture 8 (24/03)
Preemption is guided by microcode in the CPU. It can be ignored mechanically (by making the microcode temporarily read-only) or via software (ignore the microcode on fetch phase)

**Scheduling anomaly**
: case in which it is not true that the global worst case is the composition of all the local worst cases -> local better case is global worse case!

## Concurrency problems
**Critical section**
: code section operating on shared resources

Critical sections should be explicitly defined and highlighted

### Atomicity
The only way to avoid data races is to have support for atomicity. It doesn't allow preemption when doing an atomic operation

A task gets **directly blocked** by another one when it has higher priority, but is blocked on a resource because of atomicity -> priority inversion when the lower priority is not able to execute, but it's blocking higher priorities for a long time

Inhibiting preemption globally for atomic operations and critical sections blocks *all tasks* for preemption, even the ones that don't require shared resources to the running task, but only for the critical section duration (time period is bounded).
This can be solved using preemption, but making the higher priority task self-suspends (giving control to the one that controls the resource) if it wants to access the resource blocked by atomicity

Blocking inhibits execution, not preemption (higher priority can preempt, but gets blocked)

When a resource is released the tasks blocked by that resource get pushed back into the queue (they were released and put away) -> they can do preemption

Blocking is not enough (circular waiting) \
$\implies$ give priorities to resources

## Basic Priority Ceiling Protocol (BPCP)
$\forall R \in Resources. ceiling(R) = max(priority(\tau_i), ceiling(R_i)), \forall \tau_i \in \{\tau | \tau$ uses $R\}, \forall R_i \in \{R_i | R_i$ depends on $R\}$

<!-- TODO: complete -->
System ceiling $\pi_s(t) = \begin{cases}
    \Omega & \text{if no resource is used}
\end{cases}$

Combining priority and system ceiling, if a task is able to preempt it can acquire resources without any harm

## Ceiling Priority Protocol (CPP)
Task acquires the resource ceiling priority when using it.
Lockfiles are not even necessary, becuase it can't happen that a taks that uses a resource gets preempted by another one that uses it (not even the highest proirity, because it has the same priority)

# Lecture 11 (03/04)
In an embedded environment a program has access to the entire system

## Threads
A program may create threads, other `main`'s inside the program's `main`.
They can be seen as never-ending loops, representing task jobs

Tasks are main loops that spawn threads

## Ada
Tasks have bodies. In `begin` `end` blocks loops are defined. They are jobs

Jobs have to be synchronized $\implies$ they get delayed at the beginning, because the language will have a startup sequencial delay time

The compiler allows for `pragma` restrictions

# Lecture 12 (14/04)
Language runtime has to manage singular tasks Program Counters

Sporadic tasks are placed in a guard queue. They require an entry an, if the guard is false, they are removed from execution and pushed inside the guard queue

# Lecture 14 (21/04)
Priorities available in the implementation may not be enough to cover the ones assigned by the design

## Mapping
There are two ways to map different priorities in one (hash mapping basically)

### Uniform mapping
Ranges of priorities gets assigned to the same

ex: [1..3] -> all priority 1 \
$\implies$ higher priorities will have the same priority as lower (3 = 1)

### Constant ratio mapping (CRM)
Higher priorities have smaller mappings

ex: [5] -> 3, [4..3] -> 2, [2..0] -> 1

When inverting priorities (the lower the higher) map sizes keep increasing with priority

## Time management
Clock ticks are the smallest human time period (ms)

Interrupts are checked every block of ticks (tick scheduling)
