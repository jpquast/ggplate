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
data("data_continuous_1536")
data("data_continuous_48_incomplete")

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

# 24 discrete factor, legend order follows factor levels
test_that("plate_plot works", {
  factor_levels <- rev(sort(unique(data_discrete_24$Condition)))

  data_factor_24 <- data_discrete_24 |>
    mutate(Condition = factor(Condition, levels = factor_levels))

  plot_10 <- plate_plot(
    data = data_factor_24,
    position = well,
    value = Condition,
    label = Condition,
    plate_size = 24,
    limits = c(0, 1) # limits are ignored for discrete values
  )

  expect_s3_class(plot_10, "ggplot")
  expect_error(print(plot_10), NA)
  expect_equal(
    ggplot2::ggplot_build(plot_10)$plot$scales$get_scales("fill")$get_limits(),
    factor_levels
  )
})

# 24 discrete factor, colours are the same for levels missing from the data
test_that("plate_plot works", {
  factor_levels <- sort(unique(data_discrete_24$Condition))

  data_factor_24 <- data_discrete_24 |>
    mutate(Condition = factor(Condition, levels = factor_levels)) |>
    filter(Condition != factor_levels[1])

  plot_11 <- plate_plot(
    data = data_factor_24,
    position = well,
    value = Condition,
    plate_size = 24
  )

  expect_s3_class(plot_11, "ggplot")
  expect_error(print(plot_11), NA)
  expect_equal(
    ggplot2::ggplot_build(plot_11)$plot$scales$get_scales("fill")$get_limits(),
    factor_levels[-1]
  )
  # the second level keeps the second colour even though the first level is missing
  expect_equal(
    unique(ggplot2::ggplot_build(plot_11)$data[[2]]$fill[
      data_factor_24$Condition == factor_levels[2]
    ]),
    protti_colours[2]
  )
})

# 24 discrete, border, default border colours, round
test_that("plate_plot works", {
  plot_12 <- plate_plot(
    data = data_discrete_24,
    position = well,
    value = Condition,
    border = Status,
    plate_size = 24,
    plate_type = "round"
  )

  expect_s3_class(plot_12, "ggplot")
  expect_error(print(plot_12), NA)

  borders <- ggplot2::ggplot_build(plot_12)$data[[2]]$colour
  # the categories get the colours of their factor level, other wells keep the default border
  expect_equal(unique(borders[data_discrete_24$Status %in% "Fail"]), border_colours[1])
  expect_equal(unique(borders[data_discrete_24$Status %in% "Check"]), border_colours[2])
  expect_equal(unique(borders[is.na(data_discrete_24$Status)]), "black")
  # missing values are not part of the legend
  expect_equal(ggplot2::get_guide_data(plot_12, "colour")$.label, c("Fail", "Check"))
})

# 96 continuous, border factor with levels missing from the data, custom border colours, square
test_that("plate_plot works", {
  plot_13 <- plate_plot(
    data = data_continuous_96,
    position = well,
    value = Value,
    border = Status,
    border_colour = c("#111111", "#222222", "#333333", "#444444"),
    plate_size = 96
  )

  expect_s3_class(plot_13, "ggplot")
  expect_error(print(plot_13), NA)

  borders <- ggplot2::ggplot_build(plot_13)$data[[2]]$colour
  # colours follow the order of the factor levels, also for the levels missing from the data
  expect_equal(unique(borders[data_continuous_96$Status %in% "Fail"]), "#111111")
  expect_equal(unique(borders[data_continuous_96$Status %in% "Check"]), "#222222")
  expect_equal(unique(borders[is.na(data_continuous_96$Status)]), "black")
  # only the categories that are present in the data are part of the legend
  expect_equal(ggplot2::get_guide_data(plot_13, "colour")$.label, c("Fail", "Check"))
})

# 96 discrete, numeric border column with eight categories
test_that("plate_plot works", {
  border_eight <- c("red", "blue", "green", "orange", "purple", "brown", "magenta", "turquoise")

  plot_14 <- plate_plot(
    data = data_discrete_96,
    position = well,
    value = Compound,
    border = Replicate,
    border_colour = border_eight,
    plate_size = 96,
    plate_type = "round"
  )

  expect_s3_class(plot_14, "ggplot")
  expect_error(print(plot_14), NA)

  borders <- ggplot2::ggplot_build(plot_14)$data[[2]]$colour
  # every replicate number gets its own border colour
  expect_equal(borders, border_eight[data_discrete_96$Replicate])
  expect_equal(ggplot2::get_guide_data(plot_14, "colour")$.label, as.character(1:8))

  # the default border colours are not sufficient for eight categories
  expect_error(
    plate_plot(
      data = data_discrete_96,
      position = well,
      value = Compound,
      border = Replicate,
      plate_size = 96
    )
  )
})

# border colour error
test_that("plate_plot works", {
  expect_error(
    plate_plot(
      data = data_discrete_24,
      position = well,
      value = Condition,
      border = Status,
      border_colour = c("#111111"),
      plate_size = 24
    )
  )
})
# 1536 continuous, border, wells are not changed without the border argument
test_that("plate_plot works", {
  data_border_1536 <- data_continuous_1536 |>
    mutate(Status = ifelse(Value > 2.5, "check", NA))

  plot_14 <- plate_plot(
    data = data_border_1536,
    position = well,
    value = Value,
    border = Status,
    plate_size = 1536
  )

  expect_s3_class(plot_14, "ggplot")
  expect_error(print(plot_14), NA)

  # without the border argument every well keeps the default border
  plot_15 <- plate_plot(
    data = data_border_1536,
    position = well,
    value = Value,
    plate_size = 1536
  )

  expect_equal(unique(ggplot2::ggplot_build(plot_15)$data[[2]]$colour), "black")
})

# 24 discrete, long border labels reduce the well size
test_that("plate_plot works", {
  # the label length of the border legend is only known through a longer category
  data_long_border_24 <- data_discrete_24 |>
    mutate(Long_status = ifelse(is.na(Status), NA, "a very long border category name"))

  plot_16 <- plate_plot(
    data = data_discrete_24,
    position = well,
    value = Condition,
    border = Status,
    plate_size = 24
  )

  plot_17 <- plate_plot(
    data = data_long_border_24,
    position = well,
    value = Condition,
    border = Long_status,
    plate_size = 24
  )

  expect_lt(
    unique(ggplot2::ggplot_build(plot_17)$data[[2]]$size),
    unique(ggplot2::ggplot_build(plot_16)$data[[2]]$size)
  )
})

# 48 continuous, border column of the example data, NAs are kept
test_that("plate_plot works", {
  plot_18 <- plate_plot(
    data = data_continuous_48_incomplete,
    position = well,
    value = Value,
    border = Status,
    plate_size = 48,
    remove_na = FALSE
  )

  expect_s3_class(plot_18, "ggplot")
  expect_error(print(plot_18), NA)

  borders <- ggplot2::ggplot_build(plot_18)$data[[2]]$colour
  # "Not tested" is the fourth level of the column, therefore it gets the fourth border colour
  expect_equal(unique(borders[!is.na(data_continuous_48_incomplete$Status)]), border_colours[4])
  expect_equal(unique(borders[is.na(data_continuous_48_incomplete$Status)]), "black")
  expect_equal(ggplot2::get_guide_data(plot_18, "colour")$.label, "Not tested")
})

# 96 discrete, both legends share the columns and the rows
test_that("plate_plot works", {
  border_eight <- c("red", "blue", "green", "orange", "purple", "brown", "magenta", "turquoise")

  legend_layout <- function(plot) {
    table <- ggplot2::ggplot_gtable(ggplot2::ggplot_build(plot))
    boxes <- grep("guide-box", sapply(table$grobs, function(x) x$name))
    layout <- list()
    for (box in boxes) {
      grobs <- table$grobs[[box]]$grobs
      if (is.null(grobs)) next
      for (grob in grobs) {
        if (!inherits(grob, "gtable")) next
        keys <- grep("^key-[0-9]", grob$layout$name)
        if (length(keys) == 0) next
        layout[[length(layout) + 1]] <- c(
          columns = length(unique(grob$layout$l[keys])),
          rows = length(unique(grob$layout$t[keys]))
        )
      }
    }
    layout
  }

  # 22 compounds and 8 replicates are 30 keys, which need two columns of at most 20 rows
  plot_21 <- plate_plot(
    data = data_discrete_96,
    position = well,
    value = Compound,
    border = Replicate,
    border_colour = border_eight,
    plate_size = 96
  )

  layout_21 <- legend_layout(plot_21)
  expect_equal(unname(layout_21[[1]]), c(2, 11))
  expect_equal(unname(layout_21[[2]]), c(2, 4))

  # both legends together do not use more rows than legend_n_row
  plot_22 <- plate_plot(
    data = data_discrete_96,
    position = well,
    value = Compound,
    border = Replicate,
    border_colour = border_eight,
    plate_size = 96,
    legend_n_row = 10
  )

  layout_22 <- legend_layout(plot_22)
  expect_lte(layout_22[[1]]["rows"] + layout_22[[2]]["rows"], 10)
  # both legends use the same number of columns
  expect_equal(layout_22[[1]]["columns"], layout_22[[2]]["columns"])

  # a legend with several columns reduces the size of the wells
  expect_lt(
    unique(ggplot2::ggplot_build(plot_21)$data[[2]]$size),
    unique(ggplot2::ggplot_build(plate_plot(
      data = data_discrete_24, position = well, value = Condition, plate_size = 96
    ))$data[[2]]$size)
  )
})

# 96 discrete, only the borders of the wells are shown
test_that("plate_plot works", {
  data_no_value_96 <- data_discrete_96 |>
    mutate(new_value = NA)

  plot_23 <- plate_plot(
    data = data_no_value_96,
    position = well,
    value = new_value,
    border = Compound,
    border_colour = protti_colours,
    plate_size = 96,
    plate_type = "round",
    remove_na = FALSE
  )

  expect_s3_class(plot_23, "ggplot")
  expect_error(print(plot_23), NA)

  build_23 <- ggplot2::ggplot_build(plot_23)
  # a value column without values has no legend, only the border legend is shown
  expect_null(ggplot2::get_guide_data(plot_23, "fill"))
  expect_equal(nrow(ggplot2::get_guide_data(plot_23, "colour")), length(unique(data_no_value_96$Compound)))
  # every well is drawn with the fill of missing values and its own border colour
  expect_equal(nrow(build_23$data[[2]]), nrow(data_no_value_96))
  expect_equal(unique(build_23$data[[2]]$fill), "grey50")
  expect_equal(length(unique(build_23$data[[2]]$colour)), length(unique(data_no_value_96$Compound)))

  # removing the missing values would remove every well
  expect_error(
    plate_plot(
      data = data_no_value_96,
      position = well,
      value = new_value,
      border = Compound,
      border_colour = protti_colours,
      plate_size = 96
    )
  )

  # the same works for a numeric column without values and does not warn
  expect_warning(
    plot_25 <- plate_plot(
      data = data_no_value_96 |> mutate(new_value = NA_real_),
      position = well,
      value = new_value,
      border = Compound,
      border_colour = protti_colours,
      plate_size = 96,
      remove_na = FALSE
    ),
    NA
  )
  expect_null(ggplot2::get_guide_data(plot_25, "fill"))

  # a logical value column works as well
  plot_24 <- plate_plot(
    data = data_discrete_96 |> mutate(new_value = Replicate > 4),
    position = well,
    value = new_value,
    plate_size = 96
  )

  expect_s3_class(plot_24, "ggplot")
  expect_error(print(plot_24), NA)
})
