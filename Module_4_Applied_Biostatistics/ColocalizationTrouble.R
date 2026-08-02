pacman::p_load(
 conflicted, tidyverse, here, ggplot2, wrappedtools,
 ggbeeswarm, readxl
)

conflicts_prefer(
  dplyr::filter,
  ggplot2::mean_cl_boot
)

# Reading in the data
rawdata <- read_excel(
  path = here("Data/Coloc_Example.xlsx")
  )
rawdata <- mutate(
  .data = rawdata,
  Rep = as.factor(Rep)

)

# Labmates and many paper do this ####

temp1 <- rawdata |> select("Strain") |> distinct()
temp2 <- rawdata |> select("Rep") |> distinct()

summary_tibble <- tibble(merge(temp1, temp2)) |> arrange(desc(Strain))
summary_tibble <- mutate(
  .data = summary_tibble,
  `Mean PCC` = rep(NA, nrow(summary_tibble))
)

position_counter <- 1
for (strain_i in 1:nrow(distinct(rawdata, Strain))) {
  for (bio_rep in 1:nrow(distinct(rawdata, Rep))) {
    mean_pcc <- 0
    strain_var <- c("")
    strain_var <- distinct(rawdata, Strain)[[strain_i, 1]]
    mean_pcc <- rawdata |>
      filter(Strain == strain_var
             & Rep == summary_tibble$Rep[[bio_rep]]) |>
      pull(PCC) |> mean()
    summary_tibble$`Mean PCC`[position_counter] <- mean_pcc
    position_counter <- position_counter + 1
  }
}
# Errorbars needed!
plot1 <- ggplot(data = summary_tibble, aes(x = factor(Strain), y = `Mean PCC`, fill = Strain)) +
  geom_bar(stat = "summary", fun = "mean") +
  geom_beeswarm(cex = 3, size = 3, alpha = 0.75)

p_value <- with(summary_tibble, t.test(`Mean PCC`[Strain == "WT"], `Mean PCC`[Strain == "Mut"]))

# My way ####
plot2 <- ggplot(data = rawdata, aes(x = factor(Strain), y = PCC)) +
  geom_violin() +
  geom_beeswarm(cex = 3, size = 3, alpha = 0.5,
                dodge.width = 0.5, aes(color = Rep))

# Superplot ####

paper_data <- read.csv(here("Data/paper.csv"), sep = ",")
paper_data <- tibble(paper_data)
ReplicateAverages <- combine()

ReplicateAverages <- combined |> group_by(Treatment, Replicate) , across(list(mean)))
ggplot(combined, aes(x=Treatment,y=Speed,color=factor(Replicate))) + geom_beeswarm(cex=3) + scale_colour_brewer(palette = "Set1") + geom_beeswarm(data=ReplicateAverages, size=8) + stat_compare_means(data=ReplicateAverages, comparisons = list(c("Control", "Drug")), method="t.test", paired=TRUE) + theme(legend.position="none")
