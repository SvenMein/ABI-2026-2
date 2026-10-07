# Nested Loops

ls1 = [[5, 8, 7], [1, 2, 3]]
print(ls1)

for inner_list in ls1:
    print(inner_list)
    for num in inner_list:
        print(num)
print()

sum1 = 0
for inner_list in ls1:
    for num in inner_list:
        sum1 = sum1 + num
        print(sum1)
print()

product = 1

for i in range(1, 5):
    product = product * i
    for j in range(1, 3):
        product = product * j
print(product)