# Keywords in Python

ls1 = [10,15,0,25,74,11,5,6,4,78,100,12,95,46,57,43]

add_up = 0
for elem in ls1:
    if elem < 0:
        pass
    if add_up > 400:
        break
    if 200 < add_up < 300:
        continue
    else:
        print("The sum has not reached the sweet spot yet.")
    add_up += elem
print(add_up)