test_that("zzz doesn't produce anything in workspace or console", {
  expect_silent(.onLoad())
})
