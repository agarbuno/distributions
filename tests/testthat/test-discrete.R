context("discrete-variable")

x <- PoissonRandomVariable$new()
test_that("range-poisson", {
  expect_gte(x$sample(), 0)
})

x <- BinomialRandomVariable$new()
test_that("range-poisson", {
  expect_lte(x$sample(), 10)
})
