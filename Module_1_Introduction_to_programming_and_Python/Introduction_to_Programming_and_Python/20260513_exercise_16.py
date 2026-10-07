# Longer Lists

ls1 = list(range(0, 10))
ls2 = list(range(100, 0, -5))
ls3 = list(range(55, 5555, 11))
ls4 = list(range(13, -10, -2))

ls1.append(33)
ls2.append(7)
ls1.extend(ls3)
ls2.extend(ls4)

print(ls1)
print(ls2)