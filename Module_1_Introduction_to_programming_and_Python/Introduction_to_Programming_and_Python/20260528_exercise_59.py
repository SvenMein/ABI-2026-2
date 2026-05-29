# Pandas DataFrames

import pandas as pd
import numpy as np

df1 = pd.DataFrame(np.random.randn(6,4), index=["A", "B", "C", "D", "E", "F"], columns=["Test1", "Test2", "Test3", "Test4"])
df2 = pd.DataFrame(np.random.randn(4,8), index=["A", "B", "C", "D",], columns=["Test1", "Test2", "Test3", "Test4", "Test5", "Test6", "Test7", "Test8"])
df3 = pd.DataFrame(np.random.randn(10,3), index=["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"], columns=["Test1", "Test2", "Test3"])
df4 = pd.DataFrame(np.random.randn(5,9), index=["A", "B", "C", "D", "E"], columns=["Test1", "Test2", "Test3", "Test4", "Test5", "Test6", "Test7", "Test8", "Test9"])

df5 = pd.DataFrame(np.random.randn(8, 12), index=["A", "B", "C", "D", "E", "F", "G", "H"], columns=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])

print(f"df1:\n{df1}")
print(f"df2:\n{df2}")
print(f"df3:\n{df3}")
print(f"df4:\n{df4}")
print()
print(df5)