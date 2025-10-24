#import "@preview/touying:0.6.1": *
#import themes.simple: *


#import "/utils.typ": *


= _How to Typst_


== Modos sintácticos

#v(1fr)

*Código* (`#`): Permite usar directamente el lenguaje de _scripting_.
```typ
#let foo(n) = { n + 1 }
```
```typ
Tengo #foo(68) Labubus.
```

#v(1em)

#pause

*_Markup_* (`[..]`): Modo por defecto, _WYSIWYG_.
#speaker-note([_What You See Is What You Get_, básicamente markdown])

```typ
Typst es _blazingly fast_! 🚀
```

```typc
let cool-os = [*Linux!* 🐧]
```

#v(1fr)

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
El peso de tus madres se calcula con $lim_(x -> 0) 1/x$
#let peso(_madre) = { sym.infinity }
#for i in range(2) [
  Tu madre #i pesa #peso(i) kg.
]
```


== Formato de texto

#v(-.4em)

- Comentarios con `//` o `/* */`
#pause
- Caracteres especiales (`\\`, `#`, `$`, `_`, `*`) se escapan con `\\`
#pause
- #strong(text(black)[Negrita]): `*...*` (#mod(
    "reference/model",
    "strong",
  ))
- _Cursiva_: `_..._` (#mod(
    "reference/model",
    "emph",
  ))
- `Monoespaciado`: #raw("`...`") o #raw("```") (bloques de código) (#mod(
    "reference/model",
    "raw",
  )- #underline[Subrayado]: `#underline[...]`
// - #strike[Tachado]: `#strike[...]`
#pause
- `= Capítulo`, `== Sección`, `=== Subsección` (#mod(
    "reference/model",
    "heading",
  ))
#pause
- Notas a pie de página: `#footnote[...]`
#pause
- #hi-link("https://motherfuckingwebsite.com/", [Links]): `#link("<url>")[...]`,
  ) o `https://link.com`
#pause
- Comillas "inteligentes" (dependientes del idioma): `"`, `'`
#pause
- Símbolos: `~` (_nsbp_), `---`/`--` (raya/semiraya), #mod(
    "reference/symbols",
    "sym",
  ) #mod("reference/symbols", "emoji")

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

#two-col[
  ```typ
  Esta línea no
  la rompe ni Dios.
  ```
][
  #v(.7em)
  Esta línea no la rompe ni Dios.
]

#two-col[
  ```typ
  Esta la rompo yo\
  porque me da la gana.
  ```
][
  Esta la rompo yo\
  porque me da la gana.
]


== Listas
Enumeradas (#mod("reference/model", "enum")) o no enumeradas (#mod(
  "reference/model",
  "list",
)).

#two-col[
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
  + Primero
  + Segundo
  - Uno
  - Otro
]

#pause

Y se pueden anidar:

#two-col[
  ```typ
  + Primero
    - Primero uno
    - Luego otro
  + Segundo
  ```
][
  #set list(indent: 0pt, spacing: auto)
  #set enum(indent: 0pt, spacing: auto)
  + Primero
    - Primero uno
    - Luego otro
  + Segundo
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
)[PDF]#footnote[A partir de la versión 0.14.], y _raw bytes_.

#pause

```typ
#figure(
  image("img0.png", width: 80%),
  caption: [...]
) <fig:img0> // label
```

#pause

- La imagen siempre se incrusta donde especificas
  - Equivalente al `H` de #LaTeX
#pause
- Para hacerlas _inline_, usa `#box` en lugar de `#figure`.
#pause
- Puedes escalarlas con #fn("reference/layout", "scale"), e.g. #rawc(
    "scale(50%, image(...))",
  )

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
- #hi-link("https://cetz-package.github.io/")[CeTZ]/#hi-link(
    "https://typst.app/universe/package/fletcher",
  )[fletcher]: Puro Typst (para _tryhards_)

#pause

#warning[Si los SVG dan problemas#footnote[Ver #hi-link(
      "https://www.drawio.com/doc/faq/svg-export-text-problems",
    )[draw.io FAQ].], exportar como PDF, importar en #hi-link(
    "https://inkscape.org/",
  )[Inkscape], y re-exportar a SVG.]



== Tablas

Echadle un vistazo a la #hi-link(
  "https://typst.app/docs/guides/table-guide/",
)[guía de tablas].

También podéis usar un #hi-link(
  "https://www.latex-tables.com/?format=typst",
)[generador de tablas].

#pause

```typ
#figure(
  table(
    columns: 2, // o `(1fr, 1fr)`
    align: horizon, // o `auto` o `(left, right)`
    [Fila 0, Columna 0], [Fila 0, Columna 1],
    [Fila 1, Columna 0], [Fila 1, Columna 1],
  ),
  caption: [...]
) <tab:example>
```

#pause

Veremos más adelante cómo hacer magia con esto...



== Ecuaciones
Sintaxis _similar_ a #LaTeX#footnote[#hi-link(
  "https://qwinsi.github.io/tex2typst-webapp",
)[Conversor de fórmulas de LaTeX a Typst.]], pero con menos `\`.

- Echadle un vistazo al #hi-link(
    "https://sitandr.github.io/typst-examples-book/book/basics/math/",
  )[capítulo en Typst Examples Book]
- Hay herramientas interactivas como #hi-link("https://typerino.com/")[Typerino]
  para crearlas

// #link("https://qwinsi.github.io/tex2typst-webapp/cheat-sheet.html")[Chuleta para
//   fórmulas]

TL;DR:
- $x^(2y)$ con #rawm("x^(2y)"), $x_(2y)$ con #rawm("x_(2y)")
- $"texto"$ con #rawm("\"texto\""), $x y$ con #rawm("x y"), $italic("caca")$ con
  #rawm("italic(\"caca\")")
- $(2a)/b$ con #rawm("(2a)/b"), $(a + b)$ con #rawm("(a + b)")
- $->$ con #rawm("->"), $<=$ con #rawm("<="), $!=$ con #rawm("!=")
- $forall$ con #rawm("forall") ó `∀`, $alpha$ con #rawm("alpha"), $Omega$ con
  #rawm("Omega"), $NN$ con #rawm("NN") (ver #mod("reference/symbols", "sym"))


== Referencias
Primero se crea una marca (#mod("reference/foundations", "label")) con `<id>`.
// - Para las referencias bibliográficas, esto no es necesario

#pause

Para referenciarla, basta con usar `@id`
- Dependiendo de lo que hayas marcado (sección, figura, ecuación, etc.), se
  pondrá un texto automáticamente
- Puedes especificar el texto (suplemento) con `@id[...]`

#pause

#v(1fr)

#two-col[
  ```typ
  === Introducción <intro>
  En la @intro...
  ```
][
  #set heading(numbering: "1.")
  #counter(heading).update((6, 9))
  #show heading: set text(size: 25pt)

  === Introducción <intro>
  En la @intro...
]

#two-col[
  ```typ
  $ pi = e = 3 $ <real>
  El @real[Teorema]...
  ```
][
  #set math.equation(numbering: "(1)")
  #show heading: set text(size: 26pt)

  $ pi = e = 3 $ <real>
  #v(-.5em)
  El @real[Teorema]...
]

#v(1fr)


#pagebreak()

=== Bibliografía

#v(1fr)

Las bibliografías se gestionan con #hi-link(
  "https://github.com/plk/biblatex",
)[Bib#LaTeX] o #hi-link(
  "https://github.com/typst/hayagriva/blob/main/docs/file-format.md",
)[Hayagriva].
- Entradas en un archivo `.bib`/`.yml`, con un ID y atributos#footnote[Más
    información sobre Bib#TeX/Bib#LaTeX en la #hi-link(
      "https://bibtex.eu/types/",
    )[documentación de CiteDrive].]
- Es recomendable añadir el #hi-link(
    "https://www.doi.org/the-identifier/what-is-a-doi/",
  )[DOI] siempre que se pueda
- Se referencian con `@entry-id` o, con suplemento, `@entry-id[suplemento]`
  (#mod("reference/model", "cite"))


#pause
#v(.5em)
Se imprime con:
#v(-.5em)
```typ
#bibliography("references.bib", style: "ieee")
```
#v(1fr)



== _Scripting_

#speaker-note([Por aquí vamos a pasar rápido...])

#[
  #show raw.where(block: false): set raw(lang: "typc")

  // intro, expresiones, bloques, y  operadores
  Formado por _expresiones_ que se evalúan.

  #pause

  === Variables
  - Se declaran con `let`#footnote[No es necesario definirlas en la declaración,
      e.g. #rawc("let foo")]
  - Se pueden redeclarar y redefinir

  #pause

  === Bloques
  Existen bloques de código (`{..}`) y bloques de contenido (`[..]`)
  #pause
  - Generan un nuevo _scope_#footnote[Siempre puedes acceder al _scope_ padre,
      pero el hijo sobreescribe]
  #pause
  - Ambos se pueden anidar y usar indistintamente
    ```typ
    #let foo = [Pepe#{42 * 10}]  // [Pepe420]
    ```

  === Tipos
  Todos tienen _constructor_, e.g. `str(1)` y _métodos_
  // #footnote[Hay metodos
  //   puros, los cuales no modifican el valor devuelven una copia, y no puros],
  e.g. `"a".len()`

  #pause

  #let type(type) = mod("reference/foundations", type)
  - #type("content"): Todo lo que se ve en el documento
  - #type("str") (`"hola"`), #type("int") (`5`), #type("float") (`4.20`), #type(
      "bool",
    ) (`true`), #type("none")
  - #type("array") (`(1, "patata)`), #type("dictionary") (`(caca: "culo")`)

  #pause

  === Operadores
  - Asignación: `=`, `+=`, `-=`, `*=`, `/=`
  - Aritméticos: `+`, `-`, `*`, `/`
  - Relacionales: `==`, `!=`, `<`, `>`, `<=`, `>=`
  - Lógicos: `and`, `or`, `not`
  - Pertenencia: `in`, `not in`
  Para el resto de operaciones, ver módulo #mod(
    "reference/foundations",
    "calc",
  ).


  === Destructurado
  Esto funciona en todos lados, funciones, etc.
  ```typc
  let (x, y) = (0, 1)           // x = 0, y = 1
  ```
  ```typc
  let (_, y, _) = (0, 1, 2)     // y = 1
  ```
  ```typc
  let (a, .., b) = (0, 1, 2, 3) // a = 0, b = 3
  ```
  ```typc
  let (x, ..rest) = (0, 1, 2)   // x = 0, rest = (1, 2)
  ```
  // ```typc
  // let os = (lin: "good", win: "bad", mac: "meh")
  // let (lin,) = os          // lin = "good"
  // let (win: rating,) = os  // rating = "bad"
  // ```


  #pause

  === Control de flujo
  `if`, `else if`, `else` -- la expresión debe evaluar a #plain-raw("bool")
  ```typc
  if a < 0 [ negativo ]
  else if a == 0 [ zero ]
  else { calc.sqrt(a) }
  ```

  === Bucles
  `while condition {..}`

  #pause
  #v(-.3em)

  `for` -- "ranged for":
  - `for value in array-or-str {..}`
  - `for (key, value) in dict {..}`

  #pause

  También existen `break` y `continue`.

  #pause
  #v(-.3em)

  === Funciones
  Son *puras*, es decir, los parámetros de entrada se pasan por copia.
  // #footnote[Recordad que podemos desestructurar]
  #pause
  - Nombradas: `let foo(x) = {..}`
  - _Inline_ (_lambdas_): `(x) => {..}`

  #pause
  #v(-.2em)

  Parámetros o *posicionales* (requeridos) o *nombrados* (opcionales)
  ```typc
  let foo(a, b: 1) = { a + b }
  foo(1, b: 2)
  ```

  === Ejemplos chulos
  Generar tablas a partir de CSVs:
  ```typ
  #table(
    columns: 2,
    ..for (.., NIA, nota) in csv("alumnos.csv") {
      (NIA, nota)
    }
  )
  ```

  #pause

  Subfiguras:
  ```typ
  #import "@preview/subpar:0.2.2"
  #subpar.grid(
    columns: 2,
    [#figure(...)], [#figure(...)]
  )
  ```


  === Otras funciones
  #v(1fr)
  Os recomiendo echarles un vistazo a estas:
  - #fn("reference/layout", "v") y #fn("reference/layout", "h")
  - #fn("reference/layout", "pagebreak"), #fn("reference/model", "parbreak"),
    #fn("reference/model", "linebreak")
  - #fn("reference/layout", "box")
  - #fn("reference/layout", "align")

  #pause
  #v(.5fr)

  Mirad documentación de #fn("reference/foundations", "array"), #fn(
    "reference/foundations",
    "dictionary",
  ).

  #v(1fr)
]



== Módulos
Puedes separar tus proyectos en archivos `.typ`.

// import / include
- `#include "file.typ"` _inserta_ el contenido del archivo
#pause
- `#import "file.typ"` _importa_ el módulo `file`
  #pause
  - `#import "file.typ" as foo`: renombra el módulo
  - `#import "file.typ": foo, bar`: importa variables/funciones específicas
  - `#import "file.typ": *`: lo importa tó

// Rutas de archivos
Importante tener en cuenta los _path_:
- Son relativos al archivo donde se usan
- `/` (_root_) es el *directorio del archivo que compilamos*
  - Se puede cambiar _root_ en la configuración (`--root`)


