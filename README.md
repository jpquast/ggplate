
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