
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggplate <img src='man/figures/logo.png' align="right" width="12.5%" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/jpquast/ggplate/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jpquast/ggplate/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/jpquast/ggplate/branch/main/graph/badge.svg)](https://app.codecov.io/gh/jpquast/ggplate?branch=main)
<!-- badges: end -->

The goal of the **ggplate** package is to enable users to create simple
plots of biological culture plates as well as microplates. Both
continuous and discrete values can be plotted onto the plate layout.

Currently the package supports the following plate sizes:

-   6-well plate
-   12-well plate
-   24-well plate
-   48-well plate
-   96-well plate
-   384-well plate

## Installation

**ggplate** is implemented as an R package.

You can install the release version from
[CRAN](https://CRAN.R-project.org/package=ggplate) using the
`install.packages()` function.

``` r
install.packages("ggplate")
```

You can install the development version from
[GitHub](https://github.com/jpquast/ggplate) using the
[`devtools`](https://github.com/r-lib/devtools) package by copying the
following commands into R:

Note: If you do not have `devtools` installed make sure to do so by
removing the comment sign (#).

``` r
# install.packages("devtools")
devtools::install_github("jpquast/ggplate")
```

## Usage

In order to use **ggplate** you have to load the package in your R
environment by simply calling the `library()` function as shown bellow.

``` r
# Load ggplate package
library(ggplate)
```

There are multiple example datasets provided that can be used to create
plots of each plate type. You can access these datasets using the
`data()` function.

``` r
# Load a dataset of contious values for a 96-well plate
data(data_continuous_96)

# Check the structure of the dataset
str(data_continuous_96)
#> tibble [96 × 2] (S3: tbl_df/tbl/data.frame)
#>  $ Value: num [1:96] 0.05 0.97 0.9 0.02 2.06 1.01 0.92 1.66 0.12 0.41 ...
#>  $ well : chr [1:96] "A1" "A2" "A3" "A4" ...
```

When calling the `str()` function you can see that the data frame of a
continuous 96-well plate dataset only contains two columns. The `Value`
column contains values that have been for example measured for each of
the plate wells, while the `well` column contains the corresponding well
positions in the plate using a combination of **alphabetic row names**
and **numeric column names**.

You can use this example data frame to create a 96-well plate layout
plot using the `plate_plot()` function and setting the `plate_size`
argument to `96`. There are currently two options for the plate well
type. These can be either `"round"` or `"square"`. In the plot below the
specify `"round"`, while `"square"` is the default value when the
`plate_type` argument is not provided.

The data frame is provided to the `data` argument and the column name of
the column containing the well positions is provided to the `position`
argument. The column name of the column containing the values is
provided to the `value` argument.

*Note: The default size of the plot is optimized to look good for the
“Plots” tab in Rstudio. For an Rmarkdown file set the chunk options to
`fig.width=3, fig.height=3, dpi=300`.*

``` r
# Create a 96-well plot with round wells
plate_plot(data = data_continuous_96, 
           position = well, 
           value = Value, 
           plate_size = 96, 
           plate_type = "round")
```

<img src="man/figures/README-standard_plot-1.png" width="100%" />
