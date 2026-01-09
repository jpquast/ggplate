# Continuous incomplete 48-well plate dataset

A dataset containing 23 positive numeric values randomly generated using
a normal distribution
([`rnorm()`](https://rdrr.io/r/stats/Normal.html)). Each value is
assigned to a position in a 48-well plate. Therefore, not every well in
the plate contains a value. The position 1D and the second half of the
plate are `NA`.

## Usage

``` r
data_continuous_48_incomplete
```

## Format

A data frame with a `Value` and a `well` column.

## Source

Randomly generated.
