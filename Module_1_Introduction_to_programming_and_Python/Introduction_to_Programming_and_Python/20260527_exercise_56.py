# Random generator

import random

ran1 = random.randint(0, 99)
ran2 = random.randint(0, 50)
ran3 = random.randint(0, 12)
ran4 = random.random()
ran5 = random.normalvariate(0, 1)
ran6 = random.normalvariate(0.1, 0.5)

ls_ran = [ran1, ran2, ran3, ran4, ran5, ran6]
print(ls_ran)