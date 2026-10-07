# DataFrames methods.

import numpy as np
import pandas as pd

df1 = pd.DataFrame(np.random.randn(6,4), index=["A", "B", "C", "D", "E", "F"], columns=["Test1", "Test2", "Test3", "Test4"])
df2 = pd.DataFrame(np.random.randn(4,8), index=["A", "B", "C", "D",], columns=["Test1", "Test2", "Test3", "Test4", "Test5", "Test6", "Test7", "Test8"])
df3 = pd.DataFrame(np.random.randn(10,3), index=["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"], columns=["Test1", "Test2", "Test3"])
df4 = pd.DataFrame(np.random.randn(5,9), index=["A", "B", "C", "D", "E"], columns=["Test1", "Test2", "Test3", "Test4", "Test5", "Test6", "Test7", "Test8", "Test9"])

print(f"Sum of columns of df1:\n{df1.sum()}")
print()
print(f"Sum of rows of df2:\n{df2.sum(axis=1)}")
print()
print(f"Sorted df4 by column 1 & 3:\n{df4.sort_values(["Test1", "Test3"])}")
print()
print(f"Discription of df3:\n{df3.describe()}")
print()
print(f"Row and column names of df2:\n{df2.index}\n{df2.columns}")