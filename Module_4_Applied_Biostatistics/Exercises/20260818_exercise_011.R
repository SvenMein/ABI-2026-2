pacman::p_load(conflicted, wrappedtools, tidyverse, here, ggh4x, palmerpenguins, patchwork)
conflicts_prefer(dplyr::filter, palmerpenguins::penguins)

rawdata <- tibble(penguins) |> drop_na()

# Single measure, all penguins, plot and test ####
ggplot(rawdata, aes(body_mass_g)) +
  geom_density(fill = "lightblue", alpha = 0.5) +
  stat_function(
    fun = dnorm,
    args = list(
      mean = mean(rawdata$body_mass_g),
      sd = sd(rawdata$body_mass_g)
    ),
    color = "red",
    linewidth = 1.2
  ) +
  scale_x_continuous(
    limits = c(
      mean(rawdata$body_mass_g) - 3 * sd(rawdata$body_mass_g),
      mean(rawdata$body_mass_g) + 3 * sd(rawdata$body_mass_g)
    )
  )

numvars <- ColSeeker(
  data = rawdata,
  namepattern = "._."
)
results <- tibble(
  Variables = numvars$names,
  pKS = NA_real_,
  pSh = NA_real_
)

for (var_i in seq_len(numvars$count)) {
  results$pKS[var_i] <-
    ksnormal(rawdata[[numvars$names[var_i]]])
  results$pSh[var_i] <-
    shapiro.test(rawdata |>
                   pull(numvars$names[var_i])) |>
    pluck("p.value")
}
results <- mutate(results,
                  pKS = formatP(pKS, ndigits = 5, mark = TRUE),
                  pSh = formatP(pSh, ndigits = 5, mark = TRUE)
                  )
head(results)

# Single measure, by species/sex, plot and test ####

plot_temp <- ggplot(rawdata, aes(body_mass_g)) +
  geom_density(fill = "lightblue", alpha = 0.5)
plot_temp + facet_grid(
  rows = vars(sex),
  cols = vars(species),
  margins = TRUE,
  scales = "free"
) + stat_theodensity(distri = "norm", linewidth = 1, color = "red")
plot_temp <- ggplot(rawdata, aes(bill_length_mm)) +
  geom_density(fill = "lightblue", alpha = 0.5)
plot_temp + facet_grid(
  rows = vars(sex),
  cols = vars(species),
  margins = TRUE,
  scales = "free"
) + stat_theodensity(distri = "norm", linewidth = 1, color = "red")
plot_temp <- ggplot(rawdata, aes(bill_depth_mm)) +
  geom_density(fill = "lightblue", alpha = 0.5)
plot_temp + facet_grid(
  rows = vars(sex),
  cols = vars(species),
  margins = TRUE,
  scales = "free"
) + stat_theodensity(distri = "norm", linewidth = 1, color = "red")
plot_temp <- ggplot(rawdata, aes(flipper_length_mm)) +
  geom_density(fill = "lightblue", alpha = 0.5)
plot_temp + facet_grid(
  rows = vars(sex),
  cols = vars(species),
  margins = TRUE,
  scales = "free"
) + stat_theodensity(distri = "norm", linewidth = 1, color = "red")

rawdata |> group_by(species, sex) |> summarise(
  pKS = ksnormal(body_mass_g),
  pSh = shapiro.test(body_mass_g) |> pluck("p.value")
)

# all measures within species

numvars <- ColSeeker(data = rawdata, namepattern = "_")

for (measurement_i in numvars$names) {
  plot_temp <- ggplot(rawdata, aes(x = .data[[measurement_i]])) +
    geom_density(fill = "lightblue", alpha = 0.5) +
    stat_theodensity(distri = "norm", linewidth = 1, color = "red") +
    facet_grid(
      rows = vars(species),
    )
  print(plot_temp)
}
rm(plot_temp)

for (measurement_i in numvars$names) {
  output <- rawdata |> group_by(species) |> summarise(
    pKS = ksnormal(.data[[measurement_i]]),
    pSh = shapiro.test(.data[[measurement_i]]) |> pluck("p.value")
  )
  cat("#####", measurement_i, "#####")
  print(output)
}

# All measures within species and sex

for (measurement_i in numvars$names) {
  plot_temp <- ggplot(rawdata, aes(x = .data[[measurement_i]])) +
    geom_density(fill = "lightblue", alpha = 0.5) +
    stat_theodensity(distri = "norm", linewidth = 0.5, color = "red") +
    facet_grid(
      rows = vars(sex),
      cols = vars(species)
    )
  print(plot_temp)
  output <- rawdata |> group_by(species, sex) |> summarise(
    pKS_Lillie = ksnormal(.data[[measurement_i]]) |>
      formatP(mark = TRUE, ndigits = 3, pretext = TRUE),
    pKS = ksnormal(.data[[measurement_i]], lillie = FALSE) |>
      formatP(mark = TRUE, ndigits = 3, pretext = TRUE),
    pSh = shapiro.test(.data[[measurement_i]]) |> pluck("p.value")|>
      formatP(mark = TRUE, ndigits = 3, pretext = TRUE),
    `Normal distributed` = ifelse(
      test = ksnormal(.data[[measurement_i]], lillie = FALSE) >= 0.05,
      yes = "yes",
      no = "no")
  )
  output <- rename(output, Species = species, Sex = sex)
  print(flextable(output) |> set_caption(measurement_i) |>
          set_table_properties(layout = "autofit") |>
          hline(seq(2, 6, 2)) |> merge_v(j = 1) |>
    bold(part = "header"))
}
rm(plot_temp)
rm(output)
