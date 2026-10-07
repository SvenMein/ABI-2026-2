# 

import matplotlib.pyplot as plt
from matplotlib.cm import get_cmap
import numpy as np
import pandas as pd

# Lineplot
x = range(0, 10)
y = range(0, 100, 10)
y1 = np.random.randint(10, 20, 10)
y2 = y1**2

plt.figure()
plt.plot(x,y)
plt.plot(x,y1, "-.")
plt.plot(x,y2, "--")
plt.title("Test", y=1.02)
plt.xlabel("conc")
plt.ylabel("Abs")
plt.xticks(np.arange(0, 10, 1))
plt.legend(("Standardreihe", "Messung1", "Messung2"))
plt.show()
plt.close()

# Scatterplot
data = np.random.randint(1, 65535, 500)
x = list(range(0, 500))
plt.figure()
plt.plot(x, data, ".")
plt.title("Scatterplot", y=1.02)
plt.show()
plt.close

# Bar diagram
sample = ["ctrl", "Wt", "Vehicle", "Drug A", "Drug B", "Drug C", "Drug A + B", "Drug A + C", "Drug B + C", "Drug A + B + C", "Inhib 1", "Inhib 2", "Inhib 3", "Inhib 4", "Inhib 5"]
y = np.random.randint(10, 20, 15)
errors = abs(np.random.randn(15))
plt.figure()
plt.bar(sample, y, color="grey")
plt.errorbar(sample, y, errors, fmt="None", ecolor="k", elinewidth=1.5, capsize=5)
plt.title("Bar Diagram", y=1.02)
plt.xticks(sample, sample, rotation=45)
plt.show()
plt.close()