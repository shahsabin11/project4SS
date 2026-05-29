#' Clean Missing Values in a Data Frame
#'
#' Handles missing values in a selected column using different strategies:
#' removal, mean, median, or mode imputation
#'
#' @param data A data frame
#' @param column Name of the column to clean(string)
#' @param method Method for handling missing values:
#' "remove", "mean", "median", or "mode"
#'
#' @returns A cleaned data frame with missing values handled
#'
#' @examples
#' df <- data.frame(age = c(20, NA, 30, 40))
#' clean_missing(df, "age", method = "mean")
#' @importFrom stats median na.omit
#' @export
#'
#'
clean_missing <- function(data, column, method = "mean") {
  checkmate::assert_data_frame(data)
  checkmate::assert_string(column)
  checkmate::assert_choice(method, c("remove", "mean", "median", "mode"))

  if (!(column %in% names(data))) {
    stop("Column does not exist in the data frame.")
  }

  if (method == "remove") {
    data <- data[!is.na(data[[column]]), , drop = FALSE]
  }
  if (method == "mean") {
    checkmate::assert_numeric(data[[column]])
    replacement <- mean(data[[column]], na.rm = TRUE)
    data[[column]][is.na(data[[column]])] <- replacement
  }
  if (method == "median") {
    checkmate::assert_numeric(data[[column]])
    replacement <- median(data[[column]], na.rm = TRUE)
    data[[column]][is.na(data[[column]])] <- replacement
  }
  if (method == "mode") {
    values <- na.omit(data[[column]])
    replacement <- names(sort(table(values), decreasing = TRUE))[1]
    data[[column]][is.na(data[[column]])] <- replacement
  }

  return(data)
}
