context("continuous-variables")

x <- GaussianRandomVariable$new()
test_that("correct random numbers", {
  expect_equal(length(x$sample(1)), 1)
})

test_that("correct array of random numbers", {
  expect_equal(x$sample(1, 5) |> dim() |> prod(), 5)
})
