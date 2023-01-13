#' Plate Layout Plot
#'
#' Plots a culture plate or microplate in the desired format. Both continuous as well as discrete values can be displayed
#' with colours and labels.
#'
#' @param data a data frame that contains at least a column with plate position information and a column with values or
#' labels.
#' @param position a character column in the `data` data frame that contains plate positions. These should be in the format:
#' row = letter, column = number. So for example A1, D12 etc.
#' @param value a character or numeric column in the `data` data frame that contains values that should be plotted as colours
#' on the plate layout. Can be the same column as `label`.
#' @param label a character or numeric column in the `data` data frame that contains values that should be plotted as labels
#' on the plate layout. Can be the same column as `value`.
#' @param plate_size a numeric value that specifies the plate size (number of wells) used for the plot. Possible values
#' are: 6, 12, 24, 48, 96 and 384.
#' @param plate_type a character value that specifies the well type. Possible values are "round" and "square". The default is
#' "square".
#' @param colour optional, a character vector that contains colours used for the plot. If the `value` argument is discrete
#' the colours are used as provided. If it is continuous a gradient is created using the colours.
#' @param limits optional, a numeric vector of length two providing new limits for a colour gradient. Use NA to refer to
#' the existing minimum or maximum. If this argument is not supplied the existing minimum and maximum of the
#' values provided to the `value` argument are used for the start and end point of the colour gradient.
#' @param title optional, a character value that contains the plot title.
#' @param title_size optional, a numeric value that determines the text size of the title. The size is also affected by the
#' `scale` argument.
#' @param show_legend a logical value that specifies if the plot legend is shown. Default is `TRUE`.
#' @param label_size optional, a numeric value that determines the text size of the well labels. The size is also affected by the
#' `scale` argument.
#' @param legend_n_row optional, a numeric value that specifies the number of rows of legends. If no value is provided,
#' the automatic ggplot default is used.
#' @param silent a logical value that specifies if the function should report the size of the plotting area and the adjusted
#' scale parameter. Default is `TRUE` meaning it will not return any message. The plot was optimized for a device size of:
#' width = 5.572917 in and height = 3.177083 in, which was determined using the function `par("fin")`. This means if the device
#' has these dimensions the scaling factor is 1.
#' @param scale a numeric value that scales point sizes and labels of the plot. If not provided, the plot uses the device size
#' to find the optimal scaling factor for the output, however, this might be slightly off (e.g. due to number of labels) and
#' can be manually adjusted with this argument.
#'
#' @return A plate layout plot.
#' @import dplyr
#' @import ggplot2
#' @import tidyr
#' @importFrom graphics par
#' @importFrom rlang .data :=
#' @importFrom stringr str_extract
#' @importFrom purrr map_chr
#' @importFrom forcats fct_inorder
#' @export
#'
#' @examples
#' library(dplyr)
#' library(tidyr)
#' library(stringr)
#'
#' # Create example data for continuous value
#'
#' # 96-well plate
#' data_continuous_96 <- data.frame(matrix(round(abs(rnorm(96)), 2), nrow = 8, ncol = 12)) |>
#'   mutate(rows = LETTERS[1:8]) |>
#'   pivot_longer(cols = -rows, names_to = "cols", values_to = "value") |>
#'   mutate(
#'     cols = as.numeric(str_remove(cols, pattern = "V|X")),
#'     well = paste0(rows, cols)
#'   ) |>
#'   distinct(well, value)
#'
#' # 384-well plate
#' data_continuous_384 <- data.frame(matrix(round(abs(rnorm(384)), 2), nrow = 16, ncol = 24)) |>
#'   mutate(rows = LETTERS[1:16]) |>
#'   pivot_longer(cols = -rows, names_to = "cols", values_to = "value") |>
#'   mutate(
#'     cols = as.numeric(str_remove(cols, pattern = "V|X")),
#'     well = paste0(rows, cols)
#'   ) |>
#'   distinct(well, value)
#'
#' # Create a 96-well plot with round wells
#' plate_plot(
#'   data = data_continuous_96,
#'   position = well,
#'   value = value,
#'   label = value,
#'   plate_size = 96,
#'   plate_type = "round"
#' )
#'
#' # Create a 384-well plot with square wells
#' # Define a custom lower limit
#' # Define a custom colour scheme
#' plate_plot(
#'   data = data_continuous_384,
#'   position = well,
#'   value = value,
#'   label = value,
#'   plate_size = 384,
#'   colour = c("#03001e", "#7303c0", "#ec38bc", "#fdeff9"),
#'   limits = c(0, NA)
#' )
#'
#' # Create example data for discrete value
#'
#' # 24-well plate
#' data_discrete_24 <- data.frame(
#'   matrix(
#'     c(
#'       rep("Control", 8),
#'       rep("Drug 1", 8),
#'       rep("Drug 2", 8)
#'     ),
#'     nrow = 4,
#'     ncol = 6
#'   )
#' ) |>
#'   mutate(rows = LETTERS[1:4]) |>
#'   pivot_longer(cols = -rows, names_to = "cols", values_to = "Condition") |>
#'   mutate(
#'     cols = as.numeric(str_remove(cols, pattern = "V|X")),
#'     well = paste0(rows, cols)
#'   ) |>
#'   distinct(well, Condition)
#'
#' # 6-well plate
#' data_discrete_6 <- data.frame(
#'   matrix(
#'     c(
#'       rep("DMSO", 2),
#'       rep("Rapamycin", 2),
#'       rep("Taxol", 2)
#'     ),
#'     nrow = 2,
#'     ncol = 3
#'   )
#' ) |>
#'   mutate(rows = LETTERS[1:2]) |>
#'   pivot_longer(cols = -rows, names_to = "cols", values_to = "Condition") |>
#'   mutate(
#'     cols = as.numeric(str_remove(cols, pattern = "V|X")),
#'     well = paste0(rows, cols)
#'   ) |>
#'   distinct(well, Condition)
#'
#' # Create a 24-well plot
#' plate_plot(
#'   data = data_discrete_24,
#'   position = well,
#'   value = Condition,
#'   plate_size = 24,
#'   plate_type = "round",
#'   show_legend = FALSE
#' )
#'
#' # Create a 6-well plot
#' # Define a custom colour scheme
#' # Adjust label_size to fit text
#' plate_plot(
#'   data = data_discrete_6,
#'   position = well,
#'   value = Condition,
#'   label = Condition,
#'   plate_size = 6,
#'   plate_type = "round",
#'   colour = c("#3a1c71", "#d76d77", "#ffaf7b"),
#'   label_size = 4,
#'   show_legend = FALSE
#' )
#'
plate_plot <- function(data,
                       position,
                       value,
                       label,
                       plate_size = 96,
                       plate_type = "square",
                       colour,
                       limits,
                       title,
                       title_size,
                       show_legend = TRUE,
                       legend_n_row,
                       label_size,
                       silent = TRUE,
                       scale) {
  if (!plate_size %in% c(6, 12, 24, 48, 96, 384)) {
    stop("Selected plate_size not available!")
  }

  if(missing(scale)){
    scale <- min((graphics::par("fin")[1]/5.572917), (graphics::par("fin")[2]/3.177083))
  }

  if(!silent){
    message(paste0("width: ", round(graphics::par("fin")[1], digits = 3), " height: ", round(graphics::par("fin")[2], digits = 3)))
    message(paste0("scaling factor: ", round(scale, digits = 3)))
  }

  # Remove missing values
  data <- tidyr::drop_na(data, {{ value }})

  if (missing(limits)) {
    min_val <- min(dplyr::pull(data, {{ value }}))
    max_val <- max(dplyr::pull(data, {{ value }}))

    # If there is only one numeric value in the data the colour function needs still two distinct values
    n_distinct_values <- length(unique(dplyr::pull(data, {{ value }})))

    if (n_distinct_values == 1) {
      max_val <- min_val + abs(min_val)
    }
  } else {
    min_val <- ifelse(is.na(limits[1]), min(dplyr::pull(data, {{ value }})), limits[1])
    max_val <- ifelse(is.na(limits[2]), max(dplyr::pull(data, {{ value }})), limits[2])
  }

  # If value is numeric then create gradient of colours, default is viridis colours
  if (is.numeric(dplyr::pull(data, {{ value }}))) {
    if (!requireNamespace("scales", quietly = TRUE)) {
      message("Package \"scales\" is needed for this function to work. Please install it.", call. = FALSE)
      return(invisible(NULL))
    }
    if (missing(colour)) {
      viridis_colours <- "placeholder" # assign a placeholder to prevent a missing global variable warning
      utils::data("viridis_colours", envir = environment()) # then overwrite it with real data
      fill_colours <- viridis_colours

      colfunc <- scales::gradient_n_pal(viridis_colours, values = c(
        min_val,
        max_val
      ))

      data_colours <- colfunc(dplyr::pull(data, {{ value }}))
    } else {
      fill_colours <- colour
      colfunc <- scales::gradient_n_pal(colour, values = c(
        min_val,
        max_val
      ))
      data_colours <- colfunc(dplyr::pull(data, {{ value }}))
    }
  }

  # If value is not numeric then make it discrete colours, default is protti colours
  if (!is.numeric(dplyr::pull(data, {{ value }}))) {
    if (missing(colour)) {
      protti_colours <- "placeholder" # assign a placeholder to prevent a missing global variable warning
      utils::data("protti_colours", envir = environment()) # then overwrite it with real data
      # use default if no colours are provided
      fill_colours <- protti_colours
      data_colours <- purrr::map_chr(dplyr::pull(data, {{ value }}),
        .f = ~ {
          fill_colours[which(.x == unique(dplyr::pull(data, {{ value }})))]
        }
      )
    } else {
      if (length(colour) < length(unique(dplyr::pull(data, {{ value }})))) {
        stop('There are more categories in the "value" column than provided colours. Please add more colours to the "colour" argument!')
      }
      fill_colours <- colour
      data_colours <- purrr::map_chr(dplyr::pull(data, {{ value }}),
        .f = ~ {
          fill_colours[which(.x == unique(dplyr::pull(data, {{ value }})))]
        }
      )
    }
  }

  if (!missing(label)) {
    if (!requireNamespace("farver", quietly = TRUE)) {
      message("Package \"farver\" is needed for this function to work. Please install it.", call. = FALSE)
      return(invisible(NULL))
    }
    # label color
    # code adapted from scales::show_col
    hcl <- farver::decode_colour(data_colours, "rgb", "hcl")
    label_col <- ifelse(hcl[, "l"] > 50, "#000000", "#FFFFFF")
  } else {
    label_col <- ""
  }

  # Determine the max number of characters of values
  max_label_length <- data %>%
    dplyr::ungroup() %>%
    dplyr::pull({{ value }}) %>%
    unique() %>%
    nchar() %>%
    max()

  data_prep <- data %>%
    dplyr::ungroup() %>%
    dplyr::mutate(
      row = stringr::str_extract({{ position }}, pattern = "[:upper:]+"),
      col = as.numeric(stringr::str_extract({{ position }}, pattern = "\\d+")),
      row_num = as.numeric(match(.data$row, LETTERS)),
      colours = data_colours,
      label_colours = label_col
    )

  if (!is.numeric(dplyr::pull(data, {{ value }}))) {
    # Convert character values to factors
    data_prep <- data_prep %>%
      dplyr::mutate({{ value }} := forcats::fct_inorder({{ value }}))
  }

  # determine if values are numeric
  if (show_legend) {
    label_is_numeric <- data_prep %>%
      dplyr::pull({{ value }}) %>%
      is.numeric()
  } else {
    label_is_numeric <- TRUE
  }


  if (plate_size == 6) {
    n_cols <- 3
    n_rows <- 2
    size <- 33 * scale
    min_x_axis <- 0.6
    max_x_axis <- n_cols + 0.4
    min_y_axis <- 0.53
    max_y_axis <- n_rows + 0.46
    text_size <- 18 * scale
    legend_text_size <- text_size
    legend_title_size <- text_size
    title_size_preset <- 18 * scale
    legend_size <- 10 * scale
    stroke_width <- 0.8 * scale
    if (show_legend) {
      # change point/text/tile/legend_point size if legend is shown

      # Point size is scaled in a complex way.
      # Between 4-13 characters the scaling factor is 0.7 for each character
      # Between 14-19 characters the scaling is decreasing down to about 0.55 for each character
      # From 20 the scaling is 0.55 for each character
      size <- (33 - max(c(((max_label_length - 3) * ifelse(max_label_length < 20,
        ifelse(max_label_length < 13, 0.7, (1.03 - max_label_length / 40)),
        0.55
      )), 0))) * scale

      # Up to 3 characters no scaling is done (therefore -3 in calculations)
      # text is scaled by 0.5 and points by 0.3 for each character
      # scale legend text with number of character down to size of min 10
      legend_text_size <- max((18 - max(c(((max_label_length - 3) * 0.5), 0))), 10) * scale
      # scale legend title with number of character down to size of min 10
      legend_title_size <- max((18 - max(c(((max_label_length - 3) * 0.5), 0))), 10) * scale
      # scale legend point size with number of character down to size of min 5
      legend_size <- max((10 - max(c(((max_label_length - 3) * 0.3), 0))), 5) * scale
    }
  }

  if (plate_size == 12) {
    n_cols <- 4
    n_rows <- 3
    size <- 22 * scale
    min_x_axis <- 0.6
    max_x_axis <- n_cols + 0.37
    min_y_axis <- 0.6
    max_y_axis <- n_rows + 0.4
    text_size <- 16 * scale
    legend_text_size <- text_size
    legend_title_size <- text_size
    title_size_preset <- 16 * scale
    legend_size <- size
    stroke_width <- 0.8 * scale
    if (show_legend) {
      # change point/text/tile/legend_point size if legend is shown

      # Point size is scaled in a complex way.
      # Between until 12 characters the scaling factor is 0.25 for each character
      # Between 15-19 characters the scaling is decreasing down to about 0.15 for each character
      # From 20 the scaling is 0.15 for each character
      size <- (22 - max((max_label_length - 11) * ifelse(max_label_length < 16,
        (0.65 - max_label_length / 30),
        (0.15 * ((max_label_length / 16 * 2) - 0.8))
      ), 0)) * scale

      # Up to 3 characters no scaling is done (therefore -3 in calculations)
      # text is scaled by 0.5 and points by 0.3 for each character
      # scale legend text with number of character down to size of min 10
      legend_text_size <- max((16 - max(c(((max_label_length - 3) * 0.5), 0))), 10) * scale
      # scale legend title with number of character down to size of min 10
      legend_title_size <- max((16 - max(c(((max_label_length - 3) * 0.5), 0))), 10) * scale
      # scale legend point size with number of character down to size of min 5
      legend_size <- max((10 - max(c(((max_label_length - 3) * 0.3), 0))), 5) * scale
    }
  }

  if (plate_size == 24) {
    n_cols <- 6
    n_rows <- 4
    size <- 17 * scale
    min_x_axis <- 0.7
    max_x_axis <- n_cols + 0.27
    min_y_axis <- 0.65
    max_y_axis <- n_rows + 0.34
    text_size <- 12 * scale
    legend_text_size <- text_size
    legend_title_size <- text_size
    title_size_preset <- 16 * scale
    legend_size <- size
    stroke_width <- 0.8 * scale
    if (show_legend) {
      # change point/text/tile/legend_point size if legend is shown

      # Point size is scaled in a complex way.
      # From 9 characters the scaling factor is 0.3 for each character
      size <- (15 - max((max_label_length - 8) * 0.3, 0)) * scale

      # Up to 3 characters no scaling is done (therefore -3 in calculations)
      # text is scaled by 0.5 and points by 0.3 for each character
      # scale legend text with number of character down to size of min 10
      legend_text_size <- max((12 - max(c(((max_label_length - 3) * 0.5), 0))), 10) * scale
      # scale legend title with number of character down to size of min 10
      legend_title_size <- max((12 - max(c(((max_label_length - 3) * 0.5), 0))), 10) * scale
      # scale legend point size with number of character down to size of min 5
      legend_size <- max((8 - max(c(((max_label_length - 3) * 0.3), 0))), 5) * scale
    }
  }

  if (plate_size == 48) {
    n_cols <- 8
    n_rows <- 6
    size <- 11.4 * scale
    min_x_axis <- 0.7
    max_x_axis <- n_cols + 0.18
    min_y_axis <- 0.68
    max_y_axis <- n_rows + 0.26
    text_size <- 10 * scale
    legend_text_size <- text_size
    legend_title_size <- text_size
    title_size_preset <- 14 * scale
    legend_size <- size
    stroke_width <- 0.8 * scale
    if (show_legend) {
      size <- (11.4 - max((max_label_length - 14) * 0.3, 0)) * scale
      legend_size <- 5 * scale
    }
  }

  if (plate_size == 96) {
    n_cols <- 12
    n_rows <- 8
    size <- 9.5 * scale
    min_x_axis <- 0.75
    max_x_axis <- n_cols + 0.25
    min_y_axis <- 0.75
    max_y_axis <- n_rows + 0.25
    text_size <- 8 * scale
    legend_text_size <- text_size
    legend_title_size <- text_size
    title_size_preset <- 12 * scale
    legend_size <- size
    stroke_width <- 0.6 * scale
    if (show_legend) {
      size <- (9.5 - max((max_label_length - 9) * 0.15, 0)) * scale
      legend_size <- 5 * scale
    }
  }

  if (plate_size == 384) {
    n_cols <- 24
    n_rows <- 16
    size <- 4.6 * scale
    min_x_axis <- 0.95
    max_x_axis <- n_cols
    min_y_axis <- 0.9
    max_y_axis <- n_rows
    text_size <- 6 * scale
    legend_text_size <- text_size
    legend_title_size <- text_size
    title_size_preset <- 10 * scale
    legend_size <- size
    stroke_width <- 0.6 * scale
    if (show_legend) {
      size <- (4.4 - max((max_label_length - 13) * 0.07, 0)) * scale
    }
  }

  if (missing(label_size)) {
    label_size_scaled <- size / 3
    # size is already scaled so here label size does not need to be rescaled
  } else {
    # Scale label size if provided by the user
    label_size_scaled <- label_size * scale
  }

  if (missing(title_size)) {
    title_size <- title_size_preset
  } else {
    title_size <- title_size * scale
  }

  plate_layout <- expand.grid(columns = seq(1, n_cols), rows = seq(1, n_rows))

  if (plate_type == "round") {
    shape <- 21
  }

  if (plate_type == "square") {
    shape <- 22
  }

  if (!missing(title)) {
    plot_title <- title
  } else {
    plot_title <- paste0(plate_size, "-well Plate Layout")
  }

  plot <- ggplot2::ggplot(data_prep, ggplot2::aes(x = col, y = .data$row_num)) +
    ggplot2::geom_point(
      data = plate_layout,
      aes(x = .data$columns, y = .data$rows),
      color = "grey90",
      size = size,
      shape = shape
    ) +
    ggplot2::geom_point(aes(fill = {{ value }}), size = size, shape = shape, stroke = stroke_width) +
    ggplot2::coord_fixed(
      ratio = ((n_cols + 1) / n_cols) / ((n_rows + 1) / n_rows),
      xlim = c(min_x_axis, max_x_axis),
      ylim = c(max_y_axis, min_y_axis)
    ) +
    ggplot2::scale_y_continuous(breaks = seq(1, n_rows), labels = LETTERS[1:n_rows]) +
    ggplot2::scale_x_continuous(breaks = seq(1, n_cols), position = "top") +
    {
      if (is.numeric(dplyr::pull(data, {{ value }}))) {
        ggplot2::scale_fill_gradientn(
          colors = fill_colours,
          limits = c(min_val, max_val),
          guide = guide_colorbar(ticks.linewidth = max(0.5 * scale, 0.2))
        )
      }
    } +
    {
      if (!is.numeric(dplyr::pull(data, {{ value }}))) ggplot2::scale_fill_manual(values = fill_colours)
    } +
    ggplot2::labs(
      title = plot_title,
      x = "",
      y = ""
    ) +
    {
      if (!missing(label)) ggplot2::geom_text(aes(x = col, y = .data$row_num, label = paste0({{ label }})), colour = data_prep$label_colours, size = label_size_scaled)
    } +
    ggplot2::theme_bw() +
    {
      if (!show_legend) {
        ggplot2::theme(
          legend.position = "none"
        )
      }
    } +
    {
      if (!label_is_numeric) {
        if (!missing(legend_n_row)){
          ggplot2::guides(fill = ggplot2::guide_legend(override.aes = list(size = legend_size), nrow = legend_n_row))
        } else {
          ggplot2::guides(fill = ggplot2::guide_legend(override.aes = list(size = legend_size)))
        }
      }
    } +
    {
      if(label_is_numeric){
        ggplot2::theme(legend.key.size = unit(max(0.25 * scale, 0.2), "in"))
      }
    } +
    ggplot2::theme(
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      axis.text = ggplot2::element_text(size = text_size, face = "bold"),
      axis.ticks.x = ggplot2::element_blank(),
      axis.ticks.y = ggplot2::element_blank(),
      legend.text = ggplot2::element_text(size = legend_text_size),
      legend.title = ggplot2::element_text(size = legend_title_size),
      plot.title = ggplot2::element_text(size = title_size),
      axis.title.x = element_blank(),
      panel.border = element_rect(size = stroke_width)
    )

  plot
}
