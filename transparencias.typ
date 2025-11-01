#import "@preview/touying:0.6.1": *
#import "@preview/grayness:0.4.1": image-transparency
#import themes.simple: *

#import "@preview/tiaoma:0.3.0": qrcode

#import "utils.typ": *


/* CONFIG */

#set text(lang: "es")

#let title = [Memorias de p\*\*\*\* madre]
#let org = [GUL UC3M]

// pass the "PRESENTATION" variable w/ --input to enable presentation mode
#let presentation-mode = (
  sys.inputs.at("PRESENTATION", default: none) != none
)

#show: simple-theme.with(
  aspect-ratio: "4-3",
  footer: [#org --- #title],
  primary: primary-color,
  config-common(handout: not presentation-mode),
)



#set list(indent: 1em, spacing: 1em)
#set enum(indent: 1em, spacing: 1em)

// GFM-like monospace text

#show raw.where(block: false): set raw(lang: "typ")
#show raw.where(block: false): it => context {
  set text(size: if dark-mode.get() { .9em } else { 1em })
  let spacing = if dark-mode.get() { .6em } else { .5em }

  h(spacing, weak: true)
  box(
    fill: if dark-mode.get() { aqua.darken(75%) } else { color.rgb("#f5f5f5") },
    outset: 0.3em,
    radius: 0.3em,
    it,
  )
  h(spacing, weak: true)
}

#show raw.where(block: true): it => context {
  set text(size: if dark-mode.get() { .9em } else { 1em })
  let spacing = if dark-mode.get() { .4em } else { .3em }

  v(spacing)

  box(
    fill: if dark-mode.get() { aqua.darken(75%) } else { color.rgb("#f5f5f5") },
    outset: (y: .7em),
    inset: (x: .5em),
    radius: 0.3em,
    width: 100%,
    it,
  )

  v(spacing)
}

// custom title slide
#let title-slide = title-slide.with(
  config: config-page(background: image-transparency(
    read("img/gul_logo.svg", encoding: none),
    alpha: 30%,
    format: "svg",
  )),
)


/* TITLEPAGE */

#title-slide[
  #heading(title, outlined: false)
  === Introducción a Typst
  #v(2em)

  Luis Daniel Casais\
  #hi-link("https://github.com/rajayonin")[\@rajayonin]

  #v(1em)

  #link("https://gul.uc3m.es", org)

  Noviembre 2025
]


/* OUTLINE */
// #components.adaptive-columns(outline(indent: 1em, depth: 1))


#clear-header()

/* QR */
== Transparencias
#{
  let url = "https://github.com/rajayonin/typst-intro/blob/main/transparencias.pdf"
  v(0.7fr)
  set align(center)

  qrcode(options: (scale: 5.0), url)
  hi-link(url, text([github.com/rajayonin/typst-intro], size: 32pt))
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
#v(1fr)

- #hi-link("https://typst.app/docs")[Documentación de Typst]
- #hi-link("https://sitandr.github.io/typst-examples-book/book/")[Typst Examples
    Book]
- #hi-link("https://forum.typst.app/")[Typst Forums]
- #hi-link("https://discord.com/invite/typst-1054443721975922748")[Typst Discord
    server]
- #hi-link("https://typst.app/docs/guides/guide-for-latex-users/")[Guía para
    usuarios de #LaTeX]
- #hi-link("https://gitlab.com/TheZoq2/ttt/")[Typst To #TeX]
- #hi-link("https://github.com/mitex-rs/mitex")[Mi#TeX] (#LaTeX #sym.arrow
  Typst)
- #strike[#hi-link("https://github.com/rajayonin/latex-thesis/")[L. D. Casais --
      Memorias de TFG en #LaTeX] (2025)]

#v(1fr)

#title-slide[
  = ¡Ánimo!
]
