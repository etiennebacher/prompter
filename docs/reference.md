# Reference 

## Add prompt

### Description

Add a tooltip for a specific element

### Usage

    add_prompt(
      ui_element,
      position = "bottom",
      message = NULL,
      type = NULL,
      size = NULL,
      permanent = FALSE,
      rounded = FALSE,
      animate = TRUE,
      bounce = FALSE,
      arrow = TRUE,
      shadow = TRUE
    )

### Arguments

<table data-summary="R argblock">
<tbody>
<tr class="odd" data-valign="top">
<td><code>ui_element</code></td>
<td><p>Element on which a tooltip will be added.</p></td>
</tr>
<tr class="even" data-valign="top">
<td><code>position</code></td>
<td><p>Position of the tooltip. Can be 'bottom', 'bottom-left', 'bottom-right', 'left', 'right', 'top', 'top-left', 'top-right'. Default is 'bottom'.</p></td>
</tr>
<tr class="odd" data-valign="top">
<td><code>message</code></td>
<td><p>Message to include in the tooltip. This argument is mandatory.</p></td>
</tr>
<tr class="even" data-valign="top">
<td><code>type</code></td>
<td><p>Type of the tooltip. Can be 'NULL' (default), 'error', 'warning', 'info', 'success'.</p></td>
</tr>
<tr class="odd" data-valign="top">
<td><code>size</code></td>
<td><p>Size of the tooltip. Can be 'NULL' (default), 'small', 'medium', 'large'.</p></td>
</tr>
<tr class="even" data-valign="top">
<td><code>permanent</code></td>
<td><p>Boolean indicating whether the tooltip should be visible permanently (or at the contrary only when hovering the element). Default is 'FALSE'.</p></td>
</tr>
<tr class="odd" data-valign="top">
<td><code>rounded</code></td>
<td><p>Boolean indicating whether the corners of the tooltip should be rounded. Default is 'FALSE'.</p></td>
</tr>
<tr class="even" data-valign="top">
<td><code>animate</code></td>
<td><p>Boolean indicating whether there is a small animation when the tooltip appears. Default is 'TRUE'.</p></td>
</tr>
<tr class="odd" data-valign="top">
<td><code>bounce</code></td>
<td><p>Boolean indicating whether there is a small boucing animation when the tooltip appears. Default is 'FALSE'.</p></td>
</tr>
<tr class="even" data-valign="top">
<td><code>arrow</code></td>
<td><p>Boolean indicating whether there is an arrow on the tooltip. Default is 'TRUE'.</p></td>
</tr>
<tr class="odd" data-valign="top">
<td><code>shadow</code></td>
<td><p>Boolean indicating whether there should be a shadow effect. Default is 'TRUE'.</p></td>
</tr>
</tbody>
</table>

### Value

A tooltip when hovering the element concerned.

### Examples

```r
if (interactive()) {
library(shiny)

ui <- fluidPage(

  use_prompt(),

  add_prompt(
tableOutput("table"),
position = "bottom", type = "warning",
message = "this is a table", permanent = FALSE,
rounded = TRUE, animate = FALSE
  )

  # also works with magrittr's pipe
  # tableOutput("table") %>%
  #   add_prompt(
  # position = "bottom", type = "warning",
  # message = "this is a button", permanent = FALSE,
  # rounded = TRUE, animate = FALSE
  #   )
)

server <- function(input, output, session) {

  output$table <- renderTable(head(mtcars))

}

shinyApp(ui, server)
}
```


---
## Use prompt

### Description

Load hint.css dependencies

### Usage

    use_prompt()

### Value

Include dependencies of Hint.css


---
