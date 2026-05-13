# working with range() and len()

ls1 = list(range(0, 10))
ls2 = list(range(100, 0, -5))
ls3 = list(range(55, 5555, 11))
ls4 = list(range(13, -10, -2))

print(f"ls1 contains the following {len(ls1)} entries: {ls1}")
print(f"ls2 contains the following {len(ls2)} entries: {ls2}")
print(f"ls3 contains the following {len(ls3)} entries: {ls3}")
print(f"ls4 contains the following {len(ls4)} entries: {ls4}")