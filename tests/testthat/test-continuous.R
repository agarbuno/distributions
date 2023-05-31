context("continuous-variables")

x <- GaussianRandomVariable$new()
test_that("correct random numbers", {
  expect_equal(length(x$sample(1)), 1)
})
