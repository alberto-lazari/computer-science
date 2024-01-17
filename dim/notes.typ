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

= 3D Perception
3 different ways to perceive:
- Oculomotor (binocular vision)
- Static visual
- Motion

== Oculomotor cues
- Accomodation: changes in focal aperture in the crystalline
- Vergences: movements of the eyes to merge the two images

== Visual cues
Features of images that allow to create a 3D (static) perception:
- Occlusions
- Relative dimensions: far $->$ small, close $->$ big
- Textures
- Linear perspective: straight lines in perspective
- Aerial perspective: fog in the far distance
- Shadows

== Motion
Also motion can create 3D perception of a (2D) video:
- Motion parallax
- Relative angular velocity: far objects appear slower
- Radial expansion
- Shadow movement

= Binocular vision
Requires:
+ Simultaneous perception: two images in both eyes
+ Fusion:
  - Motor: accomodation + vergence
  - Sensory: create single image
+ Stereopsis: interpret two images add 3D perception to the fused image

/ Horopter: area where points don't produce duplicate images (Panum area)

#lecture[3 -- 10/10]
= 3D media
Technologies are divided in:
- Passive
- Active

w.r.t. the viewer

== Passive 3D rendering
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

= Stereo images
- Disparity map shows intensity of parallax effect between two images (two eyes)
- Stereo images have to be rectificated #sym.arrow point the object in focus

#lecture[4 -- 31/10]
= Camera parameters
- Intrinsic: depend on the camera itself
- Extrinsic: camera location/orientation

= Features
Feature recognition can be useful for:
- Camera calibration
- Stereo image creation
- Tracking
- Image mosaicing

They have to be invariant to:
- Illumination
- Scale
- Rotation
- Affine (similarity, slight changes)
- Perspective projection

== SIFT algorithm
Used for feature recognition (ex, for image matching)

#lecture(5)
== Direct Linear Transform (DLT)
Infer the 11 parameters (5 intrinsic + 3 rotations + 3 translations) from image.
At least 6 points are needed

#lecture(9)
= 3D reconstruction
== Rectification
Make the image rows match with epipolar lines

== Point clouds
Set of points in the space.
Provides information for each point about:
- Geometry: position
- Color, reflectance, ... (optional)

= Camera arrays
Possible applications:
- HDR
- Higher resolution
- Tiled panoramas
- Synthetic aperture photography: show subjects partially hidden behind occluders
- Hybrid aperture photography: mix various apertures in the same image (ex light fields)

== Light fields
Use microlens arrays to merge various point of views, apertures and focus in a same image, allowing for post-processing access of those informations

#lecture(10)
= VR
/ VR experience: the user feels *immersed* in a *responsive* virtual world #sym.arrow dynamic control of view point

== Immersion
VR is immersive because of:
+ Stereovision, provided by *headset*
+ Dynamic control of viewpoint
+ Surrounding experience

Can also provide:
- Various Degrees Of Freedom (DOF)
- Interaction with controllers
- Aptic feedback

== Navigation
- Controller/keyboard/joystick: more nausea-prone
- Teleporting (movement has to be not too quick)
- Threadmills

#lecture(11)
= 360 images
Acquisition with:
- Multiple cameras
- Catadioptric: reflection on curved mirrors
- Fish-eye lens

Sphere construction needs:
- Multiple cameras (can't acquire the whole sphere)
- Stitching

== Sphere representations
How to represent a sphere on a flat topology?
- Equirectangular projection: geographical maps' method

  Great distortions and low algorithms performance
- Cube map: good performances + natural images, but artifacts
- Pyramid projection: lots of discontinuities, but clear center (pyramid basis).
  Useful for streaming

#lecture(13)
= Quality of Experience
How to objectively measure it?

== Saliency maps
Interesting regions, that catch user's attention and focus

Can be generated with:
- Bottom-up approaches: ex Gabor filters, based on feature detection
- Top-down ones

== 360 content
Rendering can be done either:
- Client-side: requires full video streaming (90% of the FOV is disregarded) and processing
- Server-side: render and stream only necessary parts #sym.arrow reduce bandwidth.
  Can be done with:
  - Two-tier streaming: parallel stream of base, low-res video + HD viewport area.
    Bad performance, because two streams compete for resources
  - Viewport-adaptive streaming: more versions for different possible viewports.
    Requires server-side storage
  - Tile-based streaming: sphere divided in tiles, to be streamed
    - at different resolutions (full delivery)
    - possibly not streamed at all (partial delivery, bad QoE)

Predict head movements with saliencies

#lecture[14 -- Seminar]
= Immersive media compression
Point clouds are difficult to compress: sparse, irregular...
#sym.arrow quantize (voxelize)

Then just use #underline[_*AI*_] to reconstruct:
- Uses 3D convolutional neural network
- Works perfectly for dense point clouds, not so much on sparse ones
- Works on static point clouds (models, not animations/videos)

Alternatively use graph-based solutions:
- No voxelization
- Results are too smooth
- Point properties difficult to compress (color)

#lecture(17)
