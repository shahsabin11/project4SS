#' Generate Quick Summary Statistics for Numeric Columns
#'
#' Produces a summary table for all numeric columns in a data frame,
#' including mean, median, standard deviation, min, max, and missing values
#'
#' @param data A data frame
#'
#' @returns A data frame containing summary statistics for each numeric column
#'
#' @examples
#' df <- data.frame(
#'  age = c(20, 25, 30, NA),
#'  score = c(80, 90, 85, 88),
#'  group = c("A", "B", "A", "B")
#'  )
#'  quick_summary(df)
#'
#' @export
quick_summary <- function(data) {
  checkmate::assert_data_frame(data)
  numeric_data <- data[, sapply(data, is.numeric), drop = FALSE]

  if (ncol(numeric_data) == 0) {
    stop("No numeric columns found in the data frame.")
  }

  summary_table <- data.frame(
    Column = names(numeric_data),
    Mean = sapply(numeric_data, mean, na.rm = TRUE),
    Median = sapply(numeric_data, stats::median, na.rm = TRUE),
    SD = sapply(numeric_data, stats::sd, na.rm = TRUE),
    Min = sapply(numeric_data, min, na.rm = TRUE),
    Max = sapply(numeric_data, max, na.rm = TRUE),
    Missing_Values = sapply(numeric_data, function(x) sum(is.na(x)))  # fixed
  )

  return(summary_table)
}
