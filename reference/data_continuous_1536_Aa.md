# Continuous 1536-well plate dataset (Aa-Hd)

A dataset containing 1536 positive numeric values randomly generated
using a normal distribution
([`rnorm()`](https://rdrr.io/r/stats/Normal.html)). Each value is
assigned to a position in a 1536-well plate. The row format uses the
Ab-Hd labeling. The `Status` column marks the four columns of the plate
that were not used.

## Usage

``` r
data_continuous_1536_Aa
```

## Format

A data frame with a `well`, a `Value` and a `Status` column.

## Source

Randomly generated.
