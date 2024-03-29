// This theme contains ideas from the former "bristol" theme, contributed by
// https://github.com/MarkBlyth

#import "@preview/polylux:0.3.1": *

#let unipd-red = rgb(180, 27, 33)

#let clean-footer = state("clean-footer", [])
#let clean-short-title = state("clean-short-title", none)
#let clean-color = state("clean-color", unipd-red)
#let clean-logo = state("clean-logo", none)


#let theme(
  aspect-ratio: "16-9",
  footer: [],
  short-title: none,
  logo: none,
  color: unipd-red,
  body
) = {
  set page(
    paper: "presentation-" + aspect-ratio,
    margin: 0em,
    header: none,
    footer: none,
  )
  set text(size: 25pt)
  show footnote.entry: set text(size: .6em)

  clean-footer.update(footer)
  clean-color.update(color)
  clean-short-title.update(short-title)
  clean-logo.update(logo)

  body
}


#let title-slide(
  title: none,
  subtitle: none,
  authors: (),
  date: none,
  watermark: none,
  secondlogo: none,
) = {
  let content = locate( loc => {
    let color = clean-color.at(loc)
    let logo = clean-logo.at(loc)
    let authors = if type(authors) in ("string", "content") {
      ( authors, )
    } else {
      authors
    }

    if watermark != none {
      set image(width: 100%)
      place(watermark)
    }

    v(5%)
    grid(columns: (5%, 1fr, 1fr, 5%),
      [],
      if logo != none {
        set align(bottom + left)
        set image(height: 3em)
        logo
      } else { [] },
      if secondlogo != none {
        set align(bottom + right)
        set image(height: 3em)
        secondlogo
      } else { [] },
      []
    )

    v(-10%)
    align(center + horizon)[
      #block(
        stroke: ( y: 1mm + color ),
        inset: 1em,
        breakable: false,
        [
          #text(1.3em, unipd-red, smallcaps[*#title*]) \
          #{
            if subtitle != none {
              parbreak()
              text(.9em, unipd-red)[*#subtitle*]
            }
          }
        ]
      )
      #set text(size: .8em)
      #grid(
        columns: (1fr,) * calc.min(authors.len(), 3),
        column-gutter: 1em,
        row-gutter: 1em,
        ..authors
      )
      #v(1em)
      #date
    ]
  })
  logic.polylux-slide(content)
}

#let slide(title: none, body) = {
  let header = align(top, locate( loc => {
    let color = clean-color.at(loc)
    let logo = clean-logo.at(loc)
    let short-title = clean-short-title.at(loc)

    show: block.with(stroke: (bottom: 1mm + color), width: 100%, inset: ( x: .5em, y: .3em ))
    set text(size: .6em, unipd-red)

    let current-section = text(1.1em, weight: "bold", utils.current-section)

    grid(
      columns: (1fr, 1fr),
      if logo != none {
        set align(left)
        set image(height: 4em)
        logo
      } else { [] },
      if short-title != none {
        align(horizon + right, grid(
          columns: 1, rows: 1em, gutter: .5em,
          short-title,
          current-section
        ))
      } else {
        align(horizon + right, current-section)
      }
    )
  }))

  let footer = locate( loc => {
    set text(unipd-red)
    let color = clean-color.at(loc)

    block(
      stroke: ( top: 1mm + color ), width: 100%, inset: ( .5em ),
      text(.6em, {
        clean-footer.display()
        h(1fr)
        [#logic.logical-slide.display() / #logic.logical-slide.final(loc).first()]
      })
    )
  })

  set page(
    margin: ( top: 4em, bottom: 2.5em, x: 1em ),
    header: header,
    footer: footer,
    footer-descent: 1em,
    header-ascent: 1em,
  )

  let body = pad(x: .0em, y: .5em, body)


  let content = block(inset: ( x: .5em ), {
    if title != none {
      heading(level: 2, text(unipd-red, title))
    }
    block(height: 87%, align(horizon, body))
  })

  logic.polylux-slide(content)
}

#let focus-slide(background: teal, foreground: white, body) = {
  set page(fill: background, margin: 2em)
  set text(fill: foreground, size: 1.5em)
  let content = { v(.1fr); body; v(.1fr) }
  // logic.polylux-slide(align(horizon, body))
  logic.polylux-slide(content)
}

#let new-section-slide(name) = {
  set page(margin: 2em)
  let content = locate( loc => {
    let color = clean-color.at(loc)
    set align(center + horizon)
    show: block.with(stroke: ( bottom: 1.2mm + color ), inset: ( y: .8em ),)
    set text(size: 1.5em)
    strong(name)
    utils.register-section(name)
  })
  logic.polylux-slide(content)
}
