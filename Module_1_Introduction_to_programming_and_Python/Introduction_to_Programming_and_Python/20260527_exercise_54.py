# New modules

import numpy as np

guess = int(input("Guess a number between 0 and 99: "))
number_to_guess = np.random.randint(0, 99)
while guess != number_to_guess:
    if guess < number_to_guess:
        guess = int(input("Too low! Guess again: "))
    elif guess > number_to_guess:
        guess = int(input("Too high! Guess again: "))
print("Congratulations! You guessed the number.")
