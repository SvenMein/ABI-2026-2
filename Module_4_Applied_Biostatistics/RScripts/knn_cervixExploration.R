# workplan / to-dos
# 1. Load packages
# 2. Load data (already prepared)
# 3. test normality, possibly after transformation
# 4. Explore classification by 2..3 variables
# 5. Train-test split
# 6. Preprocessing:
#   a. make them less skewed
#   b: get rid of nzv
#   c. get rid of correlated rna?
#   d. scale them (range?)
# 7. Train model
# 8. Evaluate model by table/figures

# 1. Load packages ####

pacman::p_load(
  conflicted,
  tidyverse,
  wrappedtools, # just tools
  ggforce, # for cluster plots, hulls, zoom etc
  ggbeeswarm,
  # caret, # Classification and Regression Training
  # preprocessCore, # pre-processing functions
  gmodels, # tools for model fitting
  easystats,
  yardstick,
  tidymodels,
  bestNormalize
)

# conflict_scout()
conflicts_prefer(dplyr::slice, dplyr::filter)
# 2. Load data (already prepared) ####
rawdata <- readRDS("Data/cervical.RDS")
# renaming as knn3() can't handle illegal names
# cn(rawdata_cleannames)[1:20]
predvars <- ColSeeker(namepattern = "\\d") # regex for decimal
# 3. test normality, possibly after transformation ####

# exploratory 1 ####
rawdata |>
  select(Tissuetype, all_of(sample(predvars$names, 16))) |>
  pivot_longer(-Tissuetype) |>
  ggplot(aes(value, fill = Tissuetype)) +
  geom_density(alpha = .2) +
  facet_wrap(facets = vars(name), scales = "free")

ks_out <- rawdata |>
  select(all_of(predvars$names)) |>
  summarise(across(
    everything(),
    ~ ksnormal(log(.x + 1))
  )) |>
  pivot_longer(everything(), values_to = "pKS") |>
  arrange(pKS)
ks_out |>
  ggplot(aes(pKS)) +
  scale_x_continuous(
    breaks = seq(0, 1, .1),
    minor_breaks = seq(0, 1, .01)
  ) +
  geom_histogram(binwidth = .01) # bins=20)

ks_out |>
  group_by(pKS <= .05) |>
  count()
# table(ks_out$pKS < .05)

explore <- rawdata |>
  select(Tissuetype, all_of(predvars$names)) |>
  group_by(Tissuetype) |>
  summarise(across(
    everything(),
    list(
      Mean = ~ mean(.x, na.rm = T),
      Median = ~ median(.x, na.rm = T),
      SD = ~ sd(.x, na.rm = T)
    ),
    .names = "{.col}__{.fn}"
  )) |>
  pivot_longer(-Tissuetype,
    names_to = c("miRNA", ".value"),
    names_sep = "__"
  )
explore |>
  ggplot(aes(Median + 0.001, fill = Tissuetype)) +
  geom_histogram(position = "dodge") +
  scale_x_log10(
    breaks = logrange_1,
    minor_breaks = logrange_123456789,
    labels = prettyNum
  )
explore |>
  ggplot(aes(Median + 0.001, fill = Tissuetype)) +
  geom_histogram(position = "fill") +
  scale_x_log10(
    breaks = logrange_1,
    minor_breaks = logrange_123456789
  ) +
  scale_y_continuous("Frequency", labels = scales::percent)

explore |>
  ggplot(aes(Median + 0.1, color = Tissuetype)) +
  geom_line(stat = "bin") +
  scale_x_log10(labels = prettyNum)

explore |>
  ggplot(aes(y = Median + 0.1, x = Tissuetype)) +
  geom_boxplot() +
  scale_y_log10(
    breaks = logrange_15,
    minor_breaks = logrange_123456789,
    labels = prettyNum
  )

# 4. Explore classification by 2..3 variables ####
ggplot(
  rawdata,
  aes(.data[[predvars$names[1]]],
    .data[[predvars$names[3]]],
    color = Tissuetype
  )
) +
  geom_point(alpha = .5) +
  scale_x_log10(
    breaks = logrange_1,
    minor_breaks = logrange_123456789,
    labels = prettyNum
  ) +
  scale_y_log10(
    breaks = logrange_1,
    minor_breaks = logrange_123456789,
    labels = prettyNum
  )
