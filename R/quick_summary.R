quick_summary <- function(data) {
  checkmate::assert_data_frame(data)

  numeric_data <- data[, sapply(data, is.numeric), drop = FALSE]

  if (ncol(numeric_data) == 0) {
    stop("No numeric columns found in the data frame.")
  }

  summary_table <- data.frame(
    Column = names(numeric_data),
    Mean = sapply(numeric_data, mean, na.rm = TRUE),
    Median = sapply(numeric_data, median, na.rm = TRUE),
    SD = sapply(numeric_data, sd, na.rm = TRUE),
    Min = sapply(numeric_data, min, na.rm = TRUE),
    Max = sapply(numeric_data, max, na.rm = TRUE),
    Missing_Values = sapply(numeric_data, function(x) sum(is.na(x)))
  )

  return(summary_table)
}
