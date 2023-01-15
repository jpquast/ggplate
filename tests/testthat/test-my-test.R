library(dplyr)
library(tidyr)
library(stringr)

data("data_continuous_6")
data("data_discrete_6")
data("data_continuous_12")
data("data_continuous_24")
data("data_discrete_24")
data("data_continuous_48")
data("data_continuous_96")
data("data_discrete_96")
data("data_continuous_384")

# plate size error
test_that("plate_plot works", {
  expect_error(plate_plot(
    data = data_continuous_6,
    position = well,
    value = Value,
    plate_size = 7
  ))
})

# 6 continuous, limits (lower), label, round
test_that("plate_plot works", {
  plot_1 <- plate_plot(
    data = data_continuous_6,
    position = well,
    value = Value,
    label = Value,
    plate_size = 6,
    limits = c(0, NA),
    plate_type = "round"
  )

  expect_s3_class(plot_1, "ggplot")
  expect_error(print(plot_1), NA)
})

# 6 discrete, label size, no legend, square, colour
test_that("plate_plot works", {
  plot_2 <- plate_plot(
    data = data_discrete_6,
    position = well,
    value = Condition,
    label = Condition,
    plate_size = 6,
    label_size = 4,
    plate_type = "square",
    colour = c("#3a1c71", "#d76d77", "#ffaf7b"),
    show_legend = FALSE
  )

  expect_s3_class(plot_2, "ggplot")
  expect_error(print(plot_2), NA)
})

# colour error
test_that("plate_plot works", {
  expect_error(
    plate_plot(
      data = data_discrete_6,
      position = well,
      value = Condition,
      plate_size = 6,
      colour = c("#3a1c71")
    )
  )
})

# 12 continuous title, title size
test_that("plate_plot works", {
  plot_3 <- plate_plot(
    data = data_continuous_12,
    position = well,
    value = Value,
    label = Value,
    plate_size = 12,
    title = "New Title",
    title_size = 23
  )

  expect_s3_class(plot_3, "ggplot")
  expect_error(print(plot_3), NA)
})

# 24 continuous, round, colour, limits
test_that("plate_plot works", {
  plot_4 <- plate_plot(
    data = data_continuous_24,
    position = well,
    value = Value,
    label = Value,
    limits = c(0, 2.5),
    plate_type = "round",
    plate_size = 24,
    colour = c("#000004FF", "#51127CFF", "#B63679FF", "#FB8861FF", "#FCFDBFFF")
  )

  expect_s3_class(plot_4, "ggplot")
  expect_error(print(plot_4), NA)
})

# 24 discrete, round, legend row, scale
test_that("plate_plot works", {
  plot_5 <- plate_plot(
    data = data_discrete_24,
    position = well,
    value = Condition,
    plate_type = "round",
    plate_size = 24,
    legend_n_row = 6,
    scale = 0.8
  )

  expect_s3_class(plot_5, "ggplot")
  expect_error(print(plot_5), NA)
})

# 48 continuous, round, limit (upper), not silent
test_that("plate_plot works", {
  expect_message(plot_6 <- plate_plot(
    data = data_continuous_48,
    position = well,
    value = Value,
    plate_type = "round",
    plate_size = 48,
    limits = c(NA, 3),
    silent = FALSE
  ))

  expect_s3_class(plot_6, "ggplot")
  expect_error(print(plot_6), NA)
})

# 96 continuous, round, limit, not silent
test_that("plate_plot works", {
  plot_7 <- plate_plot(
    data = data_continuous_96,
    position = well,
    value = Value,
    plate_type = "round",
    plate_size = 96,
    limits = c(0, 3),
    silent = FALSE
  )

  expect_s3_class(plot_7, "ggplot")
  expect_error(print(plot_7), NA)
})

# 96 discrete, legend_n_row missing
test_that("plate_plot works", {
  plot_8 <- plate_plot(
    data = data_discrete_96,
    position = well,
    value = Compound,
    label = Compound_multiline, # using a column that contains line brakes for labeling
    plate_size = 96,
    show_legend = FALSE, # hiding legend
    label_size = 1.1, # setting label size
    plate_type = "round"
  )

  expect_s3_class(plot_8, "ggplot")
  expect_error(print(plot_8), NA)
})

# 384 continuous
test_that("plate_plot works", {
  plot_9 <- plate_plot(
    data = data_continuous_384,
    position = well,
    value = Value,
    plate_size = 384
  )

  expect_s3_class(plot_9, "ggplot")
  expect_error(print(plot_9), NA)
})
