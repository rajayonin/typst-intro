#import "@preview/touying:0.6.1": *
#import themes.simple: *

#import "/utils.typ": *


= Estilado


#focus-slide[
  // #set raw(lang: "typc") // esto no funciona porque patata
  #rawc("show") reemplaza elementos, mientras que\
  #rawc("set") sobreescribe parámetros por defecto
]


== Reglas #rawc("set")
Ponen parámetros por defecto en funciones _builtin_.

#two-col[
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

#pause

// set-if
Sólo afectan dentro del _scope_ actual:
#two-col[
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
Reemplazan (modifican) elementos.
```typ
#show /* selector */: /* predicado */
```

#pause

#[
  #set list(spacing: .9em)

  Los selectores pueden ser:
  #v(-.5em)
  - Funciones _builtin_ #sym.arrow reemplazan los elementos
    - Se puede filtrar por parámetros con #link(
        "https://typst.app/docs/reference/foundations/function/#definitions-where",
        rawc(".where()"),
      )
  - Texto (#rawc("\"caca\"")), #fn("reference/foundations", "regex"), #fn(
      "reference/foundations",
      "label",
    ) (#rawc("<test>"))
  - El resto del documento (#rawc("show: ..."))

  #pause
  Los predicados pueden ser:
  #v(-.5em)
  - Expresión
  - Función anónima #rawc("it => { }")
  - Regla #rawc("set")
]


#pagebreak()


=== Ejemplos
#v(1fr)
```typ
#show "Rust": [Rust 🚀]
```

#pause

// show-set
```typ
#show heading: set text(red)
```

#pause

// show-where
```typ
#show raw.where(block: false): set raw(lang: "typ")
```

#pause

// show-lambda
```typ
#show header: it => block[
  \~
  #emph(it.body)
  #counter(heading).display(it.numbering)
  \~
]
```

#v(1fr)
