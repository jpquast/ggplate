# Continuous 96-well plate dataset

A dataset containing 96 positive numeric values randomly generated using
a normal distribution
([`rnorm()`](https://rdrr.io/r/stats/Normal.html)). Each value is
assigned to a position in a 96-well plate. The `Status` column marks
wells with a low signal.

## Usage

``` r
data_continuous_96
```

## Format

A data frame with a `Value`, a `well` and a `Status` column.

## Source

Randomly generated.
