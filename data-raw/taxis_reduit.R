# Code to prepare `taxis_reduit` dataset goes here

url_jeu_de_donnees <- "https://github.com/mwaskom/seaborn-data/blob/master/taxis.csv"

library(readr)
library(dplyr)
library(usethis)

# code original de réduction utilisé avant l'examen pour obtenir un fichier< 500 KB
# Le fichier réduit conservé pour le package est `data-raw/taxis_reduit.csv`.

# set.seed(123)
# df <- read_csv("taxis.csv")
# limite <- 490 * 1024
# n <- nrow(df)
#
# repeat {
#   df_test <- sample_n(df, n) %>%
#     arrange(pickup)
#
#   write_csv(df_test, "taxis_reduit.csv")
#
#   taille <- file.info("taxis_reduit.csv")$size
#
#   if (taille <= limite) {
#     break
#   }
#
#   n <- n - 100
# }

taxis_reduit <- readr::read_csv("data-raw/taxis_reduit.csv", show_col_types = FALSE)

usethis::use_data(taxis_reduit, overwrite = TRUE)
