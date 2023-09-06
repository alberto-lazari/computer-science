#import "typst-slides/slides.typ": *
#import "typst-slides/themes/bristol.typ": *

#let unipd-red = rgb(178, 14, 16)

#show: slides.with(
    authors:        [Alberto Lazari -- 2089120],
    short-authors:  "Alberto Lazari",
    title:          "Typst language",
    subtitle:       "Advanced Topics in Programming languages presentation",
    short-title:    [#v(.5em) Typst],
    date:           "September 14, 2023",
    theme: bristol-theme(
        color:      unipd-red,
        logo:       "/images/unipd-logo.png",
        // Don't use watermarks, by using a blank image (`none` can't be used)
        watermark:  "/images/blank.png",
        secondlogo: "/images/blank.png",
    )
)

// Make the section name more visible and distinct from the title
#let new-section = name => new-section[
    #set text(size: 20pt, weight: "bold")
    #v(.5em)
    #name
]

// Custom wake up
#let wake-up = content => [
    #set align(center)
    #set text(weight: "bold")
    #slide(theme-variant: "wake up")[#content]
]

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

#show figure: itself => {
    set text(size: 16pt)
    itself
}


#slide(theme-variant: "title slide")

#new-section("Markup languages")
#slide(title: "LaTeX")[
    // Start with empty slide
    // on the second sub-slide start the list
    #show: pause(2)
    #line-by-line(start: 2, mode: "transparent")[
        - Old
        - Slow AF
    ]
]
