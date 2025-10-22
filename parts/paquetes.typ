#import "@preview/touying:0.6.1": *
#import themes.simple: *

#import "/utils.typ": *


= Plantillas y paquetes

== Otros paquetes útiles
#let package(name) = hi-link(
  "https://typst.app/universe/package/" + name,
  raw(name),
)

#v(-.4em)
Disponibles en #hi-link("https://typst.app/universe/")[Typst Universe] (400+).

#speaker-note([Volver a mencionar CeTZ/fletcher.])

- Bloques de código: #package("codly")
- Gráficas: #package("lilaq")
- Algoritmos: #package("lovelace")
- Teoremas bonicos: #package("theorion")
- Presentaciones: #package("touying"), #package("gentle-clues"), #package(
    "pinit",
  )
- Glosario: #package("glosarium")
- Gantt: #package("timeley")
// - Mierda en pantalla: #package("drafting")
- Documentación: #package("tidy")
- Ingeniería de verdad: #package("physica"), #package("zero"), #package(
    "quick-maths",
  )
- Requisitos de _software_: #hi-link(
    "https://github.com/rajayonin/srs-typst",
  )[`srs`]


== Plantillas para memorias
#align(center)[
  #v(1fr)

  === Prácticas/trabajos
  #hi-link(
    "https://github.com/guluc3m/report-template-typst",
  )[guluc3m/report-template-typst]

  #v(1fr)

  === TFGs/TFMs
  #hi-link(
    "https://github.com/guluc3m/uc3m-thesis-ieee-typst",
  )[guluc3m/uc3m-thesis-ieee-typst]

]

#v(1fr)
