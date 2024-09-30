#' Colour scheme for protti
#'
#' A colour scheme from the `protti` package that contains 100 colours.
#'
#' @format A vector containing 100 colours
#' @source protti R package.
"protti_colours"

#' Viridis colour scheme
#'
#' A colour scheme by the viridis colour scheme from the `viridis` R package.
#'
#' @format A vector containing 256 colours
#' @source viridis R package
"viridis_colours"

#' Continuous 6-well plate dataset
#'
#' A dataset containing 6 positive numeric values randomly generated using a normal distribution (`rnorm()`).
#' Each value is assigned to a position in a 6-well plate.
#'
#' @format A data frame with a `Value` and a `well` column.
#' @source Randomly generated.
"data_continuous_6"

#' Continuous 12-well plate dataset
#'
#' A dataset containing 12 positive numeric values randomly generated using a normal distribution (`rnorm()`).
#' Each value is assigned to a position in a 12-well plate.
#'
#' @format A data frame with a `Value` and a `well` column.
#' @source Randomly generated.
"data_continuous_12"

#' Continuous 24-well plate dataset
#'
#' A dataset containing 24 positive numeric values randomly generated using a normal distribution (`rnorm()`).
#' Each value is assigned to a position in a 24-well plate.
#'
#' @format A data frame with a `Value` and a `well` column.
#' @source Randomly generated.
"data_continuous_24"

#' Continuous 48-well plate dataset
#'
#' A dataset containing 48 positive numeric values randomly generated using a normal distribution (`rnorm()`).
#' Each value is assigned to a position in a 48-well plate.
#'
#' @format A data frame with a `Value` and a `well` column.
#' @source Randomly generated.
"data_continuous_48"

#' Continuous incomplete 48-well plate dataset
#'
#' A dataset containing 23 positive numeric values randomly generated using a normal distribution (`rnorm()`).
#' Each value is assigned to a position in a 48-well plate. Therefore, not every well in the plate contains a
#' value. The position 1D and the second half of the plate are `NA`.
#'
#' @format A data frame with a `Value` and a `well` column.
#' @source Randomly generated.
"data_continuous_48_incomplete"

#' Continuous 96-well plate dataset
#'
#' A dataset containing 96 positive numeric values randomly generated using a normal distribution (`rnorm()`).
#' Each value is assigned to a position in a 96-well plate.
#'
#' @format A data frame with a `Value` and a `well` column.
#' @source Randomly generated.
"data_continuous_96"

#' Continuous 384-well plate dataset
#'
#' A dataset containing 384 positive numeric values randomly generated using a normal distribution (`rnorm()`).
#' Each value is assigned to a position in a 384-well plate.
#'
#' @format A data frame with a `Value` and a `well` column.
#' @source Randomly generated.
"data_continuous_384"

#' Discrete 6-well plate dataset
#'
#' A dataset containing 3 conditions for a drug treatment in a 6-well plate.
#' The treatment consists of a DMSO negative control, Rapamycin and Taxol.
#' Each treatment is assigned to a position in a 6-well plate.
#'
#' @format A data frame with a `Value` and a `well` column.
#' @source Theoretically possible treatment for cells.
"data_discrete_6"

#' Discrete 24-well plate dataset
#'
#' A dataset containing 12 conditions for an siRNA treatment in a 24-well plate.
#' The siRNA treatment consists of a control (siControl) and 11 siRNAs targeting mRNAs of
#' proteins in the mTORC1 pathway.
#' Each treatment is assigned to a position in a 24-well plate.
#'
#' @format A data frame with a `Value` and a `well` column.
#' @source Theoretically possible siRNA treatment for cells.
"data_discrete_24"

#' Discrete 96-well plate dataset
#'
#' A dataset containing 22 conditions for a hypothetical drug treatment in a 96-well plate.
#' The first column contains the negative control while the last column contains the positive control.
#' Each treatment is assigned to four wells in a 96-well plate.
#'
#' @format A data frame with a `Value` and a `well` column.
#' @source Drugs were chosen from a standard FDA approved drug library.
"data_discrete_96"

#' Continuous 1536-well plate dataset
#'
#' A dataset containing 1536 positive numeric values randomly generated using a normal distribution (`rnorm()`).
#' Each value is assigned to a position in a 1536-well plate.
#'
#' @format A data frame with a `Value` and a `well` column.
#' @source Randomly generated.
"data_continuous_1536"
