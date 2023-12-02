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
