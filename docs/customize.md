# Customization

## Permanent options

To have a consistent UI, you may want to apply the same options to all tooltips. This means that you have to type all options in every `add_prompt()`, which can lead to mistakes if you change some options later. The best way to apply the same options to all tooltips is to wrap `add_prompt()` in a custom function, as in the example below:

```r
library(prompter)
library(shiny)
library(ggplot2)
library(magrittr)

my_prompt <- function(el, message, ...) {
  add_prompt(el, message = message, position = "bottom",
             animate = TRUE, rounded = TRUE,
             shadow = FALSE, arrow = FALSE, ...)
}

ui <- fluidPage(
  
  # Load the dependencies
  use_prompt(),
  
  column(
    3, 
    # Put the element inside add_prompt()...
    my_prompt(
      actionButton("plot", "click"), 
      message = "this is a button"
    )
  ),
  column(
    9,
    # ... or use magrittr's pipe
    plotOutput("plot") %>% 
      my_prompt(
        message = "this is a plot, and I add some text to show the size of the box"
      )
  )
)

server <- function(input, output, session) {
  
  output$plot <- renderPlot(ggplot(mtcars, aes(wt, mpg))+ geom_point())
  
}

shinyApp(ui, server)
```

## Custom CSS

It is possible to override the CSS that is used through the argument `type` in `add_prompt()`. To do so, you can use the following type of rules:

```css
.hint--error:after {
  background-color: blue;
  text-shadow: 0 -1px 0px blue;
}
.hint--error.hint--bottom:before {
  border-bottom-color: blue
}
.hint--error.hint--left:before {
  border-left-color: blue
}
.hint--error.hint--top:before {
  border-top-color: blue
}
.hint--error.hint--right:before {
  border-right-color: blue
}
```
These rules will put a blue background for every tooltip with a type "error", whatever their position. Note that since there are 4 different types, you can only have 4 different colors for your tooltips in the same Shiny app.

<details>
  <summary>
    Click to see a full example
  </summary>
  <pre>
  
    library(prompter)
    library(shiny)
    
    ui <- fluidPage(
      
      use_prompt(),
      tags$head(
        tags$style(
          HTML(
            ".hint--error:after {
              background-color: blue;
              text-shadow: 0 -1px 0px blue;
            }
            .hint--error.hint--bottom:before {
              border-bottom-color: blue
            }
            .hint--error.hint--left:before {
              border-left-color: blue
            }
            .hint--error.hint--top:before {
              border-top-color: blue
            }
            .hint--error.hint--right:before {
              border-right-color: blue
            }"
          )
        )
      ),
      add_prompt(
        actionButton("plot", "click"), 
        position = "bottom", message = "this is a button", type = "error"
      )
    )
    
    server <- function(input, output, session) {}
    
    shinyApp(ui, server)

  </pre>
</details>


## Adapt to `bslib`

[`bslib`](https://rstudio.github.io/bslib/) is a package that allows to customize Shiny apps more easily, for example by adding Bootswatch theme or changing the version of Bootstrap (but there are much more functionalities). One may want to adapt the tooltips' colors to match the main theme. This can be done with CSS rules that are similar to those above, but the main difference is that we put `var(--*)` instead of `blue` (`*` must be replaced with the class we want). For instance, if one wants the tooltips' theme to match the buttons theme, one can do the following:

```r
library(prompter)
library(shiny)
library(ggplot2)
library(magrittr)
library(bslib)

ui <- fluidPage(
  theme = bslib::bs_theme(version = 4, bootswatch = "lumen"),
  use_prompt(),
  tags$head(
    tags$style(
      HTML(
        ".hint--info:after {
          background-color: var(--info);
          text-shadow: 0 -1px 0px var(--info);
        }
        .hint--info.hint--bottom:before {
          border-bottom-color: var(--info)
        }
        .hint--info.hint--left:before {
          border-left-color: var(--info)
        }
        .hint--info.hint--top:before {
          border-top-color: var(--info)
        }
        .hint--info.hint--right:before {
          border-right-color: var(--info)
        }"
      )
    )
  ),
  br(),
  actionButton(
    "bs4_color_info",
    "bs4_color_info",
    class="btn-info",
    style = "color: white"
  ),
  column(
    9,
    br(),
    plotOutput("plot") %>% 
      add_prompt(
        message = "The color is the same as the one of bs4_color_info button",
        position = "top", 
        type = "info", 
        size = "medium", 
        rounded = TRUE
      )
  )
)

server <- function(input, output, session) {
  output$plot <- renderPlot(ggplot(mtcars, aes(wt, mpg))+ geom_point())
}

shinyApp(ui, server)

```

Note that I put `var(--info)` in the CSS rules to match the `actionButton` that has the class `"btn-info"`. 

<Note>

If you set `version = 5` in `bs_theme()`, you need to use `var(--bs-info)` instead of `var(--info)`, `var(--bs-success)` instead of `var(--success)`, etc. 

</Note>
