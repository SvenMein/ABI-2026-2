pacman::p_load(
  conflicted, tidyverse, wrappedtools, here,
  readxl, readODS, foreign, haven
)

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










