library(dplyr)
library(tidyr)
library(stringr)
# m <- matrix(round(abs(rnorm(96)), 2), nrow = 8, ncol = 12)
m <- matrix(c(rep("a", 50), rep("b", 46)), nrow = 8, ncol = 12)
df <- as.data.frame(m) %>%
  mutate(rows = LETTERS[1:8]) %>%
  pivot_longer(cols = -rows, names_to = "cols", values_to = "value") %>%
  mutate(cols = as.numeric(str_remove(cols, pattern = "V"))) %>%
  mutate(well = paste0(rows, cols)) %>%
  distinct(well, value)

test_that("plate_plot works", {
  plot_round <- plate_plot(
    data = df,
    position = well,
    value = value,
    label = value,
    plate_size = 96,
    limits = c(0, NA),
    plate_type = "round",
    scale = 1
  )

  expect_is(plot_round, "ggplot")
  expect_error(print(plot_round), NA)
})
