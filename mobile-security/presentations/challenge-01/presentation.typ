#import "common.typ": *
#import "@preview/xarrow:0.2.0": xarrow

#show: slides.with(
  authors:        [Alberto Lazari],
  short-authors:  [Alberto Lazari],
  title:          [FileHasher],
  subtitle:       [Mobile security -- Challenge 01],
  short-title:    [#v(.5em) Challenge 01 -- FileHasher],
  date:           [October 13, 2023],
  theme: bristol-theme(
    color:      unipd-red,
    logo:       "/images/unipd-logo.svg",
    // Don't use watermarks, by using a blank image (`none` can't be used)
    watermark:  "/images/blank.png",
    secondlogo: "/images/blank.png",
  )
)

#set text(font: "Arial")

#show raw: itself => {
  set text(font: "Menlo")
  itself
}
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

#show figure: itself => {
  set text(size: 16pt)
  itself
}

#slide(theme-variant: "title slide")

#new-section[Challenge background]
#slide(title: [Main topics])[
  #align(center, grid(
    columns: (1fr, 1fr),
    [
      === Activities
      #figure(image(width: 80%, "images/activities.png"))
    ],
    uncover(2)[
      === Intents
      #set text(size: .6em)

      #align(horizon)[
        `MainActivity`
        #xarrow(text(size: .7em, font: "Menlo", "com.example.app.OtherActivity"))
        `OtherActivity`
      ]
    ]
  ))
]

#slide(title: [Implicit intents])[
  #only("1-2", align(horizon + center, grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    uncover(1, say[Hey, could you find someone that can do this for me?]),
    none,
    uncover(2, say[Sure!]),

    [`AnExampleApp`],
    xarrow(text(size: .7em, font: "Menlo", "com.example.intent.action.OPEN_A_LINK")),
    image(width: 3em, "images/android.png"),
  )))

  #only("3-", align(horizon + center, grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    uncover(3, say[Can anyone do action #text(size: .85em, font: "Menlo", "com.example.intent.action.OPEN_A_LINK")?]),
    uncover(4, say[I can do it!]),

    image(width: 3em, "images/android.png"),
    uncover(4)[`SomeBrowser`],
  )))
]

#new-section[The challenge]
#slide(title: [How does it work?])[
  #align(horizon + center, grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    {
      only("1-4", uncover(1, say[Can someone generate the hash of a file for me, please?]))
      only(5, say[Thanks, the flag is #strong[FLAG{...}]])
    },
    none,
    {
      only("1-2", uncover(2, say[Of course!]))
      only(3, text(size: .7em, "*doing stuff*"))
      only(4, say[Here's your hash])
    },

    [`VictimApp`],
    {
      only("1-2", xarrow(text(size: .7em, font: "Menlo", "com.mobiotsec.intent.action.HASH_FILE")))
      only(4, xarrow(
        sym: sym.arrow.l,
        width: 10em,
        text(size: .7em, font: "Menlo", "hash")
      ))
    },
    {
      uncover("2-")[`MaliciousApp`]
    }
  ))
]

#slide(title: "#TODO")[
  #line-by-line(mode: "transparent")[
    1. Catch the intent
    2. Read the file
    3. Hash the file
    4. Return the result
  ]
]

#new-section[Implementation]
#slide(title: [Catch the intent])[
]
