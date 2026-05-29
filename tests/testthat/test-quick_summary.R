test_that("returns correct summary statistics", {
  df <- data.frame(age = c(20, 25, 30), score = c(80, 90, 85))
  result <- quick_summary(df)

  expect_equal(result$Mean[result$Column == "age"], mean(c(20, 25, 30)))
  expect_equal(result$Min[result$Column == "score"], 80)
  expect_equal(result$Max[result$Column == "score"], 90)
})

test_that("correctly counts missing values", {
  df <- data.frame(age = c(20, NA, 30))
  result <- quick_summary(df)

  expect_equal(result$Missing_Values[result$Column == "age"], 1)
})

test_that("stops with an error when no numeric columns exist", {
  df <- data.frame(name = c("Alice", "Bob"), group = c("A", "B"))
  expect_error(quick_summary(df), "No numeric columns found in the data frame.")
})
