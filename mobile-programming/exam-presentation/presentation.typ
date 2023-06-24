#import "typst-slides/slides.typ": *
#import "typst-slides/themes/bristol.typ": *

// Path is based on the theme path
#let img-dir = "../../images/"

#show: slides.with(
  authors: "Alberto Lazari - 2089120",
  short-authors: "Alberto Lazari",
  title: "The PNG format for digital images encoding",
  subtitle: "Mobile Programming & Multimedia exam presentation",
  short-title: "The PNG format",
  date: "June 26, 2023",
  theme: bristol-theme(
    color: rgb(178, 14, 16),
    logo: img-dir + "unipd-logo.png",
    watermark: img-dir + "blank.png",
    secondlogo: img-dir + "blank.png",
  )
)

// Make the section name more visible and distinct from the title
#let section = name => {
  new-section([ #set text(size: 20pt, weight: "bold"); #name ])
}

#set text(font: "Arial")
// Add background to monospace text
#show raw.where(block: false): box.with(
  fill: luma(220),
  inset: (x: 3pt, y: 0pt),
  outset: (y: 8pt),
  radius: 4pt,
)
#show raw.where(block: true): block.with(
  fill: luma(220),
  inset: 10pt,
  radius: 10pt,
)

#slide(theme-variant: "title slide")

#section("The history of GIF")
#slide(title: "Let's talk about GIF first")[
  // Start with empty slide
  // on the second sub-slide start the list
  #show: pause(2)
  #line-by-line(start: 2, mode: "transparent")[
    - Released in 1987
    - First format for image transmission over a network
    - Provides animations and transparency
    - Indexed colors (8 bits - 256 colors)
    - Lossless compression using LZW
  ]
]

#slide(theme-variant: "wake up")[
  Everything was great#uncover(2)[, until it wasn't]
]

#slide(title: "Licensing")[
  In 1994 Unisys patented the LZW algorithm

  $==>$ *pay royalties* to support the format! #uncover(2)[(until 2004)]
]

#section("PNG's birth")
#slide(title: "Time to PING!")[
  #one-by-one[- Users started to plan a *free* alternative][- GIF's lack of true color support]["PING Is Not GIF" was born!][

    Later renamed to "Portable Network Graphics" (PNG)
  ]
]

#slide(title: "Features")[
  #line-by-line(mode: "transparent")[
    - True color, grayscale and indexed colors support
    - Optional alpha channel
    - Lossless #text(size: 18pt)[(non-patented!)] compression algorithm
    - Interlacing for low-resolution image earlier in the transfer
    - Gamma correction
    - Extensible (e.g. add other channels)
  ]
]

#section("Features")
#slide(title: "Color depth")[
  #only(1)[
    True color has 8/16 bits per channel

    #set text(size: 16pt)
    #figure(
      grid(
        columns: (1fr, 1fr),
        image("images/test-images/pelmo.gif", width: 80%),
        image("images/test-images/pelmo.png", width: 80%),
      ),
      caption: [GIF vs PNG]
    )
  ]

  #only(2)[
    Also supports indexed colors (1-8 bits - max 256 colors)

    #set text(size: 16pt)
    #figure(
      grid(
        columns: (1fr, 1fr),
        image("images/test-images/pelmo.gif", width: 80%),
        image("images/test-images/pelmo-indexed.png", width: 80%),
      ),
      caption: [GIF vs PNG with indexed colors]
    )
  ]

  #only(3)[
    Grayscale also supported (1-16 bits per pixel)

    #set text(size: 16pt)
    #figure(
      image("images/test-images/pelmo-grayscale.png", width: 40%),
      caption: [Grayscale PNG]
    )
  ]
]

#slide(title: "Color model")[
  Either RGB or RGBA for transparency, focus on artificial images

  Human color perception out of PNG scope $->$ no YUV / YCbCr with specific optimizations (see JPEG)
]

#slide(title: "Compression")[
  - Uses DEFLATE algorithm
  - Combination of LZ77 (or LZ1) and Huffman
  - Also implemented in zlib and default compression method in `zip` utility:
  ```bash
  $ zip --compression-method=deflate archive.zip dir/*
  ```
]
