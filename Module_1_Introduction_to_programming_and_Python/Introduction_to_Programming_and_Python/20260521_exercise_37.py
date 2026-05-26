# Using enumerate

ls1 = [0, 5, 2.5, True]
ls2 = ["Hello", "Wolrd", 5, 5, 5, 5, 5]
ls3 = [True, False, 5, "Nope", 8]

for i, value in enumerate(ls1, start=1):
    print(f"Index: {i}, Value: {value}")
print()

for i, value in enumerate(ls2, start=50):
    print(f"Index: {i}, Value: {value}")
print()

for i, value in enumerate(ls3, start=-5):
    print(f"Index: {i}, Value: {value}")