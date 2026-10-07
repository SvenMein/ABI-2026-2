# Keyword arguments

def sum_up(num1, num2, num3=0, num4=10, num5=100):
    return num1+num2+num3+num4+num5

print(sum_up(num5=10, num4=0, num3=-5, num2=2, num1=7))
print(sum_up(num4=10, num2=0, num5=-5, num3=2, num1=7))
print(sum_up(num3=10, num4=0, num2=-5, num1=2, num5=7))
print(sum_up(num1=10, num4=0, num2=-5, num5=2, num3=7))
print(sum_up(num2=10, num5=0, num1=-5, num3=2, num4=7))