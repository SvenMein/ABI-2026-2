# Removing entries

ls1 = list(range(0, 10))
ls2 = list(range(100, 0, -5))
ls3 = list(range(50, 0, -2))

print(ls1)
print(ls2)
print(ls3)

ls1.remove(3)
ls2.remove(100)
ls3.remove(ls3[7])

print(ls1)
print(ls2)
print(ls3)