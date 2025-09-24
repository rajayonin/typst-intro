#import "@preview/touying:0.6.1": *
#import themes.simple: *

#import "/utils.typ": *


= _How to Typst_

== General
// comentarios

// saltos de línea


== Modos sintácticos

*Código* (#mono("#")): Permite usar directamente el lenguaje de _scripting_.
#zebraw(
  ```typ
  #let foo(n) = { n + 1 }
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



== _Scripting_

// tipos

// control de flujo

// variables y funciones



== Listas


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


== Archivos
// import / include
// Rutas de archivos (--root)


