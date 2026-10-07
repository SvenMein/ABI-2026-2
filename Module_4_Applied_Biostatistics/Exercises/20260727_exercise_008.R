# Exercise:Reshaping Data ####
#
# Scenario:You are a biologist studying the growth of chicks under different diets. The ChickWeight dataset in R contains observations on the # weight of chicks over time, grouped by individual chick and diet. Understanding how to reshape data is crucial for different types of analyses # and visualizations.
#
# Goal:Practice transforming data between "long" and "wide" formats using pivot_wider() and pivot_longer().
#
pacman::p_load(conflicted, tidyverse, wrappedtools)
rawdata <- as_tibble(ChickWeight)
head(rawdata)

# Part 1:From Long to Wide (pivot_wider()) ####
#
# Sometimes, you might want to see all the measurements for a single individual (e.g., a chick) laid out in one row, with each time point # becoming a separate column. This "wide" format can be useful for quick visual comparison of an individual's trajectory or for certain # statistical tests that expect a specific column structure.
#
# Instructions:
#
# Inspect the original data:
#
# Type head(ChickWeight) and str(ChickWeight) to understand its current "long" format (each row is a single observation of weight at a specific # time for a specific chick).
#
# Notice the Time and weight columns.
#
# Transform to Wide Format:
#
# Use pivot_wider() to transform the ChickWeight dataset.
#
# You want Time values to become new column names.
#
# You want the weight values to fill these new columns.
#
# Each row should represent a unique Chick and Diet.
#
# Hint: Think about id_cols, names_from, and values_from.
#
rawdata_wide <- pivot_wider(
  data = rawdata,
  id_cols = c(Chick, Diet),
  names_from = Time,
  names_glue = "{.value} [g] day {Time}",
  values_from = weight
)
rawdata_wide


# Reflect:
#
# What are the new column names?
#
# What does NA mean in this new chick_weight_wide dataset? (Hint: Not all chicks were measured at all time points, or some started later).
#
# Part 2: From Wide to Long (pivot_longer()) ####
#
# Imagine you received data from a collaborator where each time point (e.g., Day 0, Day 2, Day 4, etc.) is its own column. For many biological # analyses, especially for plotting time series with ggplot2 or running mixed-effects models, you need this data in a "long" format, where all # the measurements are in a single weight column, and there's a separate Time column indicating when that measurement was taken.
#
# Instructions:Start with the wide data:We will use the chick_weight_wide tibble you created in Part 1.
#
# Transform to Long Format:Use pivot_longer() on chick_weight_wide (or chick_weight_wide_example).
#
# You want to gather all the columns that represent Time points (e.g., 0, 2, 4, ..., 21) into two new columns:one for the Time itself and one # for the weight measurement.
#
# Hint:Think about cols, names_to, and values_to. You might also need names_transform to convert the Time column back to a numeric type.
#
rawdata_long <- pivot_longer(
  data = rawdata_wide,
  cols = contains("day"),
  names_to = c(".value", "Day"),
  names_sep = " day ",
  names_transform = list(Day = as.integer)
) |> drop_na()

# Reflect:Compare chick_weight_long to the original ChickWeight dataset. Are they identical in structure (ignoring the order of columns /
#                                                                                                           rows which might vary slightly) ?

