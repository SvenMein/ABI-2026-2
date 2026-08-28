pacman::p_load(TOSTER)

strainA <- c(0.82, 0.79, 0.85, 0.81, 0.83)
strainB <- c(0.80, 0.78, 0.84, 0.82, 0.81)

result <- t_TOST(x = strainA, y = strainB,
                 low_eqbound = -0.05, high_eqbound = 0.05)
print(result)
plot(result)

result <- t_TOST(x = strainA, y = strainB,
                 low_eqbound = -0.05, high_eqbound = 0.05,
                 eqbound_type = "SMD")
print(result)
plot(result)
