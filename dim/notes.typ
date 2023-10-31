#import "@local/unipd-doc:0.0.1": *

#show: notes()
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

#lecture[3 -- 10/10]
= Passive 3D rendering
- Lens arrays (3D cards)
- Parallax occlusion: bands with holes, similar to lens (3DS?)
- Anaglyph: red/blue glasses (colors are off, though)
- Dolby 3D: slightly different colors per eye (requires wheel on projector and double the frame-rate)
- Polarized light: need to stay still and not rotate head
- Circular polarization: it needs:
  - Two projectors with polarizers
  - Special silver reflective screen
  - Glasses

== Active 3D
Example: Nvidia glasses, alternate shutters

#lecture[4 Lab -- 12/10]
= Stereo images
- Disparity map shows intensity of parallax effect between two images (two eyes)
- Stereo images have to be rectificated #sym.arrow point the object in focus

#lecture[5 -- 31/10]
= Camera parameters
- Intrinsic: depend on the camera itself
- Extrinsic: camera location/orientation

== Direct Linear Transform (DLT)
Infer the 11 intrinsic and extrinsic parameters from image
