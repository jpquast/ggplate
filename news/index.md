# Changelog

## ggplate 0.4.0

- The `value` argument of
  [`plate_plot()`](https://jpquast.github.io/ggplate/reference/plate_plot.md)
  now accepts factors, which previously caused an error. The order of
  the factor levels determines the order of the legend. This makes it
  possible to control the legend order, which for character columns is
  still the order of appearance in the data.
- Every level of a factor is assigned a colour, even if it is not
  present in the data. This means that plates plotted from the same data
  always use the same colour for the same level.
- [`plate_plot()`](https://jpquast.github.io/ggplate/reference/plate_plot.md)
  received the new `border` argument. It takes a column that contains
  categories, which are plotted as colours of the well borders. This
  makes it possible to highlight individual wells. The categories are
  shown in a second legend and wells with a missing value (`NA`) keep
  the default black border.
- As part of the above addition, two more things were added to the
  package:
  - `border_colour` is a new argument that takes the colours used for
    the well borders. By default the new `border_colours` scheme is
    used.
  - `border_colours` is a new colour scheme containing four colours that
    mark the status of a well. The colours are not part of the
    `protti_colours` and `viridis_colours` schemes, which ensures that
    borders are visible on every fill colour.
- Every example dataset received a `Status`, a `Control` or a
  `Replicate` column, which can be used with the new `border` argument.
  For most datasets only some of the wells have a category, the rest of
  the wells contain `NA`.
- The legends of the `value` and the `border` argument now share the
  space next to the plot. The number of legend columns is based on the
  total number of keys of both legends and the `legend_n_row` argument
  now specifies the total number of rows of both legends.
- The `value` column can now contain only missing values (`NA`), which
  makes it possible to show a plate that has colours only for the well
  borders. In this case no legend is shown for the `value` argument.
  This requires the `remove_na` argument to be set to `FALSE`, otherwise
  every well is removed and
  [`plate_plot()`](https://jpquast.github.io/ggplate/reference/plate_plot.md)
  now returns an informative error.
- The `value` column can now also be a logical column, which previously
  threw an error.

## ggplate 0.3.1

CRAN release: 2026-05-11

- Fixed a bug that was introduced with the last version. Row labels were
  `NA` when no complete dataset was provided.

## ggplate 0.3.0

CRAN release: 2026-05-08

- The
  [`plate_plot()`](https://jpquast.github.io/ggplate/reference/plate_plot.md)
  function now supports 1536-well plates with the “Aa-Hd” row label
  format in addition to the “A-AF” format.

## ggplate 0.2.0

CRAN release: 2026-01-09

- Fix issue [\#27](https://github.com/jpquast/ggplate/issues/27). If
  limits were used to exclude values, no labels could be displayed for
  those wells. Limits were never intended to exclude values, but even if
  not intended this works now as expected.
- As part of the above fix, two new arguments were added to the
  function:
  - `na_fill` is the colour used to fill `NA` wells. This is by default
    `"grey50"`.
  - `remove_na` is a logical value that specifies if `NA` values should
    be removed from the `value` column of the input data. By default it
    is `TRUE` keeping the original behaviour, but it now allows users to
    keep NA values.

## ggplate 0.1.5

CRAN release: 2024-10-01

- The package received the 1536-well format. Thanks to
  [@plinders](https://github.com/plinders)!

## ggplate 0.1.4

CRAN release: 2024-07-10

- Fix issue [\#23](https://github.com/jpquast/ggplate/issues/23). If not
  all possible rows were part of the data, wells were shifted down to
  the bottom of the plate. This has been fixed and every well is in the
  correct position irrespective of the completeness of the data.

## ggplate 0.1.3

CRAN release: 2024-06-14

- Fix issue [\#20](https://github.com/jpquast/ggplate/issues/20). The
  previous fix inadvertently introduced another bug, which flipped the
  row order. This has been fixed now.

## ggplate 0.1.2

CRAN release: 2024-06-14

- Fix issue [\#20](https://github.com/jpquast/ggplate/issues/20). Row
  labels were not displayed with `ggplot2` update `3.5.1`. This was
  because `ylim` cannot be provided in reverse order anymore in
  [`ggplot2::coord_fixed()`](https://ggplot2.tidyverse.org/reference/coord_fixed.html).
  Now letters for row labels are provided in reverse order instead.

## ggplate 0.1.1

CRAN release: 2023-12-03

- Fix R version requirement. Is now `4.1.0` and not `4.0.0` anymore.
  This fixes issue [\#15](https://github.com/jpquast/ggplate/issues/15).
- Fix issue introduced in version 0.1.0. While attempting to remove
  trailing zeros, we inadvertently introduced some undesired side
  effects associated with the format() function. This resulted in
  incorrectly formatted text labels due to leading and trailing
  whitespaces.
- Update documentation to inform about `conda` package version.
- Update documentation to inform about potentially undesired behavior of
  new graphics device being opened by function when used in command
  line. This can be suppressed by setting `scale` argument.

## ggplate 0.1.0

CRAN release: 2023-11-10

- Fixed a bug with the `value` argument that would not allow the user to
  provide a character column with only one value. This fixes issue
  [\#10](https://github.com/jpquast/ggplate/issues/10).
- Fixed a bug with the `label` argument that would discard trailing 0 of
  numeric values. This fixes issue
  [\#6](https://github.com/jpquast/ggplate/issues/6).

## ggplate 0.0.1

CRAN release: 2023-01-20

- First release version.
