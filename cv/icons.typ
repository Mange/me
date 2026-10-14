#import "lib.typ": *

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
