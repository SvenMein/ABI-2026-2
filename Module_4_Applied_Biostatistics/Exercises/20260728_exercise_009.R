# Exercise 1
pacman::p_load(palmerpenguins)
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
penguins
penguins <- drop_na(penguins)
#
# Vizualize the following:count of sex within species
#
ggplot(penguins, aes(x = species, fill = sex)) + geom_bar()
# boxplot + beeswarm for weight and species
#
ggplot(penguins, aes(species, body_mass_g, fill = sex)) +
  geom_boxplot(outlier.alpha = 0, alpha = 0.5) +
  geom_beeswarm(cex = 0.9, alpha = 0.5, dodge.width = 0.75, aes(color = sex), shape = 21, size = 2, col = "black")

ggplot(penguins, aes(species, body_mass_g, fill = sex)) +
  geom_boxplot(outlier.alpha = 0, alpha = 0.5) +
  geom_beeswarm(cex = 0.9, alpha = 0.5, dodge.width = 0.75, aes(shape = sex), size = 2)

# scatterplot for flipper length vs. body mass
#
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) + geom_point()
# add a regression line to that plot
#
ggplot(penguins, aes(y = flipper_length_mm, x = body_mass_g)) +
  geom_point() + geom_smooth(se = FALSE)
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point() + geom_smooth()
ggplot(penguins, aes(y = flipper_length_mm, x = body_mass_g)) +
  geom_point() + geom_smooth(method = "lm")
# do the same scatterplot and regression grouped by species and sex
#
ggplot(penguins, aes(y = flipper_length_mm, x = body_mass_g, color = sex, shape = species)) +
  geom_point() + geom_smooth(method = "lm", se = FALSE) +
  geom_smooth()
# optionally, define your own colors for species (scale or name or rgb)
ggplot(penguins, aes(y = flipper_length_mm, x = body_mass_g, color = sex, shape = species)) +
  geom_point(size = 2) + scale_color_manual( values = c("#fde725", "#440154"))
