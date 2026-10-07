pacman::p_load(conflicted, wrappedtools, tidyverse, here, ggh4x,
               palmerpenguins, patchwork, flextable, ggplot2,
               ggbeeswarm, ggsignif, broom, performance, car, multcomp, emmeans)
conflicts_prefer(dplyr::filter, palmerpenguins::penguins)

rawdata <- tibble(penguins)

rawdata <- rawdata |>
  drop_na()
adelie <- rawdata |> filter(species == "Adelie")

# General graphical exploration ####
ggplot(rawdata, aes(
  x = body_mass_g,
  y = flipper_length_mm)) +
  geom_point(alpha = 0.25) +
  geom_smooth(method = "lm") +
  facet_grid(cols = vars(species), margins = TRUE)

ggplot(rawdata, aes(
  x = body_mass_g,
  y = bill_depth_mm)) +
  geom_point(alpha = 0.25) +
  geom_smooth(method = "lm") +
  facet_grid(cols = vars(species), margins = TRUE)

# Adelies only ####
## Flipper length ~ Body mass
### Linear regression ####
#### Graphical exploration ####
ggplot(adelie, aes(body_mass_g, flipper_length_mm)) +
  geom_point() +
  geom_smooth() +
  geom_smooth(method = lm, se = FALSE, color = "red")

#### Modelling ####
regression_out <- lm(flipper_length_mm ~ body_mass_g, data = adelie)
tidy(regression_out)
anova_out <- anova(regression_out)
tidy(anova_out)
check_model(regression_out)

#### Adjusting ####
adelie <- mutate(
  adelie,
  flipper_length_adj = regression_out$residuals +
    mean(flipper_length_mm))

ggplot(adelie, aes(body_mass_g, flipper_length_adj)) +
  geom_point() +
  geom_smooth(method = "lm") +
  ylab("adjusted flipper length [mm]") +
  xlab("weight [g]")

## Bill depth ~ Body mass ####
### Linear regression ####
#### Graphical exploration ####
ggplot(adelie, aes(body_mass_g, bill_depth_mm)) +
  geom_point() +
  geom_smooth() +
  geom_smooth(method = lm, se = FALSE, color = "red")

#### Modelling ####
regression_out <- lm(bill_depth_mm ~ body_mass_g, data = adelie)
tidy(regression_out)
anova_out <- anova(regression_out)
tidy(anova_out)
check_model(regression_out)

#### Adjusting ####
adelie <- mutate(
  adelie,
  bill_depth_adj = regression_out$residuals +
    mean(bill_depth_mm))

ggplot(adelie, aes(body_mass_g, bill_depth_adj)) +
  geom_point() +
  geom_smooth(method = "lm")

# All penguins in an ANOVA like model ####
## Graphical exploration ####
p0 <- ggplot(rawdata, aes(x = species, y = flipper_length_mm)) +
  geom_violin(draw_quantiles = c(0.25, 0.5, 0.75)) +
  geom_beeswarm(alpha = 0.5) +
  stat_summary(fun = "mean", geom = "point", shape = "x",
               size = 10, colour = "red")
p0

p1 <- ggplot(rawdata, aes(x = species, y = flipper_length_mm, color = sex)) +
  geom_boxplot() +
  stat_summary(geom = "point", shape = "x",
               size = 10)
p2 <- ggplot(rawdata, aes(sex, flipper_length_mm, color = species)) +
  geom_boxplot() +
  stat_summary(geom = "point", shape = "x",
               size = 10)
p3 <- ggplot(rawdata, aes(species, flipper_length_mm)) +
  geom_boxplot() +
  facet_wrap(facets = vars(sex))
(p1 + p2) / p3

p4 <- ggplot(rawdata, aes(x = species, y = bill_depth_mm, color = sex)) +
  geom_boxplot() +
  stat_summary(geom = "point", shape = "x",
               size = 10)
p5 <- ggplot(rawdata, aes(sex, bill_depth_mm, color = species)) +
  geom_boxplot() +
  stat_summary(geom = "point", shape = "x",
               size = 10)
p6 <- ggplot(rawdata, aes(species, bill_depth_mm)) +
  geom_boxplot() +
  facet_wrap(facets = vars(sex))
(p4 + p5) / p6

## Flipper length ~ species
### Modelling ####
lm_out <- lm(flipper_length_mm ~ species, data = rawdata)
tidy(lm_out)
anova_out <- anova(lm_out)
anova_out
check_model(lm_out)

### Post-hoc analysis ####
pt_out <- pairwise.t.test(
  x = rawdata$flipper_length_mm,
  g = rawdata$species,
  p.adjust.method = "fdr"
)
pt_out
formatP(pt_out$p.value)

p0 + geom_signif(
  comparisons = list(c(1, 2), c(2, 3), c(1, 3)),
  annotations = paste("p",formatP(pt_out$p.value[-3], pretext = TRUE)),
  step_increase = 0.15,
  map_signif_level = TRUE)

## Flipper length ~ species, sex ####
### Modelling ####
lm_interaction <- lm(flipper_length_mm ~ species * sex,
                     data = rawdata)
tidy(lm_interaction)
Anova_interaction_out <- Anova(lm_interaction, type = 3)
Anova_interaction_out

lm_additive <- lm(flipper_length_mm ~ species + sex,
                  data = rawdata)
tidy(lm_additive)
Anova_additive_out <- Anova(lm_additive, type = 2)
Anova_additive_out

x11()
check_model(lm_interaction)
x11()
check_model(lm_additive)
dev.off()

### Post-hoc analysis ####
tukey_out_total <- summary(glht(
  model = lm_interaction,
  linfct = mcp(species = "Tukey", sex = "Tukey")
))
tukey_out_total

ggplot(rawdata, aes(species, flipper_length_mm)) +
  geom_beeswarm(dodge.width = 0.75, alpha = 0.25) +
  stat_summary(fun.data = mean_se,
               position = position_dodge(width = 0.75),
               shape = "-", size = 2) +
  geom_signif(
    comparisons =
  )

tukey_out_total$test$pvalues[1]

geom_signif(
  comparisons = list(c(1, 2), c(1, 3), c(2, 3)),
  annotations = paste("p <",pt_out$p.value[-3]),
  step_increase = 0.15,
  map_signif_level = TRUE
)

# emmeans() for nested analysis
nested_p <- emmeans(lm_interaction,
                             ~ sex | species) |>
  pairs() |> tidy()

## Bill depth ~ species, sex ####
### Modelling ####
lm_interaction <- lm(bill_depth_mm ~ species * sex,
                     data = rawdata)
tidy(lm_interaction)
Anova_interaction_out <- Anova(lm_interaction, type = 3)
Anova_interaction_out

lm_additive <- lm(bill_depth_mm ~ species + sex,
                  data = rawdata)
tidy(lm_additive)
Anova_additive_out <- Anova(lm_additive, type = 2)
Anova_additive_out

x11()
check_model(lm_interaction)
x11()
check_model(lm_additive)
dev.off()

### Post-hoc analysis ####
tukey_out_species <- summary(glht(
  model = lm_additive,
  linfct = mcp(species = "Tukey")
))
tukey_out_species

tukey_out_sex <- summary(glht(
  model = lm_additive,
  linfct = mcp(sex = "Tukey")
))
tukey_out_sex

# Flipper Length ~ species, sex, weight ####
## Graphical exploration
ggplot(rawdata, aes(x = species, y = flipper_length_mm, color = sex)) +
  geom_beeswarm(alpha = 0.25, dodge.width = 0.5) +
  stat_summary(fun.data = "mean_cl_boot", position = position_dodge(width = 0.5))

ggplot(rawdata, aes(x = body_mass_g,
                    y = flipper_length_mm,
                    color = species, shape = sex)) +
  geom_point() +
  geom_smooth(method = "lm")

ggplot(rawdata, aes(x = species,
                    y = flipper_length_mm,
                    color = sex, size = body_mass_g)) +
  geom_beeswarm(alpha = 0.25, dodge.width = 0.5) +
    stat_summary(fun.data = "mean_cl_boot", position = position_dodge(width = 0.5))

## Modelling ####
lm_interaction_all <- lm(flipper_length_mm ~ species * sex * body_mass_g, data = rawdata)
tidy(lm_interaction_all)
check_model(lm_interaction_all)
anova_out <- Anova(lm_interaction_all, type = 3)
tidy(anova_out)
# Check which interactions are significant; remove all non significant from model

lm_interaction_mixed <- lm(flipper_length_mm ~ (species * sex) + body_mass_g, data = rawdata)
tidy(lm_interaction_mixed)
check_model(lm_interaction_mixed)
anova_out <- Anova(lm_interaction_mixed)
tidy(anova_out)

## Post-hoc analysis ####
tukey_out <- summary(glht(
  model = lm_interaction_mixed,
  linfct = mcp(species = "Tukey", sex = "Tukey")))
tukey_out
