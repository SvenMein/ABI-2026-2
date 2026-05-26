# Multiple returns

# num1, num2 = numerical values
def math(num1, num2):
    subs = num1 - num2
    multi = num1 * num2
    div = num1 / num2
    return subs, multi, div

print(math(10, 8))
s, m, d = math(40, 5)
print(s, m, d)
x = math(10, 2)
print(x)