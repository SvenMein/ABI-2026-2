# Exercise: for and while loops, and if/ifelse/case_xxx
#
# 1. Analyzing Gene Expression Data (Using for loop and if/else)
#
# Scenario: You have a dataset of gene expression levels (e.g., RNA-seq counts) for several genes across different samples. You want to identify genes that are either highly expressed or lowly expressed based on a threshold.
#
# Task:
#
#   Create Sample Data: Generate a numeric vector representing expression levels for 20 genes (mean = 100, SD = 30).

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
set.seed(314156)
rawdata <- rnorm(20, mean = 100, sd = 30) |> round(2)
class(rawdata)

# Classify Genes by their Expression Level:

#   Using a for loop, iterate through each gene's expression level.
#
# Inside the loop, use an if/else if/else statement to categorize each gene:
#
# If expression is above 120, print paste("Gene", i, "is highly expressed:", gene_expression[i]).
#
# If expression is below 70, print paste("Gene", i, "is lowly expressed:", gene_expression[i]).
#
# Otherwise, print paste("Gene", i, "is moderately expressed:", gene_expression[i]).
counter <- 1 # to avoid using a counter var, use seq_along(iterable)
for (gene in rawdata){
  if (gene > 120){
    cat(paste("Gene", counter, "is highly expressed:", gene, "\n"))
  } else {
    if (gene < 70){
      cat(paste("Gene", counter, "is lowly expressed:", gene, "\n"))
    } else {
      cat(paste("Gene", counter, "is moderately expressed:", gene, "\n"))
    }
  }
  counter <- counter + 1
}
#
# Create a similar loop using case_when to simplify the rules.


for (gene in seq_along(rawdata)) {
  cat("Gene", gene,
    case_when(
      rawdata[gene] > 120 ~ "is highly expressed:",
      rawdata[gene] < 70 ~ "is lowly expressed:",
      .default = "is moderately expressed:"
    ),
    rawdata[gene], "\n"
  )
}
#
# 2. Simulating Population Growth (Using while loop)
#
# Scenario: You want to simulate the growth of a bacterial population over time until it reaches a certain threshold.
#
# Task:
#
# Set Initial Conditions:
#
# Start with population_size <- 100.
#
# Set a growth_rate <- 1.1 (meaning 10% increase per generation).
#
# Set a carrying_capacity <- 1000.
#
# Initialize generation <- 0.
#
population_size <- 100
growth_rate <- 1.1
carrying_capacity <- 1000
generation <- 0

# Simulate Growth:
#
# Use a while loop that continues as long as population_size < carrying_capacity.
#
# Inside the loop:
#
# Update population_size <- population_size * growth_rate.
#
# Increment generation <- generation + 1.
#
# Print the population_size and generation at each step.

while (population_size < carrying_capacity) {
  population_size <- floor(population_size * growth_rate)
  generation <- generation +1
  print(paste("Population size:", population_size, "Generation:", generation))
  if (!population_size < carrying_capacity) {
    print(paste("It took", generation, "to reach the carrying capacity"))
  }
}
#
# Add a Condition: When at the last run of the loop, print a message indicating how many generations it took to reach the carrying capacity.
#
# 3. Classifying Species Based on Traits (Using for loop and ifelse)
#
# Scenario: You have a dataset of different plant species and two of their traits: leaf length (cm) and number of petals. You want to classify them into broad groups.
#
# Task:
#
# Create Sample Data:
#
# species <- c("Oak", "Maple", "Cherry", "Rose", "Lily", "Daisy", "Sunflower")
species <- c("Oak", "Maple", "Cherry", "Rose", "Lily", "Daisy", "Sunflower")
#
# leaf_length <- c(15, 12, 8, 4, 18, 5, 25)
leaf_length <- c(15, 12, 8, 4, 18, 5, 25)
# petal_count <- c(0, 0, 5, 20, 6, 30, 0) (0 for trees, flowers have petals)
petal_count <- c(0, 0, 5, 20, 6, 30, 0)
# Categorize Species:
#
# Create an empty vector species_type <- character(length(species)) to store the results.
species_type <- character(length(species))
# Use a for loop to iterate through each species.
#
# Inside the loop, use nested ifelse statements to determine species_type based on these rules:
#
# If petal_count[i] == 0, it's a "Tree".
#
# If petal_count[i] > 10, it's a "Many-petaled Flower".
#
# If petal_count[i] > 0, it's a "Few-petaled Flower".
#
# Assign the result to species_type[i].
#
# Display Results: After the loop, create a data frame or tibble with species, leaf_length, petal_count, and the new species_type column.
#
for (elem in 1:length(petal_count)) {
  print(ifelse(test = petal_count[elem] == 0,
               yes = species_type[elem] <- "tree",
               no = ifelse(test = petal_count[elem] > 10,
                           yes = species_type[elem] <- "many-petaled flower",
                           no = ifelse(test = petal_count[elem] > 0,
                                       yes = species_type[elem] <- "few-petaled flower"
                           )
               )
  ))
}

petals <- tibble(
  species = species,
  `leaf length` = leaf_length,
  `petal count` = petal_count,
  `species type` = species_type
)
print(petals)



