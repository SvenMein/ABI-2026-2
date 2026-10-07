# Slicing with a :
ls = list(range(0, 100, 5))
slice1 = ls[:5]
slice2 = ls[:8]
slice3 = ls[6:]
slice4 = ls[10:]

print(f"This is the list: {ls}")
print(f"First five elements: {slice1}")
print(f"First eight elements: {slice2}")
print(f"Start at index 6: {slice3}")
print(f"Start at index 10: {slice4}")