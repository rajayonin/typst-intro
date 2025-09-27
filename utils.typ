#import "@preview/metalogo:1.2.0": LaTeX, TeX
#import "@preview/touying:0.6.1": themes.simple
#import "@preview/gentle-clues:1.2.0": warning

#let primary-color = aqua.darken(50%)


// re-define warning
#let warning = warning.with(header-inset: .3em, content-inset: .9em)

// controls dark mode
#let dark-mode = state("dark-mode", false)

// re-define focus-slide to implement dark mode
#let focus-slide(body, ..params) = {
  simple.focus-slide(
    {
      dark-mode.update(true)
      body
      dark-mode.update(false)
    },
    ..params,
  )
}


/// Use the plain ol' `raw` instead of the custom one.
///
/// -> content
#let plain-raw(..params) = {
  show raw: it => { it.text }
  raw(..params)
}

// quick aliases
#let rawm = raw.with(lang: "typm")
#let rawc = raw.with(lang: "typc")


// default zebraw config
// #let zebraw = zebraw.with(numbering: false, lang: false)

/// Highlighted link.
///
/// - dest (str): The destination the link points to.
/// - body (content):
/// -> content
#let hi-link(dest, body) = {
  show link: set text(primary-color)
  link(dest, body)
}

/// Clears the header, to be used in the absence of a level 1 heading.
///
/// -> content
#let clear-header() = [
  =
]
