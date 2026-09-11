# lmm simulation ####
pacman::p_load(
  conflicted, wrappedtools, tidyverse, ggbeeswarm, broom, car, lme4, nlme,
  merTools, magrittr
)
conflicts_prefer(ggplot2::mean_cl_boot)
# assumptions ####
assumptions <- tibble(
  Var_source = c(
    "treatment", "individual", "tissue",
    "biopsy", "technical_replication"
  ),
  n = c(2, 10, 2, 3, 3),
  delta = c(15, 0, 10, 0, 0),
  SD = c(5, 10, 2, 5, 1)
)
n <- prod(assumptions$n)
set.seed(26052025)
simdata <- tibble(
  Animal = paste("T", seq_len(prod(assumptions$n[1:2]))),
  Treatment = rep(c("placebo", "verum"),
    each = assumptions |>
      filter(Var_source == "individual") |>
      pull(n)
  ),
  basevalue = rnorm(
    prod(assumptions$n[1:2]), 100,
    assumptions |>
      filter(Var_source == "individual") |>
      pull(SD)
  ),
  verumeffect = rnorm(
    prod(assumptions$n[1:2]),
    assumptions |>
      filter(Var_source == "treatment") |>
      pull(delta),
    assumptions |>
      filter(Var_source == "treatment") |>
      pull(SD)
  ) *
    (Treatment == "verum"),
  brain = basevalue + verumeffect * 1.50 +
    rnorm(
      prod(assumptions$n[1:2]),
      assumptions |>
        filter(Var_source == "tissue") |>
        pull(delta),
      assumptions |>
        filter(Var_source == "tissue") |>
        pull(SD)
    ),
  heart = basevalue + verumeffect
)
for (biopsy_i in seq_len(assumptions$n[4])) {
  simdata %<>% mutate(
    !!sym(paste0("brain_B", biopsy_i)) :=
      brain +
      rnorm(
        prod(assumptions$n[1:2]),
        assumptions |>
          filter(Var_source == "biopsy") |>
          pull(delta),
        assumptions |>
          filter(Var_source == "biopsy") |>
          pull(SD)
      ),
    !!sym(paste0("heart_B", biopsy_i)) :=
      heart +
      rnorm(
        prod(assumptions$n[1:2]),
        assumptions |>
          filter(Var_source == "biopsy") |>
          pull(delta),
        assumptions |>
          filter(Var_source == "biopsy") |>
          pull(SD)
      )
  )
  for (repl_i in 1:3) {
    simdata <-
      simdata |> mutate(
        !!sym(paste0("brain_B", biopsy_i, "_R", repl_i)) :=
          !!sym(paste0("brain_B", biopsy_i)) +
            rnorm(
              prod(assumptions$n[1:2]),
              assumptions |>
                filter(Var_source == "technical_replication") |>
                pull(delta),
              assumptions |>
                filter(Var_source == "technical_replication") |>
                pull(SD)
            ),
        !!sym(paste0("heart_B", biopsy_i, "_R", repl_i)) :=
          !!sym(paste0("heart_B", biopsy_i)) +
            rnorm(
              prod(assumptions$n[1:2]),
              assumptions |>
                filter(Var_source == "technical_replication") |>
                pull(delta),
              assumptions |>
                filter(Var_source == "technical_replication") |>
                pull(SD)
            )
      )
  }
}
rawdata <- simdata
rawdata <-
  pivot_longer(
    rawdata,
    matches("B._R"),
    names_to = "Sample", values_to = "Measure"
  ) |>
  separate(
    col = Sample, into = c("Tissue", "Biopsy", "Replicate"),
    sep = "_", remove = F
  ) |>
  unite(
    col = "B_R", "Biopsy", "Replicate",
    sep = "_", remove = F
  )


ggplot(simdata, aes(Treatment, brain)) +
  geom_boxplot()
ggplot(simdata, aes(Treatment, heart)) +
  geom_boxplot()

ggplot(rawdata, aes(Biopsy, Measure)) +
  geom_boxplot(coef = 3, outlier.alpha = 0) +
  geom_beeswarm(aes(color = Replicate),
    dodge.width = .3, alpha = .5
  ) +
  facet_grid(Treatment ~ Tissue)

rawdata |>
  # filter(Animal %in% c('T 1','T 11')) |>
  ggplot(aes(Replicate, Measure, color = Treatment)) +
  geom_point(size = 2, alpha = .5) +
  geom_line(aes(group = Animal)) +
  facet_grid(Tissue ~ Biopsy)

braindata <- rawdata |> filter(Tissue == "brain")

braindata |>
  unite(
    col = "B_R", "Biopsy", "Replicate",
    sep = "_", remove = F
  ) |>
  ggplot(aes(B_R, Measure, color = Biopsy)) +
  geom_point(size = 2, alpha = .5) +
  geom_line(aes(group = Animal)) +
  facet_wrap(facets = "Animal") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
braindata |>
  ggplot(aes(Biopsy, Measure)) +
  geom_beeswarm(size = 2, alpha = .5, cex = 5) +
  facet_wrap(facets = "Animal")
braindata |>
  ggplot(aes(Biopsy, Measure)) +
  stat_summary(fun.data = mean_cl_boot) +
  facet_wrap(facets = "Animal")


# lm ####
lmdata <- braindata |>
  group_by(Animal, Treatment, Tissue) |>
  summarize(Measure_av = median(Measure))

lm_out <- lm(Measure_av ~ Treatment, data = lmdata)
lm_out
anova(lm_out)

# lmm ####

lme_out0 <- nlme::gls(Measure ~ Treatment, data = braindata) # no RE
lme_out <- nlme::lme(Measure ~ Treatment,
  data = braindata,
  random = ~ 1 | Animal / Biopsy / Replicate
) # RInterc
lme_out
cat("Expected: Animal=10, Biopsy=5, Replication=1")
# summary(lme_out)
Anova(lme_out)

lme_out2 <- nlme::lme(Measure ~ Treatment * Tissue,
  data = rawdata,
  random = ~ 1 | Animal / Biopsy / Replicate
) # RInterc
lme_out2
cat("Expected: Animal=10, Biopsy=5, Replication=1")
# summary(lme_out2)
Anova(lme_out2, type = 3)

# lme_out3 <- nlme::lme(Measure~Treatment*Tissue,
#                       data=rawdata,
#                       random = ~1|Animal/Tissue/Biopsy) # RInterc
# lme_out3
# cat('Expected: Animal=10, Biopsy=5')
# # summary(lme_out2)
# Anova(lme_out3)

ggplot(rawdata, aes(Tissue, Measure)) +
  geom_boxplot(aes(fill = Treatment))

lme_out4 <- nlme::lme(Measure ~ Treatment * Tissue,
  data = rawdata,
  random = ~ 1 | Animal / Biopsy,
  method = "ML"
) # RInterc
lme_out4
cat("Expected: Animal=10, Biopsy=5")
# summary(lme_out2)
