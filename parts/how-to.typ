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
    [#plain-raw("strong")],
  ))
#pause
- _Cursiva_: `_..._` (#hi-link(
    "https://typst.app/docs/reference/model/emph/",
    [#plain-raw("emph")],
  ))
#pause
- `Monoespaciado`: #raw("`...`") o #raw("```") (bloques de código) (#hi-link(
    "https://typst.app/docs/reference/model/raw/",
  )[#plain-raw("raw")])
#pause
- #underline[Subrayado]: `#underline[...]`
#pause
- `= Capítulo`, `== Sección`, `=== Subsección` (#hi-link(
    "https://typst.app/docs/reference/model/heading/",
    [#plain-raw("heading")],
  ))
#pause
- Notas a pie de página: `#footnote[...]`
#pause
- #hi-link("https://motherfuckingwebsite.com/", [Links]): `#link("<url>")[...]`,
  ) o `https://link.com`
#pause
- Comillas "inteligentes" (dependientes del idioma): `"`, `'`
#pause
- Símbolos: `~` (_nsbp_), `---`/`--` (raya/semiraya), #hi-link(
    "https://typst.app/docs/reference/symbols/sym/",
  )[#plain-raw("sym")], #hi-link(
    "https://typst.app/docs/reference/symbols/emoji/",
  )[#plain-raw("emoji")]

#focus-slide[
  #underline[Todo esto] son #link(
    "https://typst.app/docs/reference/foundations/function/#element-functions",
  )["funciones elementales"].

  `_caca_` #sym.eq.triple `#emph[caca]` #sym.eq.triple `#emph([caca])`

  #speaker-note([Mirad la documentación de cada función.])
]

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
  plain-raw("enum"),
)) o no enumeradas (#hi-link(
  "https://typst.app/docs/reference/model/list/",
  plain-raw("list"),
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
)[#plain-raw("label")]) con `<id>`.
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

#v(1fr)

Soporta #link("https://www.w3.org/TR/REC-png-961001")[PNG], #link(
  "https://jpeg.org/jpeg/",
)[JPG], #link("https://www.w3.org/Graphics/GIF/spec-gif87.txt")[GIF], #link(
  "https://www.w3.org/TR/SVG2/",
)[SVG]#footnote[Excepto #plain-raw("foreignObject"), ver #hi-link(
    "https://github.com/typst/typst/issues/1421",
  )[typst/typst\#1421].], #link(
  "https://pdfa.org/sponsored-standards/",
)[PDF]#footnote[A partir de la versión 0.14, ver #hi-link(
    "https://github.com/typst/typst/issues/145",
  )[typst/typst\#145].], y _raw bytes_.

#pause

```typ
#figure(
  image("img0.png", width: 80%),
  caption: [...]
) <fig:img0>
```

#pause

- La imagen siempre se incrusta donde especificas
  - Equivalente al `H` de #LaTeX
#pause
- Para hacerlas _inline_, usa `#box` en lugar de `#figure`.

#v(.6fr)

#pagebreak()

=== Generación de diagramas
Se recomienda trabajar con SVGs.

- #hi-link("https://www.drawio.com")[draw.io]: La vieja confiable\
#pause
- #hi-link("https://excalidraw.com/")[Excalidraw]: Un rollito más _cool_
#pause
- #hi-link("https://plantuml.com/")[PlantUML]: Lenguaje declarativo para #link(
    "https://www.omg.org/uml/",
  )[UML]
#pause
- #hi-link("https://cetz-package.github.io/")[CeTZ]: Puro Typst (para
  _tryhards_)

#warning[Si los SVG dan problemas#footnote[Ver #hi-link(
      "https://www.drawio.com/doc/faq/svg-export-text-problems",
    )[draw.io FAQ].], exportar como PDF, importar en #hi-link(
    "https://inkscape.org/",
  )[Inkscape], y re-exportar a SVG.]

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


== Otros

=== `grid`


=== `v` y `h`


=== `box`


== _Scripting_

// variables y funciones

// tipos

// estructuras de datos

// control de flujo

// ejemplos de generar tablas a partir de arrays



== Archivos
// import / include
// Rutas de archivos (--root)


