# Inserting values

ls1 = list(range(0, 10))
ls2 = list(range(100, 0, -5))
ls3 = list(range(50, 0, -2))

print(ls1)
print(ls2)
print(ls3)

ls1.insert(-1, "Hello")
ls2.insert(5, "Moin")
ls3.insert(1000, "Monday")

print(ls1)
print(ls2)
print(ls3)