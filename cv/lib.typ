#let fa-solid = "Font Awesome 7 Free Solid"
#let fa-brands = "Font Awesome 7 Brands"

// FontAwesome Free codepoints.
#let ico-map-marker = "\u{f3c5}"
#let ico-phone = "\u{f095}"
#let ico-at = "\u{f1fa}"
#let ico-globe = "\u{f0ac}"
#let ico-github = "\u{f09b}"

// FontAwesome Brands codepoints.
#let ico-keybase = "\u{f4f5}"

// A black square containing a white FontAwesome glyph, followed by a text label.
#let icon(cp, label, font: fa-solid, box-size: 0.62cm, icon-size: 9pt) = grid(
  columns: (box-size, auto),
  column-gutter: 0.2cm,
  align: (center + horizon, left + horizon),
  box(fill: black, width: box-size, height: box-size)[
    #align(center + horizon)[#text(font: font, fill: white, top-edge: "bounds", bottom-edge: "bounds")[#cp]]
  ],
  text(fill: black, size: icon-size)[#label],
)

// Black-boxed, uppercased, white name line for the header.
#let name-box(t, size: 30pt) = box(fill: black, inset: (x: 4pt, y: 2pt))[
  #text(fill: white, weight: "bold", size: size)[#upper(t)]
]

// Black-boxed, uppercased, white section heading.
#let cvsect(body) = block(above: 1em, below: 0.6em)[
  #box(fill: black, inset: (x: 4pt, y: 3pt))[
    #text(fill: white, weight: "bold")[#upper(body)]
  ]
]

// A dated entry: left column for the date(s), right column for a bold title,
// a right-aligned qualifier, and a description body.
#let entry(dates, title, org, body) = block(below: 2em)[
  #grid(
    columns: (20%, 80%),
    align: (top, top),
    [#dates],
    [
      *#title* #h(1fr) #text(size: 8pt, weight: "bold")[#org] \
      #body
    ],
  )
]

// Pill-like rendering of something.
#let pill(content) = box(fill: black, radius: 100%, inset: (x: 5pt, y: 3pt))[
  #text(fill: white, size: 8pt)[#content]
]

// Monospaced tech-stack list, e.g. techstack(("Ruby", "PostgreSQL")).
#let techstack(items) = par(justify: false)[ #items.map(pill).join([ ]) ]

// Horizontal bar chart. items: array of (label, percent-of-max-width).
#let bar-chart(items, max-width: 5.5cm, bar-height: 0.35cm, gap: 2pt) = grid(
  columns: (auto, max-width),
  column-gutter: 0.15cm,
  row-gutter: gap,
  align: (right + horizon, left + horizon),
  ..items
    .map(it => (
      box(fill: black, inset: (x: 3pt, y: 2pt))[#text(fill: white, size: 8pt)[#it.at(0)]],
      box(fill: black, height: bar-height * 0.8, width: max-width * (it.at(1) / 100)),
    ))
    .flatten()
)

// A row of size-scaled bubbles with labels, e.g. bubbles(((6, "Backend"), (5, "Web"))).
#let bubbles(items, unit: 0.2cm, gap: 0.8cm, label-size: 9pt) = {
  let n = items.len()
  let diameters = items.map(it => it.at(0) * unit)
  let row-height = calc.max(..diameters)
  align(center)[
    #grid(
      columns: (auto,) * n,
      column-gutter: gap,
      row-gutter: 6pt,
      ..range(n).map(i => align(center)[#text(size: label-size)[#items.at(i).at(1)]]),
      ..range(n).map(i => {
        let d = diameters.at(i)
        box(width: d, height: row-height)[
          #place(horizon + center, box(fill: black, radius: 100%, width: d, height: d))
        ]
      }),
    )
  ]
}
