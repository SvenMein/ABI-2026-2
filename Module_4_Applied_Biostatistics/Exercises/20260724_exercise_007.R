pacman::p_load(
  conflicted, tidyverse, wrappedtools, here,
  readxl, readODS, foreign, haven
)

pacman::p_load(
  conflicted, tidyverse, here,
  grid, gridExtra, car,
  ggsci, ggsignif, ggthemes, ggridges,
  # gganimate,
  ggforce,
  ggbeeswarm,
  wrappedtools,
  # emojifont,
  patchwork,
  GGally
)
conflicts_prefer(
  dplyr::filter,
  ggplot2::mean_cl_boot
) # solves name conflict

# Exercise ####
# Import the data as 3 tibbles
# First, the position of the data is defined
excel_positions <- c("A5:E11", "G5:K12", "M5:Q7")

# Loop to import the data from a position and store as untidy_i
for (untidy_i in seq_along(excel_positions)) {
  assign(paste0("untidy_", untidy_i), read_excel(
    path = here("Data/UntidyImportChallenge.xlsx"),
    range = excel_positions[untidy_i],
    col_names = c("Treatment", "Animal Number", "0 h", "24 h", "72 h")
    )
  )
}

# Combine the tibbles into one tibble and track their origin
untidy_combined <- bind_rows(untidy_1, untidy_2, untidy_3)

# Removing NAs from Treatment and split up Animal Number
for (row_i in rownames(untidy_combined)) {
  untidy_combined[row_i, 1] <- str_extract(string = untidy_combined[row_i, 2], pattern = "[:alpha:]")
  untidy_combined[row_i, 2] <- str_extract(string = untidy_combined[row_i, 2], pattern = "[:digit:]")
}

# Remove duplicate rows. Distinct works like BASH uniq!
tidy_data <- arrange(untidy_combined, untidy_combined[2])
tidy_data <- distinct(tidy_data)

# Saving the clean and tidy table
saveRDS(tidy_data, file = here("Data/tidy_data.rds"))

# Old Data ####
# Now let's tidy up some data from my PhD
# Loading in the tables
excel_positions <- c("B1:E13", "B15:E27", "B29:E41")
for (untidy_i in seq_along(excel_positions)) {
  assign(paste0("untidy_", untidy_i), read_excel(
    path = here("Data/AuswertungMup1Endocytose.xlsx"),
    range = excel_positions[untidy_i],
    col_names = TRUE
    )
  )
}
untidy_combined <- bind_rows(untidy_1, untidy_2, untidy_3,
                             .id = "Replicant") |> fill(Stamm) |> rename(Strain = Stamm, GFP = `26 kDa GFP`)
rawdata <- untidy_combined |> arrange(Strain, min)
rawdata <- mutate(
  .data = rawdata,
  `GFP/PGK1` = (rawdata$GFP / rawdata$PGK1)
)

time_point_mean <- c(numeric(length(rawdata$GFP)))

rawdata <- mutate(
  .data = rawdata,
  `Time Point Mean` = time_point_mean
)

for (time_point_i in 1:12) {
  temp <- 0
  time_point <- c(rawdata[[time_point_i*3, 6]], rawdata[[time_point_i*3-1, 6]], rawdata[[time_point_i*3-2, 6]])
  temp <- mean(time_point)
  rawdata[time_point_i*3,7] <- temp
}

rawdata <- arrange(
  .data = rawdata, Strain, min, desc(Replicant)
)
fill(rawdata, rawdata[, 7])
rawdata <- mutate(
  .data = rawdata,
  `Time Point Mean` = pass()
)
mean_GFP <- (rawdata[[1, 4]] + rawdata[[2, 4]] + rawdata[[3, 4]])/3
rawdata <- mutate(.data = rawdata,
                  normalized = rawdata$GFP / mean_GFP)

# Old Data 2 ####
# Lets do another table

excel_positions <- c("B3:E8", "B10:E15", "B17:E22")
for (untidy_i in seq_along(excel_positions)) {
  assign(paste0("untidy_", untidy_i), read_excel(
    path = here("Data/Auswetung_FLO11.xlsx"),
    range = excel_positions[untidy_i],
    col_names = c("Strain", "HA", "FLAG", "SYN8")
  )
  )
}

untidy_combined <- bind_rows(untidy_1, untidy_2, untidy_3,
                             .id = "Replicant")
rawdata <- untidy_combined

rawdata <- mutate(.data = rawdata,
                  `HA/SYN8` = rawdata$HA / rawdata$SYN8,
                  `FLAG/SYN8` = rawdata$FLAG / rawdata$SYN8)

norm_factor_HA <- mean(c(rawdata[[3,6]], rawdata[[9,6]], rawdata[[15,6]]))
norm_factor_FLAG <- mean(c(rawdata[[3,7]], rawdata[[9,7]], rawdata[[15,7]]))

rawdata <- mutate(.data = rawdata,
                  `norm. HA` = rawdata$`HA/SYN8` / norm_factor_HA,
                  `norm. FLAG` = rawdata$`FLAG/SYN8` / norm_factor_FLAG)

rawdata_wide <- pivot_wider(rawdata,
                            values_from = c(HA, FLAG, SYN8, `HA/SYN8`, `FLAG/SYN8`, `norm. HA`, `norm. FLAG`),
                            names_from = Strain,
                            names_glue = "{.value}@{Strain}")

my_colors <- c("#fde725", "#7ad151", "#22a884", "#2a788e", "#414487", "#440154")

ggplot(rawdata, aes(x = factor(Strain), y = `norm. HA`, fill = Strain)) +
  geom_bar(stat = "summary", fun = "mean") +
  geom_beeswarm(cex = 2, size = 3, alpha = 0.5) +
  scale_fill_manual(values = my_colors)
