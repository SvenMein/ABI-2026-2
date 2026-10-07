pacman::p_load(conflicted, wrappedtools, tidyverse, here, ggh4x, palmerpenguins, patchwork, flextable)
conflicts_prefer(dplyr::filter, palmerpenguins::penguins)

rawdata <- tibble(penguins)

# 1 function / 1 variable / no groups ####
rawdata |>
  summarise(across(
    .cols = body_mass_g,
    .fns = \(x) mean(x, na.rm = TRUE) |> roundR(textout = FALSE)
  )) |>
  flextable()

# 2 function / 1 variable / no groups ####
rawdata |>
  summarise(across(
    .cols = body_mass_g,
    .fns = list(
      Mean = \(x) mean(x, na.rm = TRUE) |> roundR(textout = FALSE),
      SD = \(x) sd(x, na.rm = TRUE)  |> roundR(textout = FALSE)

  ))) |>
  flextable()

# 2 functions / 1 variable / subgroup species ####
rawdata |>
  group_by(species) |>
  summarise(across(
    .cols = body_mass_g,
    .fns = list(
      Mean = \(x) mean(x, na.rm = TRUE) |> roundR(textout = FALSE),
      SD = \(x) sd(x, na.rm = TRUE) |> roundR(textout = FALSE)

    )),
    .groups = "drop"
    ) |>
  flextable()

# 1 function / 4 variables / no groups ####
numvars <- ColSeeker(
  data = rawdata,
  namepattern = "()"
)
rawdata |>
  summarise(across(all_of(numvars$names),
    .fns = list(
      Mean = \(x) mean(x, na.rm = TRUE) |> roundR(textout = FALSE)
    ))
  ) |>
  flextable()

# 1 function / 4 variables / subgroup species ####
rawdata |>
  group_by(species) |>
  summarise(across(all_of(numvars$names),
                   .fns = list(
                     Mean = \(x) mean(x, na.rm = TRUE) |> roundR(textout = FALSE)
                   )),
            .groups = "drop"
  ) |>
  flextable() |> set_table_properties(layout = "autofit")

# 2 functions / 4 variables / no subgroups ####
rawdata <- rawdata |> rename(
  `bill length (mm)` = bill_length_mm,
  `bill depth (mm)` = bill_depth_mm,
  `flipper length (mm)` = flipper_length_mm,
  `body mass (g)` = body_mass_g)

numvars <- ColSeeker(
  data = rawdata,
  namepattern = "\\(\\w+)"
)
rawdata |>
  summarise(across(all_of(numvars$names),
                   .fns = list(
                     Mean = \(x) mean(x, na.rm = TRUE) |> roundR(textout = TRUE),
                     SD = \(x) sd(x, na.rm = TRUE) |> roundR(textout = TRUE)
                   )),
            .groups = "drop"
  ) |>
  pivot_longer(
    cols = everything(),
    names_to = c("Variable", "stat"),
    names_sep = "_") |>
  flextable() |>
  merge_v(j = 1) |>
  set_table_properties(layout = "autofit")

# 2 functions / 4 variables / subgroup species ####
rawdata |>
  group_by(species) |>
  summarise(across(all_of(numvars$names),
                   .fns = list(
                     Mean = \(x) mean(x, na.rm = TRUE) |> roundR(textout = TRUE), # Set textout to TRUE to avoid another rounding by flextable
                     SD = \(x) sd(x, na.rm = TRUE) |> roundR(textout = TRUE)
                   )),
            .groups = "drop"
  ) |>
  flextable() |> colformat_double(digits = 2) |> separate_header(opts = c("span-top", "bottom-vspan"))

# Extra Stuff ####
pengu <- compare_n_numvars(
  .data = rawdata,
  dep_vars = c("bill length (mm)", "bill depth (mm)", "flipper length (mm)", "body mass (g)"),
  indep_var = "species",
  gaussian = TRUE
)
flextable(pengu$results)

factvars <- ColSeeker(
  rawdata,
  varclass = "factor"
  )

compare2qualvars(
  data = rawdata,
  dep_vars = factvars$names[-3],
  indep_var = factvars$names[3]
) |>
  select(-p) |>
  flextable() |>
  bg(~ desc_all == " ", bg = "lightgrey") |>
  set_table_properties(width = 1, layout = "autofit")

