# Ensure BiocManager is available for installing Bioconductor packages
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}
# Install MLSeq from Bioconductor if not yet available; provides the cervical dataset
if (!requireNamespace("MLSeq", quietly = TRUE)) {
  BiocManager::install("MLSeq")
}
pacman::p_load(
  wrappedtools, tidyverse, here,
  MLSeq
)

# Load the cervical small RNA-seq count dataset (rows = sRNA features, cols = samples)
data("cervical")
# save(cervical, file = here("Data/cervical.RData"))
head(cervical)
str(cervical)
rownames(cervical)

rawdata <-
  cervical |>
  # Transpose: samples become rows, sRNAs become columns
  t() |>
  as_tibble(rownames = "SampleID") |>
  mutate(
    Tissuetype = factor(
      str_sub(SampleID, start = 1, end = 1),
      levels = c("N", "T"),
      labels = c("Control", "Tumor")
    ),
    PatID = str_sub(SampleID, 2),
    .after = SampleID
  ) |>
  rename_with(\(x) str_replace_all(x, c("-" = "_", "\\*" = "_star")))
# Save prepared data for downstream analysis
saveRDS(rawdata, "Data/cervical.RDS")
