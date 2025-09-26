#import "@preview/touying:0.6.1": *
#import themes.simple: *

#import "@preview/tiaoma:0.3.0": qrcode
#import "@preview/zebraw:0.5.5": zebraw

#import "utils.typ": *


/* CONFIG */

#set text(lang: "es")

#let title = [Memorias de p\*\*\*\* madre]
#let org = [GUL UC3M]

#show: simple-theme.with(
  aspect-ratio: "4-3",
  footer: [#org --- #title],
  primary: primary-color,
  config-common(handout: true),
)



#set list(indent: 1em, spacing: 1em)
#set enum(indent: 1em, spacing: 1em)

// GFM-like monospace text

#show raw.where(block: false): set raw(lang: "typ")
#show raw.where(block: false): it => {
  h(0.5em, weak: true)
  box(
    fill: color.rgb("#f5f5f5"),
    outset: 0.3em,
    radius: 0.3em,
    it
  )
  h(0.5em, weak: true)
}

#show raw.where(block: true): it => {
  zebraw(numbering: false, lang: false, it)
}


/* TITLEPAGE */

#title-slide[
  #heading(title, outlined: false)
  #v(1em)
  Introducción a Typst
  #v(2em)

  #link("https://github.com/rajayonin", [Luis Daniel Casais])

  #link("https://gul.uc3m.es", org)

  Octubre 2025
]


/* OUTLINE */
// #components.adaptive-columns(outline(indent: 1em, depth: 1))


#clear-header()

/* QR */
== Transparencias
#{
  v(0.7fr)
  set align(center)
  qrcode(
    options: (scale: 5.0),
    "https://github.com/rajayonin/typst-intro/blob/main/transparencias.pdf",
  )
  hi-link(
    "https://github.com/rajayonin/typst-intro/",
    text([github.com/rajayonin/typst-intro], size: 32pt),
  )
  v(1fr)
}


/* CONTENTS */

#include "parts/intro.typ"
#include "parts/how-to.typ"
#include "parts/estilado.typ"
#include "parts/paquetes.typ"


/* MOAR INFO */

#clear-header()

== Más información
- #hi-link("https://typst.app/docs")[Documentación de Typst]
- #hi-link("https://forum.typst.app/")[Typst Forums]
- #hi-link("https://discord.com/invite/typst-1054443721975922748")[Typst
    Discord server]
- #hi-link("https://typst.app/docs/guides/guide-for-latex-users/")[Guía para
    usuarios de LaTeX]
- #hi-link("https://sitandr.github.io/typst-examples-book/book/")[Typst
    Examples Book]
