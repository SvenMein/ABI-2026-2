{r}
testset1 <- c(
  "Meier", "Mayer", "Maier", "Meyer", "Mayr", "Hans Meier",
  "Maya", "Mayor", "Faltermeyer", "Meierhoven"
)
# find all variations of the name "Meier" (not Maya or Mayor etc)

str_view(string = testset1, pattern = "M[ea][iy]e?r$")

testset2 <- c("weight_mm", "height_cm", "age_yr", "temp_c")
# replace _ with space
# replace _ with space and add unit in brackets

str_replace(string = testset2, pattern = "_", replacement = " ")
str_replace(string = testset2, pattern = "_(.+)", replacement = " [\\1]")

testset3 <- c("1980_12_30", "13.04.2005", "2005/04/25", "24121990")
# transform into YYYY-MM-DD

str_replace_all(string = testset3, pattern = "[:punct:]", replacement = " ") |>
  str_replace(pattern = "^(\\d{2})(\\d{2})(\\d{4})$", replacement = "\\1 \\2 \\3") |>
  str_replace(pattern = "^(.{2}) (.{2}) (.{4})", replacement = "\\3 \\2 \\1") |>
  str_replace_all(pattern = " ", replacement = "-")

str_replace_all(
  string = testset3,
  pattern = c(
    "[:punct:]" = " ",
    "^(\\d{2})(\\d{2})(\\d{4})$" = "\\1 \\2 \\3",
    "^(.{2}) (.{2}) (.{4})" = "\\3 \\2 \\1",
    " " = "-"
  )
)

testset4 <- c("pw2000", "That1sb3tt3r", "M@kesSense?", "NoDigits@this1")
# test pwd strength, rules: Upper, lower, special char, number, min 8 char long
pwd_strength <- character(length(testset4))
for (pwd in seq_along(testset4)) {
  pwd_bits <- 0
  if (str_detect(string = testset4[pwd], pattern = "[:upper:]") == TRUE) {
    pwd_bits <- pwd_bits + 1
  }
  if (str_detect(string = testset4[pwd], pattern = "[:lower:]") == TRUE) {
    pwd_bits <- pwd_bits + 1
  }
  if (str_detect(string = testset4[pwd], pattern = "[(.*\\W)]") == TRUE) {
    pwd_bits <- pwd_bits + 1
  }
  if (str_detect(string = testset4[pwd], pattern = "[:digit:]") == TRUE) {
    pwd_bits <- pwd_bits + 1
  }
  if (str_length(testset4[pwd] >= 8)) {
    pwd_bits <- pwd_bits + 1
  }
  pwd_strength[pwd] <- pwd_bits
}

pwd_status <- character(length(testset4))
for (pwd in seq_along(pwd_strength)) {
  if (pwd_strength[pwd] == 5) {
    pwd_status[pwd] <- "accepted"
  } else {
    pwd_status[pwd] <- "not accepted"
  }
}

pwd.tibble <- tibble(
  Password = testset4,
  `Password Strength` = pwd_strength,
  status = pwd_status
) |> print()
