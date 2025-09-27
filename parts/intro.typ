#import "@preview/touying:0.6.1": *
#import themes.simple: *

#import "/utils.typ": *


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
- Defines reglas #sym.arrow programable
- Extremadamente útil para $e - c dot u^a = c_i sqrt(o) + n/e^s$
- Numeración y referencias automáticas #speaker-note([Bibliografías...])
- Paquetes (librerías) para hacer mil cosas

#pause

=== ...pero no da asco

- _Blazingly fast_ #emoji.rocket
- Sintaxis simple e intuitiva
- Lenguaje de _scripting_ moderno
- Herramientas modernas #speaker-note([Linters, LSPs, formatters, previewers,
    documentación.])



== Usar Typst

#v(1fr)

- *Online:* #hi-link("https://typst.app", [typst.app])
#pause
- *Terminal:* #hi-link(
    "https://github.com/typst/typst?tab=readme-ov-file#installation",
    [Typst CLI],
  )
  // - Linux
  //   - Arch, OpenSuse: `typst`
  //   - cargo: `typst-cli`
  // - Windows (winget)
  //     ```
  //     winget install --id Typst.Typst
  //     ```,
  // - MacOS (brew)
  //     ```
  //     brew install Typst
  //     ```,
#pause
- *IDEs:* #hi-link("https://myriad-dreamin.github.io/tinymist/", [Tinymist])
  #link("https://microsoft.github.io/language-server-protocol/", [LSP])
  - #link("https://code.visualstudio.com/", [VS Code]) (y sus 800 _forks_):
    #hi-link(
      "https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist",
      [Tinymist Typst],
    )
  - #link("https://www.jetbrains.com/ides/", [IntelliJ]): #hi-link(
      "https://plugins.jetbrains.com/plugin/27697-typst-support",
      [Typst Support],
    )
  - #link("https://neovim.io/", [Neovim]): #hi-link(
      "https://github.com/chomosuke/typst-preview.nvim",
      [typst-preview.nvim],
    )
  - #link("https://www.gnu.org/software/emacs/", [GNU Emacs]): #hi-link(
      "https://github.com/havarddj/typst-preview.el",
      [typst-preview.el],
    )
  - #link("https://zed.dev/", [Zed]): #hi-link(
      "https://zed.dev/extensions/typst",
      [Typst],
    )

#v(1fr)


#focus-slide[¡A instalar!]
