#import "@local/unipd-doc:0.0.1": *

#show: notes()
#show: unipd-doc(
  title:    [Mobile Security],
  subtitle: [Notes],
  author:   [Alberto Lazari],
  date:     [I Semester A.Y. 2023-2024],
)

#lecture(1)
= Android OS
- Single user OS
- Custom Linux kernel at its core #sym.arrow multi-user support:
  - Each app is a different Unix user
  - Every app has a GID corresponding to the permission it has
  - App ID = UID GID1 GID2 GID3...

#lecture(2)
= Binder driver
Android driver extension over Linux

Allows:
- Remote Procedure Call (RPC)
- Inter-Process Communication (IPC)

It's necessary to allow apps to make system calls, running in kernel space. \
Example: an app wants to get the current location from the location manager service (which acts as a privileged process)

= Permissions
Protection levels:
+ Normal: declared and automatically granted at installation (e.g. internet)
+ Dangerous: require manual user interaction (location, storage)
+ Signature: used for apps communication. Requires signature of the app to communicate with
+ SignatureOrSystem: granted to system apps

== Dangerous permissions
- Before device's API level 23 or app's targetSdkVersion 23 they were granted at install-time
- They couldn't disable them

Permissions come in groups. Granting a specific actions grants the entire group
