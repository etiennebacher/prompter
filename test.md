
``` r
library(prompter)
add_prompt(
  htmltools::p("some text"),
        message = "this is a plot, and I add some text to show the size of the box",
        position = "left", type = "error", 
        size = "medium", rounded = TRUE
      )
```

<!--html_preserve-->

<p class="hint--left hint--error hint--medium hint--rounded" aria-label="this is a plot, and I add some text to show the size of the box">

some text

</p>

<!--/html_preserve-->
