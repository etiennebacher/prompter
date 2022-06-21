# Misc

## Other frameworks

`prompter` also works with other frameworks, such as `shiny.fluent` (which uses Microsoft Fluent UI under the hood) and `shiny.semantic` (which uses Fomantic UI):

* `shiny.fluent`

```r
library(shiny)
library(shiny.fluent)
library(prompter)

shinyApp(
  ui = div(
    use_prompt(),
    ActionButton("button") |> 
      add_prompt(message = "Hello there")
  ),
  server = function(input, output) {}
)
```

* `shiny.semantic`

```r
library(shiny)
library(shiny.semantic)
library(prompter)

ui <- semanticPage(
  use_prompt(),
  div(class = "ui raised segment",
      div(
        a(class="ui green ribbon label", "Link"),
        p("Lorem ipsum, lorem ipsum, lorem ipsum"),
        actionButton("button", "Hover me") |> 
          add_prompt(message = "Hello there")
      )
  )
)

server <- function(input, output, session) {}

shinyApp(ui, server)
```
