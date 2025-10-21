#import "@preview/touying:0.6.1": *
#import themes.simple: *

#import "/utils.typ": *


= Estilado


#focus-slide[
  // #set raw(lang: "typc") // esto no funciona porque patata
  #rawc("show") reemplaza funciones, mientras que #rawc("set") sobreescribe parámetros por defecto
]


== Reglas #rawc("set")
Ponen parámetros por defecto en funciones _builtin_.

#grid(columns: (1fr, 1fr), column-gutter: 1em)[
  ```typ
  #set text(lang: "es")

  #text(["caca"])
  ```
][
  ```typ
  #text(
    lang: "es", ["caca"]
  )
  ```
]

// set-if
Sólo afectan dentro del _scope_ actual:
#grid(columns: (1fr, 1fr), column-gutter: 1em)[
  ```typ
  #if epañol {
    set text(lang: "es")
  } else {
    set text(lang: "en")
  }

  #text["caca"] // no fufa
  ```
][
  ```typ
  #set text(
    lang: if epañol { "es" }
          else { "en" }
  )

  #text["caca"] // ahora sí
  ```
]




== Reglas #rawc("show")
// aplicar reglas a funciones, etc.

// show-set

// show-lambda

// show-where

// show-selector


== _Scope_


== Ejemplos
// idioma
// headings (numbering)
// page