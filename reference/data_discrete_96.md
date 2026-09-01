# Discrete 96-well plate dataset

A dataset containing 22 conditions for a hypothetical drug treatment in
a 96-well plate. The first column contains the positive control while
the last column contains the negative control. Each treatment is
assigned to four wells in a 96-well plate. The `Replicate` column
contains the number of the replicate of each compound. The two controls
have eight replicates, every other compound has four.

## Usage

``` r
data_discrete_96
```

## Format

A data frame with a `Compound`, a `well`, a `Compound_multiline` and a
`Replicate` column.

## Source

Drugs were chosen from a standard FDA approved drug library.
