# Discrete 24-well plate dataset

A dataset containing 12 conditions for an siRNA treatment in a 24-well
plate. The siRNA treatment consists of a control (siControl) and 11
siRNAs targeting mRNAs of proteins in the mTORC1 pathway. Each treatment
is assigned to a position in a 24-well plate. The `Status` column marks
the knockdowns that did not work as expected.

## Usage

``` r
data_discrete_24
```

## Format

A data frame with a `Condition`, a `well` and a `Status` column.

## Source

Theoretically possible siRNA treatment for cells.
