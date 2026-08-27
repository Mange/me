#let language-colors = json("language-colors.json")

#let fa-solid = "Font Awesome 7 Free Solid"
#let fa-brands = "Font Awesome 7 Brands"

// FontAwesome Free codepoints.
#let ico-at = "\u{f1fa}"
#let ico-cloud = "\u{f0c2}"
#let ico-cloudflare= "\u{e07d}"
#let ico-database = "\u{f1c0}"
#let ico-gem= "\u{f3a5}"
#let ico-github = "\u{f09b}"
#let ico-globe = "\u{f0ac}"
#let ico-map-marker = "\u{f3c5}"
#let ico-mobile-screen-button = "\u{f3cd}"
#let ico-phone = "\u{f095}"
#let ico-terminal= "\u{f120}"

// FontAwesome Brands codepoints.
#let ico-aws = "\u{f375}"
#let ico-css= "\u{e6a2}"
#let ico-docker = "\u{f395}"
#let ico-git-alt = "\u{f841}"
#let ico-golang= "\u{e40f}"
#let ico-google-play = "\u{f3ab}"
#let ico-html5= "\u{f13b}"
#let ico-js= "\u{f3b8}"
#let ico-keybase = "\u{f4f5}"
#let ico-kubernetes = "\u{e857}"
#let ico-linux = "\u{f17c}"
#let ico-node= "\u{f419}"
#let ico-php= "\u{f457}"
#let ico-postgresql = "\u{e858}"
#let ico-python= "\u{f3e2}"
#let ico-react= "\u{f41b}"
#let ico-rust= "\u{e07a}"
#let ico-typescript= "\u{e840}"
#let ico-vim = "\u{e88a}"
#let ico-vuejs= "\u{f41f}"

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

#let icon(cp, font: fa-solid, size: 9pt, ..text-args) = text(font: font, top-edge: "bounds", bottom-edge: "bounds", ..text-args)[#cp]

// A colored square containing a FontAwesome glyph, followed by a text label.
#let icon-text(cp, label, font: fa-solid, box-size: 0.62cm, icon-size: 9pt) = grid(
  columns: (box-size, auto),
  column-gutter: 0.2cm,
  align: (center + horizon, left + horizon),
  box(fill: color-primary, width: box-size, height: box-size)[
    #align(center + horizon)[#icon(fill: color-fg)[#cp]]
  ],
  text(fill: color-text, size: icon-size)[#label],
)

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

// Pill-like rendering of something.
#let pill(color: color-primary, content, icon: ()) = box(
  stroke: color,
  fill: color.lighten(80%),
  radius: 100%,
  inset: (x: 5pt, y: 3pt),
)[
  #if icon != () [
    #text(size: 6pt)[#icon] #h(2pt)
  ]
  #text(size: 8pt)[#content]
]

// Languages, frameworks, APIs, and libraries pills
#let p-c = pill(
  "C",
  color: rgb(language-colors.at("C").color),
)
#let p-css = pill(
  "CSS",
  icon: icon(ico-css, font: fa-brands),
  color: rgb(language-colors.at("CSS").color),
)
#let p-cucumber = pill(
  "Cucumber",
  color: rgb(language-colors.at("Gherkin").color),
)
#let p-expo = pill(
  "Expo",
  icon: icon(ico-mobile-screen-button),
)
#let p-golang = pill(
  "Go",
  icon: icon(ico-golang, font: fa-brands),
  color: rgb(language-colors.at("Go").color),
)
#let p-html = pill(
  "HTML",
  icon: icon(ico-html5, font: fa-brands),
  color: rgb(language-colors.at("HTML").color),
)
#let p-jruby = pill(
  "JRuby",
  icon: icon(ico-gem, font: fa-brands),
  color: rgb(language-colors.at("Ruby").color),
)
#let p-js = pill(
  "Javascript",
  icon: icon(ico-js, font: fa-brands),
  color: rgb(language-colors.at("JavaScript").color),
)
#let p-lucene = pill(
  "Lucene",
)
#let p-nextjs = pill(
  "NextJS",
  icon: icon(ico-react, font: fa-brands),
  color: rgb(language-colors.at("JavaScript").color),
)
#let p-nodejs = pill(
  "Node.js",
  icon: icon(ico-node, font: fa-brands),
  color: rgb(language-colors.at("JavaScript").color),
)
#let p-opentofu = pill(
  "OpenTofu",
  color: rgb(language-colors.at("HCL").color),
)
#let p-php = pill(
  "PHP",
  icon: icon(ico-php, font: fa-brands),
  color: rgb(language-colors.at("PHP").color),
)
#let p-python = pill(
  "Python",
  icon: icon(ico-python, font: fa-brands),
  color: rgb(language-colors.at("Python").color),
)
#let p-rails = pill(
  "Ruby on Rails",
  icon: icon(ico-gem, font: fa-brands),
  color: rgb(language-colors.at("Ruby").color),
)
#let p-react = pill(
  "React",
  icon: icon(ico-react, font: fa-brands),
  color: rgb(language-colors.at("JavaScript").color),
)
#let p-react-native = pill(
  "React Native",
  icon: icon(ico-mobile-screen-button),
)
#let p-remix = pill(
  "Remix / React Router",
  color: rgb(language-colors.at("TypeScript").color),
)
#let p-ruby = pill(
  "Ruby",
  icon: icon(ico-gem, font: fa-brands),
  color: rgb(language-colors.at("Ruby").color),
)
#let p-rust = pill(
  "Rust",
  icon: icon(ico-rust, font: fa-brands),
  color: rgb(language-colors.at("Rust").color),
)
#let p-shell = pill(
  "Shell / Bash",
  icon: icon(ico-terminal),
)
#let p-sql = pill(
  "SQL",
  icon: icon(ico-database),
  color: rgb(language-colors.at("SQL").color),
)
#let p-tanstack = pill(
  "Tanstack",
  icon: icon(ico-react, font: fa-brands),
  color: rgb(language-colors.at("TypeScript").color),
)
#let p-terraform = pill(
  "Terraform",
  icon: icon(ico-globe),
  color: rgb(language-colors.at("HCL").color),
)
#let p-ts = pill(
  "Typescript",
  icon: icon(ico-typescript, font: fa-brands),
  color: rgb(language-colors.at("TypeScript").color),
)
#let p-vue = pill(
  "Vue",
  icon: icon(ico-vuejs, font: fa-brands),
  color: rgb(language-colors.at("Vue").color),
)
#let p-webrtc = pill(
  "WebRTC",
  icon: icon(ico-globe),
  color: rgb(language-colors.at("HTML").color),
)

// Methodology pills
#let p-agile = pill("Agile")
#let p-bdd = pill("BDD / TDD")
#let p-data-ingestion = pill("Data ingestion")
#let p-pairing = pill("Pair programming")

// Tool pills
#let p-docker = pill(
  "Docker",
  icon: icon(ico-docker, font: fa-brands),
  color: rgb(language-colors.at("Dockerfile").color),
)
#let p-git = pill("Git", icon: icon(ico-git-alt, font: fa-brands))
#let p-linux = pill("Linux", icon: icon(ico-linux, font: fa-brands))
#let p-nix = pill("Nix", color: rgb(language-colors.at("Nix").color))
#let p-unix = pill("UNIX systems")
#let p-vim = pill(
  "Vim",
  icon: icon(ico-vim, font: fa-brands),
  color: rgb(language-colors.at("Vim script").color),
)
#let p-graphql = pill("GraphQL", color: rgb(language-colors.at("GraphQL").color))

// Service pills
#let p-aws = pill("AWS", icon: icon(ico-aws, font: fa-brands))
#let p-cloudflare-stream = pill("Cloudflare Stream", icon: icon(ico-cloudflare))
#let p-elasticsearch = pill("Elasticsearch")
#let p-gcp = pill("GCP", icon: icon(ico-cloud))
#let p-google-play = pill("Google Play", icon: icon(ico-google-play, font: fa-brands))
#let p-kubernetes = pill(
  "Kubernetes",
  icon: icon(ico-kubernetes, font: fa-brands),
  color: rgb(language-colors.at("YAML").color),
)
#let p-mongodb = pill("MongoDB", icon: icon(ico-database))
#let p-mssql = pill("MSSQL", icon: icon(ico-database))
#let p-mysql = pill("MySQL", icon: icon(ico-database))
#let p-netsuite = pill("Netsuite")
#let p-opensearch = pill("OpenSearch")
#let p-postgres = pill(
  "PostgreSQL",
  icon: icon(ico-postgresql, font: fa-brands),
  color: rgb(language-colors.at("PLSQL").color),
)
#let p-redis = pill("Redis", icon: icon(ico-database))
#let p-solr = pill("Solr")
#let p-valkey = pill("Valkey", icon: icon(ico-database))

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
