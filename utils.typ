#import "@preview/metalogo:1.2.0": LaTeX, TeX
#import "@preview/touying:0.6.1": themes.simple
#import "@preview/gentle-clues:1.2.0": warning
#import "@preview/oxifmt:1.0.0": strfmt


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


/// Mentions a Typst function, with link to docs.
///
/// - path (str): Path in the documentation URL
/// - name (str): Function name
/// ->
#let fn(path, name) = {
  assert(not path.ends-with("/"))
  assert(not path.starts-with("/"))
  assert(not name.ends-with("/"))
  assert(not name.starts-with("/"))

  link(strfmt("https://typst.app/docs/{}/{}", path, name), rawc(name))
}

/// Mentions a Typst module, with link to docs.
///
/// - path (str): Path in the documentation URL
/// - name (str): Modulw name
/// ->
#let mod(path, name) = {
  assert(not path.ends-with("/"))
  assert(not path.starts-with("/"))
  assert(not name.ends-with("/"))
  assert(not name.starts-with("/"))

  hi-link(strfmt("https://typst.app/docs/{}/{}", path, name), plain-raw(name))
}
