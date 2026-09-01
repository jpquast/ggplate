# Continuous incomplete 48-well plate dataset

A dataset containing 23 positive numeric values randomly generated using
a normal distribution
([`rnorm()`](https://rdrr.io/r/stats/Normal.html)). Each value is
assigned to a position in a 48-well plate. Therefore, not every well in
the plate contains a value. The position 1D and the second half of the
plate are `NA`. The `Status` column marks the wells that were not
tested. These wells are only shown if the `remove_na` argument of
[`plate_plot()`](https://jpquast.github.io/ggplate/reference/plate_plot.md)
is set to `FALSE`.

## Usage

``` r
data_continuous_48_incomplete
```

## Format

A data frame with a `Value`, a `well` and a `Status` column.

## Source

Randomly generated.
