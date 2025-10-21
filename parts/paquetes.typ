#import "@preview/touying:0.6.1": *
#import themes.simple: *

#import "/utils.typ": *


= Plantillas y paquetes

== Paquetes útiles
#let package(name) = hi-link(
  "https://typst.app/universe/package/" + name,
  raw(name),
)

Disponibles en #hi-link("https://typst.app/universe/")[Typst Universe] (400+).
- Bloques de código: #package("codly")
- Gráficas: #package("lilaq")
- Algoritmos: #package("lovelace")
- Teoremas: #package("theorion")
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


== Plantilla para memorias
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
