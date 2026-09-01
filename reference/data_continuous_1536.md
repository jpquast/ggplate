# Continuous 1536-well plate dataset (A-AF)

A dataset containing 1536 positive numeric values randomly generated
using a normal distribution
([`rnorm()`](https://rdrr.io/r/stats/Normal.html)). Each value is
assigned to a position in a 1536-well plate. The row format uses the
A-AF labeling. The `Status` column marks the wells at the edge of the
plate, which are prone to evaporation.

## Usage

``` r
data_continuous_1536
```

## Format

A data frame with a `well`, a `Value` and a `Status` column.

## Source

Randomly generated.
