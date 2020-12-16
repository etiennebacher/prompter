#' Load hint.css dependencies
#'
#' @return Include dependencies of hint.css
#' @export
#'
#' @examples
use_prompt <- function() {
  shiny::singleton(
    shiny::tags$head(
      shiny::tags$link(
        href = "hint-assets/hint.min.css",
        rel= "stylesheet",
        type= "text/css"
      )
    )
  )
}
