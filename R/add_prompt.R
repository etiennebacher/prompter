#' Add a tooltip for a specific element
#'
#' @param ui_element Element on which a tooltip will be added.
#' @param position Position of the tooltip. Can be `bottom`, `bottom-left`, `bottom-right`, `left`, `right`, `top`, `top-left`, `top-right`. Default is `bottom`.
#' @param message Message to include in the tooltip. This argument is mandatory.
#' @param type Type of the tooltip. Can be `NULL` (default), `error`, `warning`, `info`, `success`.
#' @param size Size of the tooltip. Can be `NULL` (default), `small`, `medium`, `large`.
#' @param permanent Boolean indicating whether the tooltip should be visible permanently (or at the contrary only when hovering the element). Default is `FALSE`.
#' @param rounded Boolean indicating whether the corners of the tooltip should be rounded. Default is `FALSE`.
#' @param animate Boolean indicating whether there is a small animation when the tooltip appears. Default is `TRUE`.
#' @param bounce Boolean indicating whether there is a small boucing animation when the tooltip appears. Default is `FALSE`.
#'
#' @return
#' @export
#'
#' @examples
#' if (interactive()) {
#' library(shiny)
#'
#' ui <- fluidPage(
#'
#'   use_prompt(),
#'
#'   add_prompt(
#'     tableOutput("table"),
#'     position = "bottom", type = "warning",
#'     message = "this is a table", permanent = FALSE,
#'     rounded = TRUE, animate = FALSE
#'   )
#'
#'   # also works with magrittr's pipe
#'   # tableOutput("table") %>%
#'   #   add_prompt(
#'   #     position = "bottom", type = "warning",
#'   #     message = "this is a button", permanent = FALSE,
#'   #     rounded = TRUE, animate = FALSE
#'   #   )
#' )
#'
#' server <- function(input, output, session) {
#'
#'   output$table <- renderTable(head(mtcars))
#'
#' }
#'
#' shinyApp(ui, server)
#' }

add_prompt <- function(ui_element, position = "bottom", message = NULL, type = NULL, size = NULL, permanent = FALSE, rounded = FALSE, animate = TRUE, bounce = FALSE) {

  if (missing(message)) {
    stop("Must pass a message")
  }

  # if option is TRUE, then keep the option name
  opts <- lapply(c("permanent", "rounded", "bounce"), function(x) {
    y <- eval(parse(text = x))
    if (isTRUE(y)) {
      x <- paste(x)
    } else {
      x <- NULL
    }
  })

  # better to put "animate" than "no-animate" in the function call
  # so logic is reverted compared to the one above
  if (isTRUE(animate)) {
    animate <- NULL
  } else {
    animate <- "no-animate"
  }

  opts <- c(unlist(opts), animate)

  htmltools::tags$div(
    class = paste(
      "hint--",
      c(position, type, size, opts),
      collapse = " ", sep = ""
    ),
    `aria-label` = message,
    ui_element
  )

}
