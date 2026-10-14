// Colorscheme
#let bubblegum-pink = rgb("#f45b69")
#let dusty-grape = rgb("#52489c")
#let platinum = rgb("#ebebeb")
#let smart-blue = rgb("#4062bb")
#let strong-cyan = rgb("#59c3c3")
#let color-text = black
#let color-fg = white
#let color-lighter = strong-cyan
#let color-primary = smart-blue
#let color-darker = dusty-grape
#let color-secondary = bubblegum-pink

// Color-boxed, uppercased, name line for the header.
#let name-box(t, size: 30pt) = box(fill: color-secondary, inset: (x: 4pt, y: 2pt))[
  #text(fill: color-fg, weight: "bold", size: size)[#upper(t)]
]

// Color-boxed, uppercased, section heading.
#let cvsect(body) = block(above: 1em, below: 0.6em)[
  #box(fill: color-primary, inset: (x: 4pt, y: 3pt))[
    #text(fill: color-fg, weight: "bold")[#upper(body)]
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
      #text(weight: "bold", fill: color-darker)[#title] #h(1fr) #text(size: 8pt, weight: "bold", fill: color-primary)[#org] \
      #body
    ],
  )
]

#let techstack(items) = par(justify: false)[ #items.join([ ]) ]

// Horizontal bar chart. items: array of (label, percent-of-max-width).
#let bar-chart(items, max-width: 5.5cm, bar-height: 0.35cm, gap: 8pt) = grid(
  columns: (auto, max-width),
  column-gutter: 0.15cm,
  row-gutter: gap,
  align: (right + horizon, left + horizon),
  ..items
    .map(it => (
      it.at(0),
      box(fill: color-lighter, height: bar-height * 0.8, width: max-width * (it.at(1) / 100)),
    ))
    .flatten()
)

// A row of size-scaled bubbles with labels, e.g. bubbles(((6, "Backend"), (5, "Web"))).
#let bubbles(items, unit: 0.2cm, gap: 0.8cm, label-size: 9pt) = {
  let n = items.len()
  let diameters = items.map(it => it.at(0) * unit)
  let row-height = calc.max(..diameters)
  let colors = (color-primary, color-darker, color-secondary, color-lighter)
  align(center)[
    #grid(
      columns: (auto,) * n,
      column-gutter: gap,
      row-gutter: 6pt,
      ..range(n).map(i => align(center)[#text(size: label-size)[#items.at(i).at(1)]]),
      ..range(n).map(i => {
        let d = diameters.at(i)
        box(width: d, height: row-height)[
          #place(horizon + center, box(fill: colors.at(i), radius: 100%, width: d, height: d))
        ]
      }),
    )
  ]
}
