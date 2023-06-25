# Topics
1. PNG format for encoding of digital images
2. Play store and Apple store: differences and properties

Selected topic: 1. PNG format

# Colors encoding
## Color models
- RGB: additive
- CYMK: subtractive
- HSV (Hue Saturation Value/Intensity/Luminosity): Color + Intensity of color (less is white) + Darkness (less is black)
- YUV/YIQ/YCbCr: Luminosity (rodes perception) + Color information (cones perception)
- CIE: depends on properties of cones in the eye. Represents whole human vision

Color space: relation between real colors and representation in color model (red in sRGB slightly different than in Adobe RGB)

## Color Depth
Number of bits used to encode every color:
- Grayscale:
    * 1 bit = black/white (monochromatic)
    * 8 bits = grayscales
- Indexed colors (256 - 8 bits)
    * 8 bits can't actually store 256 colors
    * They just store indices of a CLUT (Color Look-Up Table) that stores the actual indexed colors
    * OS have their own tables, they agreed to have the same first ~160 colors
- True colors:
    * 24 bits (R + B + G) (+ 8 bits of Alpha) = 16.7 M colors
    * 48 bits for high definition colors (2 bytes per channel)
    * \> 48 bits: scientific applications (ultraviolet, infrared)

# GIF
First standard to be used for image transmission over network
- Uses indexed colors
- Provides animations and transparency
- LZW as compression algorithm (patent from Unisys, expired in 2004)
- Supports 1-dimensional 4-pass interlacing (passes on entire lines instead of pixels)

# PNG
Was born to provide a patent/license-less alternative to GIF, in transmission over networks (www, now W3C recommendation)

First proposed name: PING = "PING Is Not GIF", an open alternative to GIF.
Now it's actually Portable Network Graphics

Full specification approved by W3C

## Features
- Uses RGB/RGBA color models, not CMYK, because it's not aimed at professional photos encoding
- Lossless compression
- Optional _alpha channel_
- Extensibility (can add other information in a standard way, such as other channels)
- Implements interlacing for progressive visualization:
    * Double information needed every iteration: 1 pixel for position 1, 1 pixel also for 2, 2 for 3, 4 for 4...
    * Lower resolution for incomplete (partial) download, instead of half image
- Support gamma correction, for more brilliant images (rendering of the original image on actual monitor may result in darker images)
- MNG (Multiple-image Network Graphics) to copy GIF's animated pictures, but it's not used (too much space in comparison).
Now APNG (Animated PNG) exists and has less space occupation. Extension over PNG

## Color depth
PNG supports:
- 1 bit to 2 bytes per channel for true color and greyscale
- Index colors

## Compression
Uses DEFLATE, combination of LZ77 (or LZ1) and Huffman, also implemented in zlib (Unix `zip` command)

# PNG vs JPEG
- JPEG offers a way greater compression (lossy though) and is great for photographic images.
- When compared on artificial photos (sharp transitions, high contrast) JPEG produces awful visual artifacts (salt and pepper).
This is caused by the DCT (Discrete Cosine Transform) coefficient quantization

# Webp
In 2010 Google released webp, which aims to replace JPEG, PNG and GIF with lossy and lossless compression (and animation and transparency support).
It is actively supported and promoted by Google, but support is still not comparable to the wider-known formats yet
