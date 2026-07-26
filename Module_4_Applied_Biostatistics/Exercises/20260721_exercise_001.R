# Exercise: Variables / Assignments
#
# (Please do exercises in scripts in a different project!)
#
# Scenario: Imagine you've just received a new sample in the lab, and you need to record some basic information about it in R. This will help you get familiar with how R stores different kinds of data.
#
# Learning Objectives:
#
# Learn how to create variables (objects) in R using the assignment operator (<-).
#
# Understand different basic data types (classes) in R: numeric, character, logical.
#
# Practice viewing the content and class of your variables.
#
# Instructions:
#
# Assign a Sample ID:
#
# Create a variable called sample_id.
#
# Assign it a unique identifier for your sample. Since it's text, make sure to put it in quotes, e.g., "ExpA_S001".
#
sample_id <- "WT1"

# Record the Organism:
#
#   Create a variable called organism_name.
#
# Assign the scientific name of the organism your sample came from. Again, use quotes, e.g., "Saccharomyces cerevisiae".

organism_name <- "Saccharomyces cerevisiae"
#
# Record a Measurement:
#
#   You've measured the length of a cell from this sample in micrometers.
#
# Create a variable called cell_length_um.
#
# Assign a numerical value (without quotes) for the length, e.g., 7.5.
#
cell_length_um <- 8.2

# Record a Binary Condition:
#
# Was this sample grown in the presence of a specific nutrient (e.g., glucose)?
#
# Create a variable called grown_on_glucose.
#
# Assign a logical value: TRUE if yes, FALSE if no (these are special keywords in R, no quotes needed). E.g., TRUE.
#
grown_on_glucose <- TRUE

# Check Your Work (Content and Class):
#
# After creating each variable, type the variable name on a new line and press Enter to see its content.
#
# Use the class() function to check what type of data R thinks each variable holds. For example:
#
# class(sample_id)
class(sample_id)
# class(organism_name)
class(organism_name)
# class(cell_length_um)
class(cell_length_um)
# class(grown_on_glucose)
class(grown_on_glucose)
