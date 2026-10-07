# Exercise: Matrix
#
# Scenario: Imagine you are a field biologist studying plant distribution. You've set up several quadrants (square frames) in your study area and counted the number of individuals for three different plant species in each quadrant.
#
# Instructions:
#
# Create Your Data:
#
# You have the following counts:
#
# Species A: Quadrant 1: 12, Quadrant 2: 8, Quadrant 3: 15
#
# Species B: Quadrant 1: 5, Quadrant 2: 10, Quadrant 3: 7
#
# Species C: Quadrant 1: 20, Quadrant 2: 14, Quadrant 3: 18
#
# Create a numeric vector for each species' counts (e.g., species_A_counts <- c(12, 8, 15)).
#
species_A_counts <- c(12, 8, 15)
species_B_counts <- c(5, 10, 7)
species_C_counts <- c(20, 14, 18)
# Create a Matrix:
#
#   Combine these three vectors into a single matrix. Name this matrix quadrant_data.
#
# Make sure each row represents a species and each column represents a quadrant.
#
# Set the number of rows (nrow) to 3 and the number of columns (ncol) to 3.
#
# Name Rows and Columns:
#
#   Assign row names to your matrix: "SpeciesA", "SpeciesB", "SpeciesC".
#
# Assign column names to your matrix: "Quadrant1", "Quadrant2", "Quadrant3".
nrow = 3
ncol = 3

plants.Matrix <- matrix(
  data = c(species_A_counts, species_B_counts, species_C_counts),
  nrow = nrow,
  ncol = ncol,
  byrow = TRUE,
  dimnames = list(paste0("Species", LETTERS[1:nrow]),
                  paste0("Quadrant", 1:ncol))
)
# Index Your Matrix (Access Data):
#
#   Access a single element: Get the count of Species B in Quadrant 2.
#
cat(plants.Matrix[2,2])
cat(plants.Matrix["SpeciesB", "Quadrant2"])
# Access a full row: Get all counts for Species A.
#
print(plants.Matrix[1,])
print(plants.Matrix["SpeciesA",])
# Access a full column: Get all counts from Quadrant 3.
#
print(plants.Matrix[, 3])
print(plants.Matrix[, "Quadrant3"])
# Access multiple elements/rows/columns:
#
#   Get the counts for Species A and Species C in Quadrant 1 and Quadrant 2.
print(plants.Matrix[c(1, 3), c(1, 2)])
print(plants.Matrix[c("SpeciesA", "SpeciesC"), c("Quadrant1", "Quadrant2")])
print(plants.Matrix[c("SpeciesA", "SpeciesC"), c(1, "Quadrant2")]) # doesn't work
print(plants.Matrix[c("SpeciesA", "SpeciesC"), c(1, 2)])
print(plants.Matrix[-2, -3])
print(plants.Matrix[!"SpeciesB", !"Quadrant2"]) # doesn't work
print(plants.Matrix[-"SpeciesB", -"Quadrant2"]) # doesn't work
