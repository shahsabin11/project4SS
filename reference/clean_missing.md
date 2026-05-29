# Clean Missing Values in a Data Frame

Handles missing values in a selected column using different strategies:
removal, mean, median, or mode imputation

## Usage

``` r
clean_missing(data, column, method = "mean")
```

## Arguments

- data:

  A data frame

- column:

  Name of the column to clean(string)

- method:

  Method for handling missing values: "remove", "mean", "median", or
  "mode"

## Value

A cleaned data frame with missing values handled

## Examples

``` r
df <- data.frame(age = c(20, NA, 30, 40))
clean_missing(df, "age", method = "mean")
#>   age
#> 1  20
#> 2  30
#> 3  30
#> 4  40
```
