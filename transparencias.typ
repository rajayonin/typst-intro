#import "@preview/touying:0.6.1": *
#import themes.simple: *

#import "@preview/numbly:0.1.0": numbly
#import "@preview/metalogo:1.2.0": LaTeX
#import "@preview/zebraw:0.5.5": zebraw

#set text(lang: "es")

#let title = [Memorias de p\*\*\*\* madre]

#let mono(text) = {
  h(0.3em)
  box(
    fill: color.rgb("#f5f5f5"),
    outset: 0.3em,
    radius: 0.3em,
    raw(text),
  )
}

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


#let hi-link(dest, body) = {
  show link: set text(blue)
  link(dest, body)
}

// TODO: QR (see tiaoma)

#components.adaptive-columns(outline(indent: 1em, depth: 2))


= Introducción

#focus-slide[

  #set align(left)
  #quote(attribution: [Yo], block: true)[
    Typst es como #LaTeX, pero no da asco.
  ]

]



=== Como #LaTeX...
- Archivos de texto plano #speaker-note([Bueno para Git, y para
    reproductibilidad])
- Defines reglas #sym.arrow plantillas
- Extremadamente útil para $e - c dot u^a = c_i sqrt(o) + n/e^s$
- Numeración y referencias automáticas #speaker-note([Bibliografías...])

#pause

=== ...pero no da asco

- _Blazingly fast_ #emoji.rocket
- Sintaxis simple e intuitiva
- Lenguaje de _scripting_ moderno
- Herramientas modernas #speaker-note([Linters, LSPs, formatters, previewers,
    documentación.])


== Cómo usar Typst
- *Online:* #hi-link("https://typst.app", [typst.app])
#pause
- *Terminal:* #hi-link(
    "https://github.com/typst/typst?tab=readme-ov-file#installation",
    [Typst CLI],
  )
// - Linux
//   - Arch, OpenSuse: #mono("typst")
//   - cargo: #mono("typst-cli")
// - Windows (winget)
//   #zebraw(
//     numbering: false,
//     ```
//     winget install --id Typst.Typst
//     ```,
//   )
// - MacOS (brew)
//   #zebraw(
//     numbering: false,
//     ```
//     brew install Typst
//     ```,
//   )
#pause
- *IDEs:*
  - #link("https://code.visualstudio.com/", [VS Code]): #hi-link(
      "https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist",
      [Tinymist Typst],
    )
  - #link("https://microsoft.github.io/language-server-protocol/", [LSP]):
    #hi-link("https://myriad-dreamin.github.io/tinymist/", [Tinymist])
  - #link("https://neovim.io/", [Neovim]): #hi-link(
      "https://github.com/chomosuke/typst-preview.nvim",
      [typst-preview.nvim],
    )
  - #link("https://www.gnu.org/software/emacs/", [GNU Emacs]): #hi-link(
      "https://github.com/havarddj/typst-preview.el",
      [typst-preview.el],
    )
