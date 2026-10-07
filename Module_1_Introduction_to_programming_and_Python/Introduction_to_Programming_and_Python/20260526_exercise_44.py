# First functions

# num1, num2 = numerical values
def math_substraction(num1, num2):
    result = num1 - num2
    return result

def math_multiplication(num1, num2):
    result = num1 * num2
    return result

def math_division(num1, num2):
    result = num1 / num2
    return result

value1 = 10
value2 = 2

sub = math_substraction(value1, value2)
mul = math_multiplication(value1, value2)
div = math_division(value1, value2)

print(f"Results for value1 = {value1} and value2= {value2}:\nSubstraction: {sub}\nMultiplication: {mul}\nDivision: {div}")
print()

value1 = 22
value2 = 54

sub = math_substraction(value1, value2)
mul = math_multiplication(value1, value2)
div = math_division(value1, value2)

print(f"Results for value1 = {value1} and value2= {value2}:\nSubstraction: {sub}\nMultiplication: {mul}\nDivision: {div}")
print()

value1 = 7.5
value2 = 0.1

sub = math_substraction(value1, value2)
mul = math_multiplication(value1, value2)
div = math_division(value1, value2)

print(f"Results for value1 = {value1} and value2= {value2}:\nSubstraction: {sub}\nMultiplication: {mul}\nDivision: {div}")