# Functions with defaults

def sum_up(num1, num2, num3=0, num4=10, num5=100):
    return num1+num2+num3+num4+num5

print(sum_up(10, 0))
print(sum_up(10, 0, -5))
print(sum_up(10, 0, -5, 2))
print(sum_up(10, 0, -5, 2, 7))