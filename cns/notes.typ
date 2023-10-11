#import "@local/unipd-doc:0.0.1": *

#show: notes()
#show: unipd-doc(
  title:    [Advanced Topics in Computer Network and Security],
  subtitle: [Notes],
  author:   [Alberto Lazari],
  date:     [I Semester A.Y. 2023-2024],
)

= Presentation
== Phases
- Part 1: group presentation (3 people) on topic.
  Questions to other groups
- Part 2: final essay similar to the first part topic

== Grading
#grid(
  columns: (auto, auto),
  gutter: 1em,
  [25%],[Presentation],
  [25%],[Discussion in class (2nd part)],
  [25%],[Project/essay],
  [25%],[Project oral discussion],
)

#lecture[11/10 (Alessandro Brighente)]
= Containers and kubernet security
== Containers
/ Container: unit of software that packages up code, dependencies, binaries required to run an app, for it to be ready to be shipped with no manual configuration required

VMs are much larger and slower in comparison (they have to virtualize the entire OS for each VM)

=== User permission exploit
Binaries in Linux inherit owner's permissions for system calls. \
  e.g. you can't ask the system to open a socket connection through the `ping` command if you own the binary as a non-elevated user

`getcaps PID` returns all the capabilities (allowed system calls) a process can do

=== Control groups
They can be used to limit the amount of memory of a group of processes?

=== Namespaces
Can be unshared from processes. \
  It can be used to hide the hostname from a container

=== Dockerd access
The docker daemon is controlled via its socket.
Having access to it means to be able to control the entire containers through API requests

== Kubernetes
Container orchestrator from Google: cluster of physical machines that run a single container (distributed container)

Very poor security defaults
