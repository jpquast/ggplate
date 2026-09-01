# Continuous 48-well plate dataset

A dataset containing 48 positive numeric values randomly generated using
a normal distribution
([`rnorm()`](https://rdrr.io/r/stats/Normal.html)). Each value is
assigned to a position in a 48-well plate. The `Status` column marks
wells with a low or a high signal.

## Usage

``` r
data_continuous_48
```

## Format

A data frame with a `Value`, a `well` and a `Status` column.

## Source

Randomly generated.
