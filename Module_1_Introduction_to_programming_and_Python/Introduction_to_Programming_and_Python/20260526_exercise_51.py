# Different amount of arguments

def sum_up(num1, num2, *args):
    result = num1 + num2
    for elem in args:
        result += elem
    return result

def sum_string(*args):
    result = ""
    for word in args:
        result += word
    return result

print(sum_up(10,5,1,2,3))
print(sum_string("Hello", "World"))

print(sum_up(10,5,3))
print(sum_string("Hello", "cruel" "World"))

print(sum_up(10,5,1,2,3))
print(sum_string("Hello", "World", "I think adding funny character is funny!", "Peanuts"))