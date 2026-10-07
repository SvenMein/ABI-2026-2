# Slicing of lists

ls1 = list(range(0, 10, 2))
ls2 = list(range(10, 100, 4))

x = 2
y = 5
a = -1
b = -2

print(ls1[x:y])
print(ls2[x:y])
print(ls2[x:b])
print(ls1[b:a])
print(ls2[y:b:x])