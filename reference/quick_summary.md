# Generate Quick Summary Statistics for Numeric Columns

Produces a summary table for all numeric columns in a data frame,
including mean, median, standard deviation, min, max, and missing values

## Usage

``` r
quick_summary(data)
```

## Arguments

- data:

  A data frame

## Value

A data frame containing summary statistics for each numeric column

## Examples

``` r
df <- data.frame(
 age = c(20, 25, 30, NA),
 score = c(80, 90, 85, 88),
 group = c("A", "B", "A", "B")
 )
 quick_summary(df)
#>       Column  Mean Median       SD Min Max Missing_Values
#> age      age 25.00   25.0 5.000000  20  30              1
#> score  score 85.75   86.5 4.349329  80  90              0
```
