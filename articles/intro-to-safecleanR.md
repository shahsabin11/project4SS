# Introduction to SafeCleanR

``` r
library(safecleanr)
```

## Introduction

The `SafeCleanR` package contains simple tools for: - cleaning missing
values, - joining datasets, - creating summary statistics.

## Example Dataset

``` r
student_data
#>   student_id    name            major study_hours attendance final_grade
#> 1        101   Alice Computer Science          15         90          88
#> 2        102     Bob          Biology          12         85          76
#> 3        103 Charlie        Economics          NA         88          91
#> 4        104   David      Mathematics          20         NA          85
#> 5        105    Emma          Physics          18         95          NA
#> 6        106   Frank          History          NA         80          73
#> 7        107   Grace     Data Science          25         92          96
#> 8        108   Henry        Chemistry          10         NA          81
```

## Cleaning Missing Values

Replace missing values with the mean:

``` r
clean_missing(student_data, "study_hours", method = "mean")
#>   student_id    name            major study_hours attendance final_grade
#> 1        101   Alice Computer Science    15.00000         90          88
#> 2        102     Bob          Biology    12.00000         85          76
#> 3        103 Charlie        Economics    16.66667         88          91
#> 4        104   David      Mathematics    20.00000         NA          85
#> 5        105    Emma          Physics    18.00000         95          NA
#> 6        106   Frank          History    16.66667         80          73
#> 7        107   Grace     Data Science    25.00000         92          96
#> 8        108   Henry        Chemistry    10.00000         NA          81
```

Remove rows with missing values:

``` r
clean_missing(student_data, "final_grade", method = "remove")
#>   student_id    name            major study_hours attendance final_grade
#> 1        101   Alice Computer Science          15         90          88
#> 2        102     Bob          Biology          12         85          76
#> 3        103 Charlie        Economics          NA         88          91
#> 4        104   David      Mathematics          20         NA          85
#> 6        106   Frank          History          NA         80          73
#> 7        107   Grace     Data Science          25         92          96
#> 8        108   Henry        Chemistry          10         NA          81
```

## Joining Data

Create another dataset:

``` r
advisor_data <- data.frame(
  student_id = c(101, 102, 103, 104),
  advisor = c(
    "Dr. Smith",
    "Dr. Lee",
    "Dr. Brown",
    "Dr. Patel"
  )
)
```

Join the datasets:

``` r
safe_join(student_data, advisor_data, by = "student_id")
#> Warning in safe_join(student_data, advisor_data, by = "student_id"): 4 row(s)
#> in df1 have no match in df2
#>   student_id    name            major study_hours attendance final_grade
#> 1        101   Alice Computer Science          15         90          88
#> 2        102     Bob          Biology          12         85          76
#> 3        103 Charlie        Economics          NA         88          91
#> 4        104   David      Mathematics          20         NA          85
#> 5        105    Emma          Physics          18         95          NA
#> 6        106   Frank          History          NA         80          73
#> 7        107   Grace     Data Science          25         92          96
#> 8        108   Henry        Chemistry          10         NA          81
#>     advisor
#> 1 Dr. Smith
#> 2   Dr. Lee
#> 3 Dr. Brown
#> 4 Dr. Patel
#> 5      <NA>
#> 6      <NA>
#> 7      <NA>
#> 8      <NA>
```

## Summary Statistics

Generate summary statistics:

``` r
quick_summary(student_data)
#>                  Column      Mean Median       SD Min Max Missing_Values
#> student_id   student_id 104.50000  104.5 2.449490 101 108              0
#> study_hours study_hours  16.66667   16.5 5.501515  10  25              2
#> attendance   attendance  88.33333   89.0 5.316641  80  95              2
#> final_grade final_grade  84.28571   85.0 8.199884  73  96              1
```

## Conclusion

`SafeCleanR` provides simple tools for safer data cleaning and analysis
in R.
