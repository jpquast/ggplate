# ggplate 0.2.0

* Fix issue #27. If limits were used to exclude values, no labels could be displayed for those wells. Limits were never intended to exclude values, but even if not intended this works now as expected.
* As part of the above fix, two new arguments were added to the function:
  * `na_fill` is the colour used to fill `NA` wells. This is by default `"grey50"`.
  * `remove_na` is a logical value that specifies if `NA` values should be removed from the `value` column of the input data. By default it is `TRUE` keeping the original behaviour, but it now allows users to keep NA values.

# ggplate 0.1.5

* The package received the 1536-well format. Thanks to @plinders!

# ggplate 0.1.4

* Fix issue #23. If not all possible rows were part of the data, wells were shifted down to the bottom of the plate. This has been fixed and every well is in the correct position irrespective of the completeness of the data.

# ggplate 0.1.3

* Fix issue #20. The previous fix inadvertently introduced another bug, which flipped the row order. This has been fixed now.

# ggplate 0.1.2

* Fix issue #20. Row labels were not displayed with `ggplot2` update `3.5.1`. This was because `ylim` cannot be provided in reverse order anymore in `ggplot2::coord_fixed()`. Now letters for row labels are provided in reverse order instead.

# ggplate 0.1.1

* Fix R version requirement. Is now `4.1.0` and not `4.0.0` anymore. This fixes issue #15.
* Fix issue introduced in version 0.1.0. While attempting to remove trailing zeros, we inadvertently introduced some undesired side effects associated with the format() function. This resulted in incorrectly formatted text labels due to leading and trailing whitespaces.
* Update documentation to inform about `conda` package version. 
* Update documentation to inform about potentially undesired behavior of new graphics device being opened by function when used in command line. This can be suppressed by setting `scale` argument.

# ggplate 0.1.0

* Fixed a bug with the `value` argument that would not allow the user to provide a character column with only one value. This fixes issue #10.
* Fixed a bug with the `label` argument that would discard trailing 0 of numeric values. This fixes issue #6.

# ggplate 0.0.1

* First release version.
