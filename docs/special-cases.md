# Special cases

## Add a tooltip on icons

To add a tooltip on a single icon, you need to wrap the icon in `tags$span()`. Here is a small example:

```r
library(prompter)
library(shiny)
 
ui <- fluidPage(
   use_prompt(),
   fluidRow(
     column(2),
     tags$span(icon("trash"), style = "font-size: 50px") |>
       add_prompt(message = "hello, this is an icon")
   )
)
 
server <- function(input, output, session) {}
 
shinyApp(ui, server)

```

## Break lines

If you want to have several paragraphs, you can use `\n` in the text of the tooltip and add the following CSS in your app:
```css
[class*=hint--][aria-label]:after {
   white-space: pre;
}
```
Here's a small example:
```r
library(prompter)
library(shiny)

ui <- fluidPage(
  use_prompt(),
  tags$head(
    tags$style(
      HTML("[class*=hint--][aria-label]:after {
   white-space: pre;
}")
    )
  ),
  fluidRow(
    column(3),
    actionButton("mybutton", "Hover me") |>
      add_prompt(message = "Hello I have a very long text to display and I want to have several paragraphs. \n\nThis is the second paragraph."),
  )
)

server <- function(input, output, session) {}

shinyApp(ui, server)
```
