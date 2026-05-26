# zip in for

ls1 = [1, 2, 3]
ls2 = [4, 5, 6, 7]
ls3 = [8, 9, 10, 11, 12, 13]

for i, j, k in zip(ls1, ls2, ls3):
    print(f"i & j: {i, j}\nj & k: {j, k}\nk & i: {k, i}")
    print()