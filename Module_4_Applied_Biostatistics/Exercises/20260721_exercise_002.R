# Exercise: Factors
#
# Scenario: Beyond just individual measurements, biologists often need to categorize samples based on different experimental conditions, genetic backgrounds, or developmental stages. R uses a special data type called factors for this. Factors are crucial because they tell R that your data belongs to discrete groups, which is very important for statistical analysis!
#
#   The "Integer with a Name Tag" Concept: Think of it this way: R stores factors internally as numbers (integers), but it "tags" these numbers with meaningful labels (the "name tags"). For example, R might store "Male" as 1 and "Female" as 2, but it always displays "Male" and "Female" to you. This saves memory and makes computations efficient, while keeping your data interpretable.
#
# Learning Objectives:
#
#   Understand factors as a way to store categorical data.
#
# Learn how to create factors from character data.
#
# See how to inspect the levels (the "name tags") of a factor.
#
# Discover how R internally represents factors as integers.
#
# Learn how to create ordered factors when the categories have a natural sequence.
#
# Instructions:
#
#   Categorizing by Treatment Group (Unordered Factor):
#
#   Imagine your samples are from different treatment groups: "Control", "Drug A", "Drug B".
#
# First, create a character variable for the treatment of one sample
#
# What is its class?
#
#   Now, convert sample_treatment into a factor. This tells R it's a category.
#
# What is its class now? Notice how R also lists "Levels" when you print it.
#
# To see all the possible "name tags" (categories) R knows for this factor, use levels()
#
# Why do you think R automatically inferred "Control", "Drug A", "Drug B" as levels, even though you only assigned "Drug A"? (Hint: It hasn't; it only knows "Drug A" for now. We'll fix this in the next step!)
#
# The "Integer Tag" Reveal: To see the hidden integer that R uses for "Drug A", convert the factor to a numeric type:
#
# What number did you get? This number corresponds to the alphabetical position of "Drug A" among the levels R currently sees (Drug A).
#
# Defining All Levels Explicitly:
#
# When you create a factor, it's good practice to tell R all the possible levels upfront, even if a particular sample only has one of them. This ensures consistency.
#
# Re-create sample_treatment_factor, but this time specifying all the levels:
#
#   Now, what number do you get from as.numeric()? How does it relate to the levels you explicitly defined? This demonstrates how the integer tag links to its "name tag" position in the defined levels.
#
# Categorizing by Developmental Stage (Ordered Factor):
#
#   Sometimes, categories have a natural order. For example, developmental stages: "Larva", "Pupa", "Adult". "Adult" is definitely "later" than "Larva".
#
# Let's create a factor for a sample's developmental stage, making sure R understands the order:
#
#   How does the class() output differ from sample_treatment_factor_full? What integer did "Pupa" get, and why?
#
#   Key Takeaways:
#
#   Use character for free text (like comments or unique IDs).
#
# Use factor for categorical data (like experimental groups, sexes, genotypes, species names in a fixed list).
#
# Factors are essential for statistical models as they correctly identify groups for comparisons.
#
# levels() shows you the "name tags."
#
# as.numeric() shows you the underlying "integer tags."

sample_treatment <- "Drug A"
class(sample_treatment)
sample_treatment_factor <- factor(sample_treatment)
class(sample_treatment_factor)
levels(sample_treatment_factor)
as.numeric(sample_treatment_factor)

sample_treatment_factor_full <- factor(c("Control", "Drug A", "Drug B"),
                                  levels = c("Control", "Drug A",
                                             "Drug B"))
as.numeric(sample_treatment_factor_full)

developmental_stage <- factor(c("Larva", "Adult", "Pupa", "Larva"),
                              levels = c("Larva", "Pupa", "Adult"))
class(developmental_stage)
class(sample_treatment_factor)
as.numeric((developmental_stage[3]))