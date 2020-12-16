.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath(
    "hint-assets",
    system.file("hint", package = "prompter")
  )
}
