test_that("correctly joins two data frames", {
  df1 <- data.frame(id = c(1, 2, 3), name = c("A", "B", "C"))
  df2 <- data.frame(id = c(1, 2, 3), score = c(90, 85, 70))
  result <- safe_join(df1, df2, by = "id")

  expect_equal(nrow(result), 3)
  expect_true("score" %in% names(result))
})

test_that("warns when df1 has unmatched rows", {
  df1 <- data.frame(id = c(1, 2, 3), name = c("A", "B", "C"))
  df2 <- data.frame(id = c(1, 2), score = c(90, 85))

  expect_warning(safe_join(df1, df2, by = "id"), "1 row(s) in df1 have no match in df2", fixed = TRUE)
})

test_that("stops with an error when join column is missing", {
  df1 <- data.frame(id = c(1, 2), name = c("A", "B"))
  df2 <- data.frame(score = c(90, 85))

  expect_error(safe_join(df1, df2, by = "id"), "Join column not found in second data frame.")
})
