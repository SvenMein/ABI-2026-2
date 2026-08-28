pacman::p_load(conflicted, wrappedtools, tidyverse, here, ggh4x,
               palmerpenguins, patchwork, flextable, ggplot2,
               ggbeeswarm, ggsignif)
conflicts_prefer(dplyr::filter, palmerpenguins::penguins)

rawdata <- tibble(penguins)

rawdata <- rawdata |>
  drop_na() |>
  mutate(
  year = factor(year)
  )

# Comparisons between sex and data as Gaussian
rawdata_adelie <- rawdata |>
  filter(species == "Adelie") |>
  group_by(sex)

ggplot(rawdata_adelie, aes(sex, body_mass_g)) +
  geom_beeswarm(cex = 2, size = 2, alpha = 0.25) +
  stat_summary(fun.data = "mean_sdl", color = "red") +
  ylab("Body mass [g] \u00b1 2SD")

t_out <- t.test(
  x = rawdata_adelie$body_mass_g[which(rawdata$sex == "male")],
  y = rawdata_adelie$body_mass_g[which(rawdata$sex == "female")],
  var.equal = var.test(
    rawdata_adelie$body_mass_g ~ rawdata_adelie$sex
  )$p.value > .05
)
ggplot(rawdata_adelie, aes(sex, body_mass_g)) +
  geom_beeswarm(cex = 2, size = 2, alpha = 0.25) +
  stat_summary(fun.data = "mean_sdl", color = "red") +
  geom_signif(
    comparisons = list(c(1, 2)),
    textsize = rel(5),
    vjust = 0,
    tip_length = 0.02,
    annotations = markSign(t_out$p.value)) +
  labs(title = "Comparisons between sex and data as Gaussian") +
  ylab("Body mass [g] \u00b1 2SD")

# Comparisons between sex and data as ordinal
u_out <- wilcox.test(
  x = rawdata_adelie$body_mass_g[which(rawdata$sex == "male")],
  y = rawdata_adelie$body_mass_g[which(rawdata$sex == "female")]
)
ggplot(rawdata_adelie, aes(sex, body_mass_g)) +
  geom_beeswarm(cex = 2, size = 2, alpha = 0.25) +
  stat_summary(fun.data = "mean_sdl", color = "red") +
  geom_signif(
    comparisons = list(c(1, 2)),
    textsize = rel(5),
    vjust = 0,
    tip_length = 0.02,
    annotations = markSign(u_out$p.value)) +
  labs(title = "Comparisons between sex and data as ordinal")

# Comparisons between two species and data as Gaussian
ggplot(rawdata, aes(species, body_mass_g)) +
  geom_beeswarm(cex = 2, size = 2, alpha = 0.25) +
  stat_summary(fun = "mean",
               fun.min = \(x) mean(x) - sd(x),
               fun.max = \(x) mean(x) + sd(x),
               color = "red")
rawdata_ag <- rawdata |>
  filter(species != "Chinstrap")
t_out <- t.test(
  x = rawdata_ag$body_mass_g[which(rawdata$species == "Adelie")],
  y = rawdata_ag$body_mass_g[which(rawdata$species == "Gentoo")],
  var.equal = var.test(
    rawdata_ag$body_mass_g ~ rawdata_ag$species
  )$p.value > .05
)


ggplot(rawdata_ag, aes(species, body_mass_g)) +
  geom_beeswarm(cex = 2, size = 2, alpha = 0.25) +
  stat_summary(fun.data = "mean_sdl", color = "red") +
  geom_signif(
    comparisons = list(c(1, 2)),
    textsize = rel(5),
    vjust = 0,
    tip_length = 0.02,
    annotations = markSign(t_out$p.value)) +
  labs(title = "Comparisons between species and data as Gaussian")

# Comparisons between two species and data as ordinal
u_out <- wilcox.test(
  x = rawdata_ag$body_mass_g[which(rawdata$species == "Adelie")],
  y = rawdata_ag$body_mass_g[which(rawdata$species == "Gentoo")]
)
ggplot(rawdata_ag, aes(species, body_mass_g)) +
  geom_beeswarm(cex = 2, size = 2, alpha = 0.25) +
  stat_summary(fun.data = "mean_sdl", color = "red") +
  geom_signif(
    comparisons = list(c(1, 2)),
    textsize = rel(5),
    vjust = 0,
    tip_length = 0.02,
    annotations = markSign(u_out$p.value)) +
  labs(title = "Comparisons between two species and data as ordinal")

# Advanced

measures <- ColSeeker(
  data = rawdata,
  varclass = c("numeric", "integer")
)

groupvars <- ColSeeker(
  data = rawdata,
  varclass = "factor",
  exclude = c("year", "island")
)

for (group_i in seq(groupvars$count)) {
  result_temp <- compare2numvars(
    data = rawdata_ag,
    dep_vars = measures$names,
    indep_var = groupvars$names[group_i],
    gaussian = TRUE,
    n = TRUE,
    mark = TRUE
  )
  flextable(result_temp) |>
    set_table_properties(layout = "autofit") |>
    flex2rmd()

  plot_temp <- ggplot(rawdata_ag,
                      aes(x = .data[[groupvars$names[group_i]]],
                          y = .data[[measures$names[group_i]]])) +
    geom_beeswarm(cex = 2, size = 2, alpha = 0.25) +
    stat_summary(fun = "mean",
                 fun.min = \(x) mean(x) - sd(x),
                 fun.max = \(x) mean(x) + sd(x),
                 color = "red")
  print(plot_temp)
  rm(result_temp)
  rm(plot_temp)
}

# Categorical data

(crosstable <- table(rawdata$sex, rawdata$species))
fisher_out <- fisher.test(
  table(rawdata$sex, rawdata$species)
)
(fisher_out$p.value)

(crosstable <- table(rawdata$sex, rawdata$island))
fisher_out <- fisher.test(
  table(rawdata$sex, rawdata$island)
)
(fisher_out$p.value)

ggplot(rawdata, aes(x = island, fill = sex)) +
  geom_bar() +
  geom_text(stat = "count", aes(label = after_stat(count)),
            position = position_stack(vjust = .5)) +
  scale_y_continuous("count")

factvars <- ColSeeker(
  data = rawdata,
  varclass = "factor"
)
rawdata |>
  compare2qualvars(
    dep_vars = factvars$names[-3],
    indep_var = factvars$names[3]
  ) |>
  rename_with(\(x) str_remove(x, "sex ")) |>
  rename(`Total sample` = desc_all) |>
  flextable() |>
  align(~ p == " ", j = 1, align = "center") |>
  bg(~ p != " ", bg = "lightgrey")
