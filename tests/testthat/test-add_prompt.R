test_that("add_prompt adds info as attributes of the element if not an image", {

  x <- shiny::actionButton("test", "test")
  y <- add_prompt(x, message = "foo")

  expect_equal(
    as.character(y),
    '<button aria-label="foo" class="btn btn-default action-button hint--bottom" id="test" type="button">test</button>'
  )

})

test_that("add_prompt embeds the element in a new div if element is an image", {

  x <- shiny::img(src = "https://placeimg.com/200/150/nature")
  y <- add_prompt(x, message = "foo")

  expect_equal(
    as.character(y),
    '<div class=\"hint--bottom\" aria-label=\"foo\">\n  <img src=\"https://placeimg.com/200/150/nature\"/>\n</div>'
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
