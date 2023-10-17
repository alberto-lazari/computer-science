#import "@local/unipd-doc:0.0.1": *

#show: notes()
#show: unipd-doc(
  title:    [Mobile Security],
  subtitle: [Notes],
  author:   [Alberto Lazari],
  date:     [I Semester A.Y. 2023-2024],
)

#lecture(2)
= Android OS
- Single user OS
- Custom Linux kernel at its core #sym.arrow multi-user support:
  - Each app is a different Unix user
  - Every app has a GID corresponding to the permission it has
  - App ID = UID GID1 GID2 GID3...

#lecture(3)
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

#lecture(4)
= Signatures
- Used to sign certificates, to prove identity
- Hash of the data to sign, encoded with the user's private key

== Certificates
/ Certificate Authority (CA): entity responsible to release certificates (within a hierarchy)

- Certificates contain:
  - User and CA metadata
  - User's public key (to decode signature)

Signing data: attaching a certificate and signature to a file.
Guarantees:
  - Sender identity: he's the only one who could encrypt with his private key
  - Integrity of data: hash produced from received data has to be the same one obtained from the signature

There are two types:
- Public (trusted): generated from a CA
- Private (untrusted): self-signed

== Android
- Android keys are private certificates (untrusted and self-signed).
  They are not released by a CA (unlike websites)
- Purpose of keys is to distinguish developers, not confirming identity
- Keys are also used to check application integrity (app not compromised: the files are the original ones, or at least signed by the official developer)
