library(dplyr)
library(tidyr)

set.seed(1234)

# Create example data

# 6-well plate
data_continuous_6 <- data.frame(matrix(round(abs(rnorm(6)), 2), nrow = 8, ncol = 12)) |>
  mutate(rows = LETTERS[1:8]) |>
  pivot_longer(cols = -rows, names_to = "cols", values_to = "Value") |>
  mutate(cols = as.numeric(str_remove(cols, pattern = "V|X")),
         well = paste0(rows, cols)) |>
  distinct(well, Value)

usethis::use_data(data_continuous_6, overwrite = TRUE)

data_discrete_6 <- data.frame(matrix(c(rep("DMSO", 2), rep("Rapamycin", 2), rep("Taxol", 2)), nrow = 2, ncol = 3)) |>
  mutate(rows = LETTERS[1:2]) |>
  pivot_longer(cols = -rows, names_to = "cols", values_to = "Condition") |>
  mutate(cols = as.numeric(str_remove(cols, pattern = "V|X")),
         well = paste0(rows, cols)) |>
  distinct(well, Condition)

usethis::use_data(data_discrete_6, overwrite = TRUE)

# 12-well plate
data_continuous_12 <- data.frame(matrix(round(abs(rnorm(12)), 2), nrow = 8, ncol = 12)) |>
  mutate(rows = LETTERS[1:8]) |>
  pivot_longer(cols = -rows, names_to = "cols", values_to = "Value") |>
  mutate(cols = as.numeric(str_remove(cols, pattern = "V|X")),
         well = paste0(rows, cols)) |>
  distinct(well, Value)

usethis::use_data(data_continuous_12, overwrite = TRUE)

# 24-well plate
data_continuous_24 <- data.frame(matrix(round(abs(rnorm(24)), 2), nrow = 8, ncol = 12)) |>
  mutate(rows = LETTERS[1:8]) |>
  pivot_longer(cols = -rows, names_to = "cols", values_to = "Value") |>
  mutate(cols = as.numeric(str_remove(cols, pattern = "V|X")),
         well = paste0(rows, cols)) |>
  distinct(well, Value)

usethis::use_data(data_continuous_24, overwrite = TRUE)

data_discrete_24 <- data.frame(matrix(c(rep("siControl", 2),
                                        rep("simTOR", 2),
                                        rep("siRaptor", 2),
                                        rep("siRagA", 2),
                                        rep("siRagB", 2),
                                        rep("siRagC", 2),
                                        rep("siRagD", 2),
                                        rep("siWDR59", 2),
                                        rep("siWDR24", 2),
                                        rep("siMios", 2),
                                        rep("siDEPDC5", 2),
                                        rep("siNprl2", 2)), nrow = 4, ncol = 6)) |>
  mutate(rows = LETTERS[1:4]) |>
  pivot_longer(cols = -rows, names_to = "cols", values_to = "Condition") |>
  mutate(cols = as.numeric(str_remove(cols, pattern = "V|X")),
         well = paste0(rows, cols)) |>
  distinct(well, Condition)

usethis::use_data(data_discrete_24, overwrite = TRUE)

# 48-well plate
data_continuous_48 <- data.frame(matrix(round(abs(rnorm(48)), 2), nrow = 8, ncol = 12)) |>
  mutate(rows = LETTERS[1:8]) |>
  pivot_longer(cols = -rows, names_to = "cols", values_to = "Value") |>
  mutate(cols = as.numeric(str_remove(cols, pattern = "V|X")),
         well = paste0(rows, cols)) |>
  distinct(well, Value)

usethis::use_data(data_continuous_48, overwrite = TRUE)

# 96-well plate
data_continuous_96 <- data.frame(matrix(round(abs(rnorm(96)), 2), nrow = 8, ncol = 12)) |>
  mutate(rows = LETTERS[1:8]) |>
  pivot_longer(cols = -rows, names_to = "cols", values_to = "Value") |>
  mutate(cols = as.numeric(str_remove(cols, pattern = "V|X")),
         well = paste0(rows, cols)) |>
  distinct(well, Value)

usethis::use_data(data_continuous_96, overwrite = TRUE)

# 384-well plate
data_continuous_384 <- data.frame(matrix(round(abs(rnorm(384)), 2), nrow = 16, ncol = 24)) |>
  mutate(rows = LETTERS[1:16]) |>
  pivot_longer(cols = -rows, names_to = "cols", values_to = "Value") |>
  mutate(cols = as.numeric(str_remove(cols, pattern = "V|X")),
         well = paste0(rows, cols)) |>
  distinct(well, Value)

usethis::use_data(data_continuous_384, overwrite = TRUE)
