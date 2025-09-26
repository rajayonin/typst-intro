#import "@preview/metalogo:1.2.0": LaTeX

#let primary-color = aqua.darken(50%)


/// Use the base `raw` instead of the custom one.
///
/// -> content
#let old-raw(..params) = {
  show raw: it => { it.text }
  raw(..params)
}

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
