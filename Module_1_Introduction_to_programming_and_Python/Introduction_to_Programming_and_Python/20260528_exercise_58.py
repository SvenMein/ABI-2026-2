# Mathematics with NumPy

import numpy as np

array0 = np.zeros(25)
array1 = np.ones(8)
array2 = np.arange(0, 25)
array3 = np.array([1,2,3,4,5,6,7,8,9])
array4 = np.random.rand(6, 5)
array5 = np.transpose(array4)

print(array2)
print(np.sin(array2))
print()
print(array3)
print(np.log2(array3))
print()
print(array5)
print(np.power(array5, 2))