# More for loops

ls = [12, 58, 11 ,46 ,2, 13, 15, 40 ,0 ,5 ,5 ,5 ,12 ,46 ,787 ,96 , 12, 35, 13, 45, 48]
sum1 = 0
num1 = 12

for num in ls:
    sum1 = sum1 + num

print(sum1)
print()

for num in ls:
    if num < num1:
        print(num,"is smaller than",num1)
    else:
        print(num,"is bigger than",num1)