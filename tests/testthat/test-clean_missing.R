test_that("method = 'mean' replaces NAs with column mean", {
  df <- data.frame(age = c(20, NA, 30, 40))
  result <- clean_missing(df, "age", method = "mean")

  expect_false(anyNA(result$age))
  expect_equal(result$age[2], mean(c(20, 30, 40)))
})

test_that("method = 'remove' drops rows with NA", {
  df <- data.frame(age = c(20, NA, 30), name = c("Alice", "Bob", "Charlie"))
  result <- clean_missing(df, "age", method = "remove")

  expect_equal(nrow(result), 2)
  expect_false(anyNA(result$age))
})

test_that("stops with an error for a non-existent column", {
  df <- data.frame(age = c(20, NA, 30))
  expect_error(
    clean_missing(df, "height", method = "mean"),
    "Column does not exist in the data frame."
  )
})
