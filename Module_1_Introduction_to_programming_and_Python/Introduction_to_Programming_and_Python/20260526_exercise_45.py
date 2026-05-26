# Functions with simple loops

# ls = list/set/tuple containing numerical values
def math_multiplication(ls):
    result = 1
    for elem in ls:
        result = result * elem
    return result

def math_sumup(ls):
    result = 0
    for elem in ls:
        result = result + elem
    return result

def math_squared(ls):
    squares = []
    for elem in ls:
        squares.append(elem**2)
    return squares

def math_list(ls):
    product = 1
    sum_up = 0
    squares = []
    for elem in ls:
        product = product * elem
        sum_up = sum_up + elem
        squares.append(elem**2)
    return product, sum_up, squares

ls1 = list(range(1, 11))
print(ls1)
print()
print(math_multiplication(ls1))
print()
print(math_sumup(ls1))
print()
print(math_squared(ls1))
print()
print(math_list(ls1))