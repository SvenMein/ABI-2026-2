# Setup
pacman::p_load(
  conflicted, tidyverse, wrappedtools,
  ggbeeswarm, ggridges, patchwork, readxl,
)
conflicts_prefer(
  dplyr::filter,
)

# Load data
rawdata <-  read_excel(
  path = "Data/Coloc_Example.xlsx"
)

ggplot(rawdata, aes(x = Strain, y = PCC)) +
  geom_violin(quantile.color = "black")
