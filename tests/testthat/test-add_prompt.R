test_that("add_prompt embeds the ui_element in a new div", {

  x <- shiny::actionButton("test", "test")
  y <- add_prompt(x, message = "foo")

  expect_equal(
    as.character(y),
    '<button aria-label="foo" class="btn btn-default action-button hint--bottom" id="test" type="button">test</button>'
  )

})

test_that("add_prompt needs a message", {

  x <- shiny::actionButton("test", "test")
  expect_error(add_prompt(x))

})

test_that("options are in the right form", {

  x <- shiny::actionButton("test", "test")
  y <- add_prompt(x, message = "foo", bounce = TRUE, animate = FALSE)

  expect_equal(
    as.character(y),
    '<button aria-label="foo" class="btn btn-default action-button hint--bottom hint--bounce hint--no-animate" id="test" type="button">test</button>'
  )

})
