#import "@preview/touying:0.6.1": *
#import themes.simple: *

#import "@preview/numbly:0.1.0": numbly
#import "@preview/metalogo:1.2.0": LaTeX

#set text(lang: "es")

#let title = [Memorias de p\*\*\*\* madre]

#show: simple-theme.with(
  aspect-ratio: "4-3",
  footer: title,
)

// #set heading(numbering: numbly("{1}.", default: "1.1"))
#set list(indent: 1em, spacing: 1em)
#set enum(indent: 1em, spacing: 1em)

#title-slide[
  #heading(title, outlined: false)
  #v(1em)
  Introducción a Typst
  #v(2em)

  Luis Daniel Casais

  #link("https://gul.uc3m.es", [GUL UC3M])

  Octubre 2025
]


#components.adaptive-columns(outline(indent: 1em))


= Introducción

#focus-slide[

  #set align(left)
  #quote(attribution: [Yo], block: true)[
    Typst es como #LaTeX, pero no da asco.
  ]

]



== Como #LaTeX...
#v(1fr)

- Uso de archivos de texto plano
- Permite el uso de plantillas y macros para simplificar y estandarizar el
  proceso
- Extremadamente útil para ecuaciones y bibliografía
- Numeración automática de capítulos, figuras, tablas, notas a pie de página,
  referencias...
- Generación automática de índices y glosarios

#v(1fr)


== ...pero no da asco
#v(1fr)

- _Blazingly fast_ #emoji.rocket
- Sintaxis simple
- Lenguaje de programación de verdad

#v(1fr)
