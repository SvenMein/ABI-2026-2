# Modifying DataFrames

import numpy as np
import pandas as pd

df1 = pd.DataFrame(np.random.randn(6,4), index=["A", "B", "C", "D", "E", "F"], columns=["Test1", "Test2", "Test3", "Test4"])
df2 = pd.DataFrame(np.random.randn(4,8), index=["A", "B", "C", "D",], columns=["Test1", "Test2", "Test3", "Test4", "Test5", "Test6", "Test7", "Test8"])
df3 = pd.DataFrame(np.random.randn(10,3), index=["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"], columns=["Test1", "Test2", "Test3"])
df4 = pd.DataFrame(np.random.randn(5,9), index=["A", "B", "C", "D", "E"], columns=["Test1", "Test2", "Test3", "Test4", "Test5", "Test6", "Test7", "Test8", "Test9"])

df1.loc["E", "Test5"] = 25
print(df1)
print()
df2.loc["E", "Test4"] = 50
print(df2)
print()
df3.loc["G", "Test4"] =100
print(df3)
print()
df4.loc["G", "Test10"] = 5
print(df4)