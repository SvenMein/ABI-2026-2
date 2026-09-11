# Immigration data glm #####

# setup ####
pacman::p_load(conflicted, tidyverse, wrappedtools, broom, car,
  rlist, flextable,
  patchwork, ggbeeswarm, ggsignif,
  carData, pROC)
conflicts_prefer(dplyr::filter,
  dplyr::select)
# import ####
rawdata <- as_tibble(Greene)
table(rawdata$nation, rawdata$decision)
rawdata <-
  mutate(rawdata,
    nation = fct_lump_min(nation, min = 15) |>
      fct_infreq(),
    location = fct_recode(location, "Other" = "other") |>
      fct_infreq(),
    judge = fct_infreq(judge),
    language = fct_infreq(language)
  )
pred_vars <- ColSeeker(namepattern = c("ju", "tio", "lan"))
# graphical exploration ####
for (var_i in pred_vars$names) {
  abs_plot <-
    ggplot(rawdata, aes(x = .data[[var_i]], fill = decision)) +
    geom_bar() +
    scale_fill_manual(values = c("coral", "aquamarine4")) +
    coord_flip()
  rel_plot <-
    ggplot(rawdata, aes(x = .data[[var_i]], fill = decision)) +
    geom_bar(position = "fill") +
    scale_y_continuous("Frequency",
      labels = scales::percent) +
    scale_fill_manual(values = c("coral", "aquamarine4")) +
    coord_flip()
  print(abs_plot / rel_plot)
}

# result structures ####
uni_glms <- tibble(predictor = NA_character_,
  OR = NA_real_,
  CI_low = NA_real_,
  CI_high = NA_real_,
  CIs = NA_character_,
  p.value = NA_character_,
  .rows = 0)
uni_anovas <- tibble(variable = NA_character_,
  p.value = NA_character_,
  AIC = NA_real_,
  BIC = NA_real_,
  .rows = 0)

for (var_i in pred_vars$names) {
  uni_formula <- reformulate(var_i, response = "decision")
  uni_glm <- glm(uni_formula, data = rawdata, family = binomial)
  print(uni_glm)
  uni_tidy <- tidy(uni_glm) |>
    slice(-1) |>
    mutate(
      OR_uni = exp(estimate) |>
        roundR(textout = FALSE),
      CI_low = exp(confint(uni_glm))[-1, 1],
      CI_high = exp(confint(uni_glm))[-1, 2],
      CI_uni = paste(roundR(CI_low), roundR(CI_high), sep = " / "))
  uni_glms <- add_row(uni_glms,
    predictor = uni_tidy$term |>
      str_replace("([:lower:])([:upper:])",
        "\\1: \\2"),
    OR = uni_tidy$OR_uni,
    CI_low = uni_tidy$CI_low,
    CI_high = uni_tidy$CI_high,
    CIs = uni_tidy$CI_uni,
    p.value = formatP(uni_tidy$p.value,
      mark = TRUE))
  uni_anovas <-
    add_row(uni_anovas,
      variable = var_i,
      p.value = Anova(uni_glm)$`Pr(>Chisq)` |>
        formatP(mark = TRUE),
      AIC = AIC(uni_glm),
      BIC = BIC(uni_glm))
}
uni_glms <-
  uni_glms |>
  separate(predictor, c("Variable", "Group"), sep = ": ",
    remove = FALSE)
uni_anovas
# forrestplot ####
x11(title = "univariable")
baseplot <- ggplot(uni_glms,
  aes(x = predictor, y = OR)) +
  geom_pointrange(aes(ymin = CI_low,
    ymax = CI_high)) +
  coord_flip() +
  geom_hline(yintercept = 1,
    linewidth = .2, linetype = 2)
baseplot +
  geom_label(aes(label = p.value), vjust = 1.5, color = "red",
    size = 2.0) +
  scale_y_log10(
    breaks = logrange_12357,
    minor_breaks = logrange_123456789,
    guide = guide_axis(n.dodge = 2),
    labels = prettyNum,
    expand = expansion(mult = .1)) +
  scale_x_discrete(expand = expansion(mult = c(.05, .05))) +
  labs(caption = "Results from univariable glms,\nOddsRatios shown on log-scale") +
  xlab(NULL)

# multivariable additive model ####
multi_formula <- reformulate(pred_vars$names, response = "decision")
multi_glm <- glm(multi_formula, data = rawdata, family = binomial)
print(multi_glm)
multi_tidy <- tidy(multi_glm) |>
  slice(-1) |>
  rowwise() |>
  mutate(
    OR_multi = exp(estimate) |>
      roundR(textout = FALSE)) |>
  ungroup() |>
  mutate(
    CI_low = exp(confint(multi_glm))[-1, 1],
    CI_high = exp(confint(multi_glm))[-1, 2],
    CI_multi = paste(roundR(CI_low), roundR(CI_high), sep = " / "))
multi_glms <- tibble(
  predictor = multi_tidy$term |>
    str_replace("([:lower:])([:upper:])",
      "\\1: \\2"),
  OR = multi_tidy$OR_multi,
  CI_low = multi_tidy$CI_low,
  CI_high = multi_tidy$CI_high,
  CIs = multi_tidy$CI_multi,
  p.value = formatP(multi_tidy$p.value,
    mark = TRUE))
multi_anovas <-
  tibble(variable = pred_vars$names,
    p.value = Anova(multi_glm)$`Pr(>Chisq)` |>
      formatP(mark = TRUE),
    AIC = AIC(multi_glm),
    BIC = BIC(multi_glm))
x11(title = "multivariable")

baseplot <- ggplot(multi_glms,
  aes(x = predictor, y = OR)) +
  geom_pointrange(aes(ymin = CI_low,
    ymax = CI_high)) +
  coord_flip() +
  geom_hline(yintercept = 1,
    linewidth = .2, linetype = 2)
baseplot +
  geom_label(aes(label = p.value), vjust = 1.5, color = "red",
    size = 2.0) +
  scale_y_log10(
    breaks = logrange_12357,
    minor_breaks = logrange_123456789,
    guide = guide_axis(n.dodge = 2),
    labels = prettyNum,
    expand = expansion(mult = .1)) +
  scale_x_discrete(expand = expansion(mult = c(.05, .05))) +
  labs(caption = "Results from multivariable glms,\nOddsRatios shown on log-scale") +
  xlab(NULL)


# multivariable interaction model ####
multi_star_formula <- "decision ~ judge * nation + language + location"
multi_star_glm <- glm(multi_star_formula, data = rawdata, family = binomial)
print(multi_star_glm)
multi_star_tidy <- tidy(multi_star_glm) |>
  slice(-1) |>
  rowwise() |>
  mutate(
    OR_multi = exp(estimate) |>
      roundR(textout = FALSE)) |>
  ungroup() |>
  mutate(
    CI_low = exp(confint(multi_star_glm))[-1, 1],
    CI_high = exp(confint(multi_star_glm))[-1, 2],
    CI_multi = paste(roundR(CI_low), roundR(CI_high), sep = " / "))
multi_star_glms <- tibble(
  predictor = multi_star_tidy$term |>
    str_replace("([:lower:])([:upper:])",
      "\\1: \\2"),
  OR = multi_star_tidy$OR_multi,
  CI_low = multi_star_tidy$CI_low,
  CI_high = multi_star_tidy$CI_high,
  CIs = multi_star_tidy$CI_multi,
  p.value = formatP(multi_star_tidy$p.value,
    mark = TRUE))
Anova(multi_star_glm, type = 3)
