#import "@preview/touying:0.6.1": *
#import themes.simple: *

#import "/utils.typ": *


= _How to Typst_


== Modos sintácticos

*Código* (#mono("#")): Permite usar directamente el lenguaje de _scripting_.
#zebraw(
  ```typ
  #let foo(n) = { n + 1 }
  ```,
)
#zebraw(
  ```typ
  Tengo #foo(68) Labubus.
  ```,
)

#pause

*_Markup_* (#mono("[..]")): Modo por defecto, _WYSIWYG_.
#speaker-note([_What You See Is What You Get_, básicamente markdown])


#zebraw(
  ```typ
  Typst es _blazingly fast_! 🚀
  ```,
)
#zebraw(
  ```typc
  let cool-os = [*Linux!* 🐧]
  ```,
)

#pagebreak()

*Mates* (#mono("$..$")): Permite expresar ecuaciones matemáticas.

#zebraw(
  ```typ
  $ x = (-b plus.minus sqrt(b^2 - 4a c)) / (2a) $
  ```,
)

$ x = (-b plus.minus sqrt(b^2 - 4a c)) / (2a) $


#pause


Los distintos modos son intercalables:

// mil gracias @JorgeyGari por tu aportación
#zebraw(
  ```typ
  El peso de tus madres se calcula con $lim_(x -> 0) 1/x$.
  #let peso(_madre) = { sym.infinity }
  #for i in range(2) [
    Tu madre #i pesa #peso(i) kg.
  ]
  ```,
)


== Formato de texto
- Comentarios con #mono("//") o #mono("/* */")
#pause
- Caracteres especiales (#mono("\\"), #mono("#"), #mono("$"), #mono("_"), #mono(
    "*",
  )) se escapan con #mono("\\")
#pause
- #strong(text(black)[Negrita]): #mono("*...*") (#hi-link(
    "https://typst.app/docs/reference/model/strong/",
    [`strong`],
  ))
#pause
- _Cursiva_: #mono("_..._") (#hi-link(
    "https://typst.app/docs/reference/model/emph/",
    [`emph`],
  ))
#pause
- #mono("Monoespaciado"): #mono("`...`") (#hi-link(
    "https://typst.app/docs/reference/model/raw/",
    [`raw`],
  ))
#pause
- Bloques de código con #mono("```")
#pause
- #mono("= Capítulo"), #mono("== Sección"), #mono("=== Subsección") (#hi-link(
    "https://typst.app/docs/reference/model/heading/",
    [`heading`],
  ))
#pause
- Notas a pie de página: #mono("#footnote([...])")
#pause
- #hi-link("https://motherfuckingwebsite.com/", [Links]): #mono(
    "#link(\"<url>\", [...]))",
  ) o #mono("https://link.com")
#pause
- Comillas "inteligentes" (dependientes del idioma): #mono("\""), #mono("'")
#pause
- #mono("..."), #mono("~") (_nsbp_), #mono("---")/#mono("--") (raya/semiraya),
  #hi-link(
    "https://typst.app/docs/reference/symbols/sym/",
    [`sym`],
  ), #hi-link("https://typst.app/docs/reference/symbols/emoji/", [`emoji`])


== Saltos
Los saltos de línea son automáticos. Un salto de línea en el archivo fuente no
rompe una línea.

#pause

- Para saltar una línea, se usa #mono("/")
#pause
- Para saltar un párrafo se deja una línea en blanco\ (o #mono("#parbreak()"))
#pause
- Para saltar una página se usa #mono("#pagebreak()")

#pause

#grid(columns: (1fr, 1fr), column-gutter: 1em)[
  #zebraw(
    ```typ
    Esta línea no
    la rompe ni Dios.
    ```,
  )
][
  #v(1em)
  Esta línea no la rompe ni Dios.
]

#grid(columns: (1fr, 1fr), column-gutter: 1em)[
  #zebraw(
    ```typ
    Esta la rompo yo\
    porque me da la gana.
    ```,
  )
][
  #v(.3em)
  Esta la rompo yo\
  porque me da la gana.
]


== Listas
Enumeradas (#hi-link("https://typst.app/docs/reference/model/enum/", [`enum`]))
o no enumeradas (#hi-link(
  "https://typst.app/docs/reference/model/list/",
  [`list`],
)).

#grid(columns: (1fr, 1fr), column-gutter: 1em)[
  #zebraw(
    ```typ
    + Primero
    + Segundo
    ```,
  )
  #zebraw(
    ```typ
    - Uno
    - Otro
    ```,
  )
][
  #set list(indent: 0pt, spacing: auto)
  #set enum(indent: 0pt, spacing: auto)
  #v(.3em)
  + Primero
  + Segundo
  #v(.6em)
  - Uno
  - Otro
]

#pause

Y se pueden anidar:

#grid(columns: (1fr, 1fr), column-gutter: 1em)[
  #zebraw(
    ```typ
    + Primero
      - Primero uno
      - Luego otro
    + Segundo
    ```,
  )
][
  #set list(indent: 0pt, spacing: auto)
  #set enum(indent: 0pt, spacing: auto)
  #v(.3em)
  + Primero
    - Primero uno
    - Luego otro
  + Segundo
]



== Estructura del documento


== Referencias


== Figuras


== Imágenes


== Tablas
#link("https://www.latex-tables.com/?format=typst&force", [Generador de tablas])

== Ecuaciones
https://typerino.com/

#link("https://qwinsi.github.io/tex2typst-webapp/cheat-sheet.html", [Chuleta
  para fórmulas])

#link("https://qwinsi.github.io/tex2typst-webapp", [Conversor de fórmulas de
  LaTeX a Typst])

== _Scripting_

// variables y funciones

// tipos

// estructuras de datos

// control de flujo

// ejemplos de generar tablas a partir de arrays



== Archivos
// import / include
// Rutas de archivos (--root)


