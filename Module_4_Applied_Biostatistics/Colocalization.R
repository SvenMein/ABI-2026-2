pacman::p_load(
 conflicted, tidyverse, here, ggplot2, wrappedtools,
 ggbeeswarm, readxl, ggsignif, patchwork, ggh4x, flextable
)

conflicts_prefer(
  dplyr::filter,
  ggplot2::mean_cl_boot
)

# Reading in the data and clean up ####
# ToDo: Changing cols Strain/Cells to factors
rawdata <- read_excel(
  path = here("Data/Coloc_Example.xlsx")
  )
rawdata <- mutate(
  .data = rawdata,
  Replicate = as.factor(Replicate)
)
rawdata <- rawdata |> drop_na() |> arrange(rawdata, Strain,
                                           Replicate, Cell)


# Data Exploration & Distribution check ####
## General data exploration ####
ggplot(rawdata, aes(Replicate, PCC)) +
  geom_beeswarm(cex = 3, size = 2) +
  facet_wrap(facets = vars(Strain), scale ="free_x")

## Test for normality ####
# Saving all measurements, which will be tested for
# normality in numvars
numvars <- ColSeeker(rawdata, namepattern = "PCC")

# Testing for normality by all groupings by plotting
# and testing with KS/Shapiro-tests
for (measurement_i in numvars$names) {
  plot_temp <- ggplot(rawdata, aes(x = .data[[measurement_i]])) +
    geom_density(fill = "lightblue", alpha = 0.5) +
    stat_theodensity(distri = "norm", linewidth = 0.5, color = "red") +
    facet_grid(
      rows = vars(Replicate),
      cols = vars(Strain),
      margins = "Replicate",
      labeller = labeller(.rows = label_both)
    )
  print(plot_temp)
  output <- rawdata |> group_by(Strain, Replicate) |> summarise(
    pKS_Lillie = ksnormal(.data[[measurement_i]]) |>
      formatP(mark = TRUE, ndigits = 3, pretext = TRUE),
    pKS = ksnormal(.data[[measurement_i]], lillie = FALSE) |>
      formatP(mark = TRUE, ndigits = 3, pretext = TRUE),
    pSh = shapiro.test(.data[[measurement_i]]) |> pluck("p.value")|>
      formatP(mark = TRUE, ndigits = 3, pretext = TRUE),
    .groups = "drop"
  )
  print(flextable(output) |> set_caption(
    "Test for normality of colocalization data") |>
          set_table_properties(layout = "autofit", width = 1) |>
          hline(c(3,7)) |> merge_v(j = 1) |>
          bold(part = "header"))
}
rm(output)
rm(plot_temp)

# Descriptive Statistics ####
rawdata |>
  group_by(Strain) |>
  summarise(
    across(
      .cols = PCC,
      .fns = list(
        n = \(x) n(),
        Mean = \(x) mean(x, na.rm = TRUE),
        Median = \(x) median(x, na.rm = TRUE),
        SD = \(x) sd(x, na.rm = TRUE)
      )
    ),
    .groups = "drop"
  ) |>
  flextable() |>
#  merge_v(j = 1) |>
#  hline(c(3,7)) |>
  set_caption("Result of colocalization experiment") |>
  set_table_properties(width = 1, layout = "autofit") |>
  bold(part = "header")

# Data Analysis ####
strain_tibble <- rawdata |> select("Strain") |> distinct()
replicate_tibble <- rawdata |> select("Replicate") |> distinct()

result <- tibble(merge(strain_tibble, replicate_tibble)) |>
  arrange(Strain)
result <- mutate(
  .data = result,
  `Mean PCC` = rep(NA, nrow(result)),
  SD = rep(NA, nrow(result)),
  SE = rep(NA, nrow(result))
)

position_counter <- 1
for (strain_i in 1:nrow(distinct(rawdata, Strain))) {
  for (bio_rep in 1:nrow(distinct(rawdata, Replicate))) {
    mean_pcc <- 0
    strain_var <- c("")
    strain_var <- distinct(rawdata, Strain)[[strain_i, 1]]
    current_values <- rawdata |>
      filter(Strain == strain_var
             & Replicate == result$Replicate[[bio_rep]]) |>
      pull(PCC)
    mean_pcc <- current_values |> mean()
    result$`Mean PCC`[position_counter] <- mean_pcc

    sd_pcc <- 0
    sd_pcc <- current_values |> sd()
    result$SD[position_counter] <- sd_pcc

    se_pcc <- 0
    se_pcc <- sd_pcc / sqrt(length(current_values))
    result$SE[position_counter] <- se_pcc
    position_counter <- position_counter + 1
  }
}
result <- result |> drop_na()

result_summary <- strain_tibble |> mutate(
  `Mean PCC` = rep(NA, nrow(strain_tibble)),
  SD = rep(NA, nrow(strain_tibble)),
  SE = rep(NA, nrow(strain_tibble))
)

position_counter <- 1
for (strain_i in 1:nrow(distinct(result, Strain))) {
  mean_pcc <- 0
  strain_var <- c("")
  strain_var <- distinct(result, Strain)[[strain_i, 1]]
  current_values <- result |> filter(Strain == strain_var)
  mean_pcc <- mean(current_values$`Mean PCC`)
  result_summary$`Mean PCC`[position_counter] <- mean_pcc

  sd_pcc <- 0
  sd_pcc <- sd(current_values$`Mean PCC`)
  result_summary$SD[position_counter] <- sd_pcc

  se_pcc <- 0
  se_pcc <- sd_pcc / sqrt(length(current_values$`Mean PCC`))
  result_summary$SE[position_counter] <- se_pcc
  position_counter <- position_counter + 1
}


# Statistical Analysis ####

# Data Visualization ####
barplot <- ggplot(data = result_summary, aes(x = factor(Strain,
                                  levels = c("WT", "Mut", "Mut2")),
                                  y = `Mean PCC`)) +
  geom_errorbar(aes(ymin = `Mean PCC` - SE, ymax = `Mean PCC` + SE),
                width = 0.2, colour = "black", linewidth = 1) +
  geom_bar(stat = "identity", fill = "black") +
# scale_fill_viridis_d(option = "D", guide = "none", direction = -1) +
  theme(axis.title.x = element_text(size = 20, family = "arial"),
        axis.title.y = element_text(size = 20, family = "arial"),
        axis.text = element_text(size =15,
                                 family = "arial", color = "black")) +
  xlab("") + ylab("PCC") + scale_y_continuous(limits = c(0, 1),
                                              n.breaks = 6)

basic_plot <- ggplot(data = result, aes(x = factor(Strain,
                                    levels = c("WT", "Mut", "Mut2")),
                                    y = `Mean PCC`)) +
  theme(axis.title.x = element_text(size = 20, family = "arial"),
        axis.title.y = element_text(size = 20, family = "arial"),
        axis.text = element_text(size =15,
                              family = "arial", color = "black")) +
  xlab("") + ylab("PCC")

superplot <- basic_plot + geom_beeswarm(data = rawdata,
                            aes(x = factor(Strain,
                            levels = c("WT", "Mut", "Mut2")), y = PCC,
                            color = Replicate, shape = Replicate),
                            cex = 3, alpha = 0.4, size = 2) +
  geom_beeswarm(aes(color = Replicate, shape = Replicate),
                size = 5, cex = 3) +
  geom_errorbar(data = result_summary, aes(ymin = `Mean PCC` - SE,
                                           ymax = `Mean PCC` + SE),
                width = 0.1, colour = "black", linewidth = 1) +
  stat_summary(geom = "point", shape = "-", size = 15) +
  scale_y_continuous(limits = c(-0.4, 1), n.breaks = 8) +
  scale_shape_manual(values = c(15, 16, 17, 18))

(barplot | superplot) + plot_annotation(tag_levels = "A") &
  theme(plot.tag = element_text(size = 20, face = "bold"))


