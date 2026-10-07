# Exercise 2
#
# distribution of body mass by species and sex (density, histogram)
#
# without / with facetting
pacman::p_load(
  conflicted, tidyverse, wrappedtools, palmerpenguins,
  ggbeeswarm, ggridges, patchwork
)
conflicts_prefer(
  dplyr::filter,
  palmerpenguins::penguins
)
# Density plot with faceting

penguins |> drop_na() |>
  ggplot(aes(body_mass_g)) +
  geom_density(alpha = .5, fill = "#fde725") +
  facet_grid(
    rows = vars(sex), cols = vars(species),
    margins = TRUE
  )

# Histo + with faceting
penguins |> drop_na() |>
  ggplot(aes(body_mass_g)) +
  geom_histogram(fill = "lightblue", color = "black") +
  facet_grid(
    rows = vars(species), cols = vars(sex),
    margins = TRUE
  )

# Ridges-Plot
penguins |> drop_na() |>
  ggplot(aes(body_mass_g, y = species, fill = sex)) +
    geom_density_ridges(alpha = 0.5)

penguins |> drop_na() |>
  ggplot(aes(body_mass_g, y = interaction(sex, species))) +
    geom_density_ridges(alpha = 0.5, fill = "orange")

penguins |> drop_na() |>
  ggplot(aes(body_mass_g, color = species, linetype = sex)) +
  geom_freqpoly()

penguins |> drop_na() |>
  ggplot(aes(body_mass_g, flipper_length_mm)) +
  geom_density_2d_filled(bins = 10) + labs(
    title = "2D Density Contours",
    caption = "lighter -> more frequent"
  )
