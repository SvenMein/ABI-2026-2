# while loops

num = 200
print(num)
while num > 5:
    num /= 2
    print(num)
print()

ls1 = [10,250,-5,2,3,84,-11,0,6,24,115,3,-80]
sum1 = 0
idx = 0
while sum1 < 300:
    print(sum1)
    sum1 = sum1 + ls1[idx]
    idx += 1