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
#   ? apply to train/test data now or in workflow?
# 7. Train model
#   a. define model specification
#   b. define workflow
#   c. fit workflow to traindata
# 8. Evaluate model by table/figures
#   a. predict class
#   b. predict class probs
#   c. crosstables
#   d. figure

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

# 5. Train-test split ####

set.seed(20260900)
data_split <-
  rawdata |>
  select(Tissuetype, contains("_")) |>
  initial_split(
    prop = .7,
    strata = Tissuetype
  )
traindata <- training(data_split)
testdata <- testing(data_split)

# 6. Preprocessing: ####
#   a. make them less skewed
#   b: get rid of nzv
#   c. get rid of correlated rna?
#   d. scale them (range?)

# Build recipe for scaling

rec_rna <- recipe(
  x = traindata) |>
  update_role(Tissuetype, new_role = "outcome") |>
  update_role(contains("_"), new_role = "predictor") |>
  step_nzv(all_predictors()) |>
  step_YeoJohnson(all_predictors()) |>
  # step_best_normalize(all_predictors()) |>
  step_corr(all_predictors(),
    method = "spearman") |>
  step_percentile(all_predictors(),
    outside = "both")

# Fit recipe and apply to data
traindata_s <-
  rec_rna |>
  prep() |>
  bake(new_data = traindata) |>
  relocate(Tissuetype, .before = 1)
testdata_s <-
  rec_rna |>
  prep() |>
  bake(new_data = testdata) |>
  relocate(Tissuetype, .before = 1)

predvars <- ColSeeker(traindata_s, "\\d")
# Exploratory 2 ####
ks_out <- traindata_s |>
  select(-Tissuetype) |>
  summarise(across(
    everything(),
    ~ ksnormal(.x)
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
  group_by(pKS < .05) |>
  count()
traindata_s |>
  select(Tissuetype, all_of(sample(predvars$names, 16))) |>
  pivot_longer(-Tissuetype) |>
  ggplot(aes(value, fill = Tissuetype)) +
  geom_density(alpha = .2) +
  facet_wrap(facets = vars(name), scales = "free")

explore_s <- traindata_s |>
  select(-Tissuetype) |>
  summarise(across(
    everything(),
    list(
      Mean = ~ mean(.x, na.rm = T),
      Median = ~ median(.x, na.rm = T),
      SD = ~ sd(.x, na.rm = T)
    )
  )) |>
  pivot_longer(everything(),
    names_to = c("miRNA", ".value"),
    names_pattern = "(.+)_([MS].+)"
  )

ggplot(
  traindata_s,
  aes(.data[["let_7a"]],
    .data[["let_7c"]],
    color = Tissuetype
  )
) +
  geom_point(alpha = .5) +
  geom_mark_hull()


# 7. Train model

knn_spec <- nearest_neighbor(neighbors = 3) |>
  set_engine("kknn") |>
  set_mode("classification")

knn_workflow <- workflow() |>
  add_model(knn_spec) |>
  add_formula(Tissuetype ~ .)

knn_workflow2 <- workflow() |>
  add_model(knn_spec) |>
  add_recipe(rec_rna)

# Fit the model to the training data
knn_fit <- knn_workflow |>
  fit(data = traindata_s)
knn_fit2 <- knn_workflow2 |>
  fit(data = traindata)
# Predict classes
predictions <- knn_fit |>
  predict(new_data = testdata_s)
predictions2 <- knn_fit2 |>
  predict(new_data = testdata)
prob_preds <- knn_fit |>
  predict(new_data = testdata, type = "prob")
# Combine with original data to check accuracy
results <- testdata |>
  select(Tissuetype) |>
  bind_cols(predictions, prob_preds)


# 8. Evaluate model by table/figures ####

results |>
  pivot_longer(
    cols = where(is.numeric),
    names_to = "prob_class", values_to = "prob"
  ) |>
  ggplot(aes(prob_class, prob)) +
  geom_violin() +
  geom_beeswarm(cex = .5, alpha = .25) +
  facet_grid(
    rows = vars(Tissuetype),
    labeller = "label_both"
  )

CrossTable(results$.pred_class, results$Tissuetype,
  prop.chisq = F, prop.t = F,
  format = "SPSS", fisher = F
)

caret::confusionMatrix(results$.pred_class,
  reference = results$Tissuetype,
  positive = "Tumor"
)

yardstick::accuracy(
  data = results,
  truth = Tissuetype,
  estimate = .pred_class,
  event_level = "second"
)
yardstick::sensitivity(
  data = results,
  truth = Tissuetype,
  estimate = .pred_class,
  event_level = "second"
)
yardstick::specificity(
  data = results,
  truth = Tissuetype,
  estimate = .pred_class,
  event_level = "second"
)
yardstick::ppv(
  data = results,
  truth = Tissuetype,
  estimate = .pred_class,
  event_level = "second"
)
yardstick::npv(
  data = results,
  truth = Tissuetype,
  estimate = .pred_class,
  event_level = "second"
)
