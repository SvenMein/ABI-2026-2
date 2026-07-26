# Exercise: tibble
#
# Think of a cruet_stand / Gewürzmenage
#
# define n_elements <- 5*10^3
#
# create a tibble "menage" with columns saltshaker, peppercaster and n_elements each for saltgrain and pepperflake
#
# print saltshaker (tibble with 1 columns)
#
# print salt (content of column, all saltgrains)
#
# print 100 saltgrains

pacman::p_load(
  conflicted,
  tidyverse,
  wrappedtools,
  randomNames
)
conflict_scout()
conflicts_prefer(
  dplyr::filter,
  stats::lag
)

n_elements <- 5*10^3
menage <- tibble(
  saltshaker = rep("salt", n_elements),
  peppercaster = sample(
    c("green", "red", "black"),
    size = n_elements,
    replace = TRUE,
    # prob = c(0.3, 0.3, 0.3) per default all chance is equal
  )
)


menage |> select("saltshaker")
menage |> pull("saltshaker")
menage |> slice_sample(n = 100) |> pull("saltshaker")
