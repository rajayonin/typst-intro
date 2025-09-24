#import "@preview/metalogo:1.2.0": LaTeX
#import "@preview/zebraw:0.5.5": zebraw

#let primary-color = aqua.darken(50%)

/// GFM-like monospace text.
///
/// - text (content, str): Text to format.
/// -> content
#let mono(text) = [
  #h(0.5em, weak: true)
  #box(
    fill: color.rgb("#f5f5f5"),
    outset: 0.3em,
    radius: 0.3em,
    raw(text),
  )
  #h(0.5em, weak: true)
]


// default zebraw config
#let zebraw = zebraw.with(numbering: false, lang: false)

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
