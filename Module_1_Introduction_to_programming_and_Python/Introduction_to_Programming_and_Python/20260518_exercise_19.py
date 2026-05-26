# Additional Functions and Methods
# Reused list from exercise 9

ls1 = [1, 2, 3, 4]
ls2 = [1, 1, 2, 3, 5, 8, 13, 22, 35, 57, 92]
ls3 = ["Monday", "Tuesday", "Wednesday", "Thusday", "Friday", "Saturday"]
ls4 = [
    "Eggs", "Rice", "Bread", "Flour", "Milk", "Butter",
    "Bellpepper", "Spinach", "Tofu", "Chickenbreast",
    "Pasta", "Cream", "Aioli"
    ]

print(f"Highest value: \nls1: {max(ls1)}, ls2: {max(ls2)}, ls3: {max(ls3)}, ls4: {max(ls4)}")
print()
print(f"Lowest value: \nls1: {min(ls1)}, ls2: {min(ls2)}, ls3: {min(ls3)}, ls4: {min(ls4)}")
print()
print(f"Sum of ls1: {sum(ls1)} \nSum of ls2: {sum(ls2)}")
print()

ls1.sort(reverse=True)
ls2.sort()
ls3.sort()
ls4.sort()

print(f"Sorted lists: \nls1: {ls1} \nls2: {ls2} \nls3: {ls3} \nls4: {ls4}")
