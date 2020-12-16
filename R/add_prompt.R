add_prompt <- function(ui_element, position = "bottom", type = NULL, message = NULL) {

  if (missing(message)) {
    stop("Must pass a message")
  }

  htmltools::tags$div(

    class = paste(
      "hint--",
      c(position, type),
      collapse = " ", sep = ""
    ),

    `aria-label` = message,

    ui_element
  )

}
