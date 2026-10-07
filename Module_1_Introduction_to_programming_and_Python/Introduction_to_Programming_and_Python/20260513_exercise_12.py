# Replacing elements in lists
# Reusing lists from exercise 9

ls1 = [1, 2, 3, 4]
ls2 = [1, 1, 2, 3, 5, 8, 13, 22, 35, 57, 92]
ls3 = ["Monday", "Tuesday", "Wednesday", "Thusday", "Friday", "Saturday"]
ls4 = [
    "Eggs", "Rice", "Bread", "Flour", "Milk", "Butter",
    "Bellpepper", "Spinach", "Tofu", "Chickenbreast",
    "Pasta", "Cream", "Aioli"
    ]
ls5 = [58, "Cars", 7.9, "Pi", True, 4.47523, "Nothing"]

print("before:", ls1)
ls1[1] = 999
ls1[3] = "Hi Zev"
print("after:", ls1)
print()
print("before:", ls2)
ls2[6] = 8.8
ls2[8] = 3+5j
print("after:", ls2)
print("before:", ls3)
ls3[0] = ls1[0]
ls3[3] = "Epoch"
print("after:", ls3)
print()
print("before:", ls4)
ls4[10] = "Beer"
ls4[9] = "Sweets"
print("after:", ls4)
print()
print("before:", ls5)
ls5[3] = ls5[0] + ls5[0]
ls5[5] = False
print("after:", ls5)
print()