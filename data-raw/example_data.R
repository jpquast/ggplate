library(dplyr)
library(tidyr)

set.seed(1234)

# Create example data

# 6-well plate
data_continuous_6 <- data.frame(matrix(round(abs(rnorm(6)), 2), nrow = 2, ncol = 3)) |>
  mutate(rows = LETTERS[1:2]) |>
  pivot_longer(cols = -rows, names_to = "cols", values_to = "Value") |>
  mutate(
    cols = as.numeric(str_remove(cols, pattern = "V|X")),
    well = paste0(rows, cols)
  ) |>
  distinct(well, Value)

usethis::use_data(data_continuous_6, overwrite = TRUE)

data_discrete_6 <- data.frame(matrix(c(rep("DMSO", 2), rep("Rapamycin", 2), rep("Taxol", 2)), nrow = 2, ncol = 3)) |>
  mutate(rows = LETTERS[1:2]) |>
  pivot_longer(cols = -rows, names_to = "cols", values_to = "Condition") |>
  mutate(
    cols = as.numeric(str_remove(cols, pattern = "V|X")),
    well = paste0(rows, cols)
  ) |>
  distinct(well, Condition)

usethis::use_data(data_discrete_6, overwrite = TRUE)

# 12-well plate
data_continuous_12 <- data.frame(matrix(round(abs(rnorm(12)), 2), nrow = 3, ncol = 4)) |>
  mutate(rows = LETTERS[1:3]) |>
  pivot_longer(cols = -rows, names_to = "cols", values_to = "Value") |>
  mutate(
    cols = as.numeric(str_remove(cols, pattern = "V|X")),
    well = paste0(rows, cols)
  ) |>
  distinct(well, Value)

usethis::use_data(data_continuous_12, overwrite = TRUE)

# 24-well plate
data_continuous_24 <- data.frame(matrix(round(abs(rnorm(24)), 2), nrow = 4, ncol = 6)) |>
  mutate(rows = LETTERS[1:4]) |>
  pivot_longer(cols = -rows, names_to = "cols", values_to = "Value") |>
  mutate(
    cols = as.numeric(str_remove(cols, pattern = "V|X")),
    well = paste0(rows, cols)
  ) |>
  distinct(well, Value)

usethis::use_data(data_continuous_24, overwrite = TRUE)

data_discrete_24 <- data.frame(matrix(c(
  rep("siControl", 2),
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
  rep("siNprl2", 2)
), nrow = 4, ncol = 6)) |>
  mutate(rows = LETTERS[1:4]) |>
  pivot_longer(cols = -rows, names_to = "cols", values_to = "Condition") |>
  mutate(
    cols = as.numeric(str_remove(cols, pattern = "V|X")),
    well = paste0(rows, cols)
  ) |>
  distinct(well, Condition)

usethis::use_data(data_discrete_24, overwrite = TRUE)

# 48-well plate
data_continuous_48 <- data.frame(matrix(round(abs(rnorm(24)), 2), nrow = 6, ncol = 8)) |>
  mutate(rows = LETTERS[1:6]) |>
  pivot_longer(cols = -rows, names_to = "cols", values_to = "Value") |>
  mutate(
    cols = as.numeric(str_remove(cols, pattern = "V|X")),
    well = paste0(rows, cols)
  ) |>
  distinct(well, Value)

usethis::use_data(data_continuous_48, overwrite = TRUE)

# 48-well plate incomplete
data_continuous_48_incomplete <- data.frame(matrix(c(
  round(abs(rnorm(3)), 2),
  NA,
  round(abs(rnorm(20)), 2),
  rep(NA, 24)
), nrow = 6, ncol = 8)) |>
  mutate(rows = LETTERS[1:6]) |>
  pivot_longer(cols = -rows, names_to = "cols", values_to = "Value") |>
  mutate(
    cols = as.numeric(str_remove(cols, pattern = "V|X")),
    well = paste0(rows, cols)
  ) |>
  distinct(well, Value)

usethis::use_data(data_continuous_48_incomplete, overwrite = TRUE)

# 96-well plate
data_continuous_96 <- data.frame(matrix(round(abs(rnorm(96)), 2), nrow = 8, ncol = 12)) |>
  mutate(rows = LETTERS[1:8]) |>
  pivot_longer(cols = -rows, names_to = "cols", values_to = "Value") |>
  mutate(
    cols = as.numeric(str_remove(cols, pattern = "V|X")),
    well = paste0(rows, cols)
  ) |>
  distinct(well, Value)

usethis::use_data(data_continuous_96, overwrite = TRUE)

data_discrete_96 <- data.frame(matrix(c(
  "Positive Control",
  "Positive Control", "Positive Control", "Positive Control", "Positive Control",
  "Positive Control", "Positive Control", "Positive Control", "Axitinib",
  "Axitinib", "Axitinib", "Axitinib", "Afatinib (BIBW2992)", "Afatinib (BIBW2992)",
  "Afatinib (BIBW2992)", "Afatinib (BIBW2992)", "Gefitinib (ZD1839)",
  "Gefitinib (ZD1839)", "Gefitinib (ZD1839)", "Gefitinib (ZD1839)",
  "Lenalidomide (CC-5013)", "Lenalidomide (CC-5013)", "Lenalidomide (CC-5013)",
  "Lenalidomide (CC-5013)", "Rapamycin (Sirolimus)", "Rapamycin (Sirolimus)",
  "Rapamycin (Sirolimus)", "Rapamycin (Sirolimus)", "Entinostat (MS-275)",
  "Entinostat (MS-275)", "Entinostat (MS-275)", "Entinostat (MS-275)",
  "Masitinib (AB1010)", "Masitinib (AB1010)", "Masitinib (AB1010)",
  "Masitinib (AB1010)", "Malotilate", "Malotilate", "Malotilate",
  "Malotilate", "Ivacaftor (VX-770)", "Ivacaftor (VX-770)", "Ivacaftor (VX-770)",
  "Ivacaftor (VX-770)", "Lenvatinib (E7080)", "Lenvatinib (E7080)",
  "Lenvatinib (E7080)", "Lenvatinib (E7080)", "Ritonavir", "Ritonavir",
  "Ritonavir", "Ritonavir", "Bicalutamide", "Bicalutamide", "Bicalutamide",
  "Bicalutamide", "Exemestane", "Exemestane", "Exemestane", "Exemestane",
  "Dutasteride", "Dutasteride", "Dutasteride", "Dutasteride", "Bendamustine HCl",
  "Bendamustine HCl", "Bendamustine HCl", "Bendamustine HCl", "Nelarabine",
  "Nelarabine", "Nelarabine", "Nelarabine", "Etoposide", "Etoposide",
  "Etoposide", "Etoposide", "Topotecan HCl", "Topotecan HCl", "Topotecan HCl",
  "Topotecan HCl", "Temozolomide", "Temozolomide", "Temozolomide",
  "Temozolomide", "Latrepirdine 2HCl", "Latrepirdine 2HCl", "Latrepirdine 2HCl",
  "Latrepirdine 2HCl", "Negative Control", "Negative Control",
  "Negative Control", "Negative Control", "Negative Control", "Negative Control",
  "Negative Control", "Negative Control"
), nrow = 8, ncol = 12)) |>
  mutate(rows = LETTERS[1:8]) |>
  pivot_longer(cols = -rows, names_to = "cols", values_to = "Compound") |>
  mutate(
    cols = as.numeric(str_remove(cols, pattern = "V|X")),
    well = paste0(rows, cols)
  ) |>
  mutate(Compound_multiline = str_replace(Compound, pattern = " ", replacement = "\n")) %>%
  distinct(well, Compound, Compound_multiline)

usethis::use_data(data_discrete_96, overwrite = TRUE)

# 384-well plate
data_continuous_384 <- data.frame(matrix(round(abs(rnorm(384)), 2), nrow = 16, ncol = 24)) |>
  mutate(rows = LETTERS[1:16]) |>
  pivot_longer(cols = -rows, names_to = "cols", values_to = "Value") |>
  mutate(
    cols = as.numeric(str_remove(cols, pattern = "V|X")),
    well = paste0(rows, cols)
  ) |>
  distinct(well, Value)

usethis::use_data(data_continuous_384, overwrite = TRUE)
