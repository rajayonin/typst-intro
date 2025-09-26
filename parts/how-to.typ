#import "@preview/touying:0.6.1": *
#import themes.simple: *

#import "/utils.typ": *


= _How to Typst_


== Modos sintácticos

*Código* (`#`): Permite usar directamente el lenguaje de _scripting_.
```typ
#let foo(n) = { n + 1 }
```
```typ
Tengo #foo(68) Labubus.
```

#pause

*_Markup_* (`[..]`): Modo por defecto, _WYSIWYG_.
#speaker-note([_What You See Is What You Get_, básicamente markdown])

```typ
Typst es _blazingly fast_! 🚀
```

```typc
let cool-os = [*Linux!* 🐧]
```

#pagebreak()

*Mates* (`$..$`): Permite expresar ecuaciones matemáticas.

```typ
$ x = (-b plus.minus sqrt(b^2 - 4a c)) / (2a) $
```

$ x = (-b plus.minus sqrt(b^2 - 4a c)) / (2a) $


#pause


Los distintos modos son intercalables:

// mil gracias @JorgeyGari por tu aportación
```typ
El peso de tus madres se calcula con $lim_(x -> 0) 1/x$.
#let peso(_madre) = { sym.infinity }
#for i in range(2) [
  Tu madre #i pesa #peso(i) kg.
]
```


== Formato de texto
- Comentarios con `//` o `/* */`
#pause
- Caracteres especiales (`\\`, `#`, `$`, `_`, `*`) se escapan con `\\`
#pause
- #strong(text(black)[Negrita]): `*...*` (#hi-link(
    "https://typst.app/docs/reference/model/strong/",
    [#old-raw("strong")],
  ))
#pause
- _Cursiva_: `_..._` (#hi-link(
    "https://typst.app/docs/reference/model/emph/",
    [#old-raw("emph")],
  ))
#pause
- `Monoespaciado`: #raw("`...`") (#hi-link(
    "https://typst.app/docs/reference/model/raw/",
  )[#old-raw("raw")])
#pause
- Bloques de código con #raw("```")
#pause
- `= Capítulo`, `== Sección`, `=== Subsección` (#hi-link(
    "https://typst.app/docs/reference/model/heading/",
    [#old-raw("heading")],
  ))
#pause
- Notas a pie de página: `#footnote([...])`
#pause
- #hi-link("https://motherfuckingwebsite.com/", [Links]): `#link("<url>")[...]`,
  ) o `https://link.com`
#pause
- Comillas "inteligentes" (dependientes del idioma): `"`, `'`
#pause
- Símbolos: `~` (_nsbp_), `---`/`--` (raya/semiraya), #hi-link(
    "https://typst.app/docs/reference/symbols/sym/",
  )[#old-raw("sym")], #hi-link(
    "https://typst.app/docs/reference/symbols/emoji/",
  )[#old-raw("emoji")]


== Saltos
Los saltos de línea son automáticos. Un salto de línea en el archivo fuente no
rompe una línea.

#pause

- Para saltar una línea, se usa `/`
#pause
- Para saltar un párrafo se deja una línea en blanco\ (o `#parbreak()`)
#pause
- Para saltar una página se usa `#pagebreak()`

#pause

#grid(columns: (1fr, 1fr), column-gutter: 1em)[
  ```typ
  Esta línea no
  la rompe ni Dios.
  ```
][
  #v(1em)
  Esta línea no la rompe ni Dios.
]

#grid(columns: (1fr, 1fr), column-gutter: 1em)[
  ```typ
  Esta la rompo yo\
  porque me da la gana.
  ```
][
  #v(.3em)
  Esta la rompo yo\
  porque me da la gana.
]


== Listas
Enumeradas (#hi-link(
  "https://typst.app/docs/reference/model/enum/",
  old-raw("enum"),
)) o no enumeradas (#hi-link(
  "https://typst.app/docs/reference/model/list/",
  old-raw("list"),
)).

#grid(columns: (1fr, 1fr), column-gutter: 1em)[
  ```typ
  + Primero
  + Segundo
  ```
  ```typ
  - Uno
  - Otro
  ```
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
  ```typ
  + Primero
    - Primero uno
    - Luego otro
  + Segundo
  ```
][
  #set list(indent: 0pt, spacing: auto)
  #set enum(indent: 0pt, spacing: auto)
  #v(.3em)
  + Primero
    - Primero uno
    - Luego otro
  + Segundo
]


== Referencias
Primero se crea una marca (#hi-link(
  "https://typst.app/docs/reference/foundations/label/",
)[`label`]) con `<id>`.
#pause
- Para las referencias bibliográficas, esto no es necesario

#pause

Para referenciarla, basta con usar `@id`
#pause
- Dependiendo de lo que hayas marcado (sección, figura, ecuación, etc.), se
  pondrá un texto automáticamente
#pause
- Puedes especificar el texto (suplemento) con `@id[...]`

#pause

#v(.5em)

#grid(columns: (1fr, 1fr), column-gutter: 1em)[
  ```typ
  === Introducción <intro>
  En la @intro...
  ```
][
  #set heading(numbering: "1.")
  #counter(heading).update((6, 9))
  #show heading: set text(size: 25pt)

  #v(.3em)
  === Introducción <intro>
  En la @intro...
]

#grid(columns: (1fr, 1fr), column-gutter: 1em)[
  ```typ
  $ pi = e = 3 $ <real>
  El @real[Teorema]...
  ```
][
  #set math.equation(numbering: "(1)")
  #show heading: set text(size: 26pt)

  #v(.3em)
  $ pi = e = 3 $ <real>
  #v(-.5em)
  El @real[Teorema]...
]


== Imágenes
// pdf v0.14 #footnote([ver https://github.com/typst/typst/issues/145])
// https://github.com/typst/typst/issues/1421
// https://www.drawio.com/doc/faq/svg-export-text-problems
```typ
#figure(
  image("molecular.jpg", width: 80%),
  caption: [
    A step in the molecular testing
    pipeline of our lab.
  ],
)
```



== Tablas
#hi-link("https://www.latex-tables.com/?format=typst&force")[Generador de
  tablas]

== Ecuaciones
https://typerino.com/

#link("https://qwinsi.github.io/tex2typst-webapp/cheat-sheet.html")[Chuleta para
  fórmulas]

#link("https://qwinsi.github.io/tex2typst-webapp")[Conversor de fórmulas de
  LaTeX a Typst]



== Bibliografía



== _Scripting_

// variables y funciones

// tipos

// estructuras de datos

// control de flujo

// ejemplos de generar tablas a partir de arrays



== Archivos
// import / include
// Rutas de archivos (--root)


