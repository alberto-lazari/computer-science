#import "@local/unipd-doc:0.0.1": *

#set text(font: "Arial")
#show: unipd-doc(
  title:    [Digital and Interactive Multimedia],
  subtitle: [Notes],
  author:   [Alberto Lazari],
  date:     [I Semester A.Y. 2023-2024],
)

= Presentation
== Outline
+ 3d vision and acquisition
+ Lab + 3d processing
+ Seminar?
+ Lidar and automotive
+ VR
+ AR
+ SLAM
+ Seminars

== Exam
Two parts:
+ 2 open questions (10 pts each)
+ 10 multiple choice (1 pt each)

Dates:
- Jan 22 12:30
- Feb 07 12:00

/ Multimedia: Multiple types of media combined (audio, video, text, ...)

= Media types
== Image
Images can be formed by combining:
- Illuminance: $i(x, y)$
- Reflectance: $r(x, y)$

== Video
- Fast sequence of single images
- At least 25 fps to see motion, because of retina's persistence phenomenon

== 3D
- Accomodation: changes in focal aperture in the crystalline
- Vergences: movements of the eyes to merge the two images

=== Visual cues
Features of images that allow to create a 3D (static) perception:
- Occlusions
- Relative dimensions: far $->$ small, close $->$ big
- Textures
- Linear perspective: straight lines in perspective
- Aerial perspective: fog in the far distance
- Shadows

=== Motion
Also motion can create 3D perception of a (2D) video:
- Motion parallax
- Relative angular velocity: far objects appear slower
- Radial expansion
- Shadow movement
