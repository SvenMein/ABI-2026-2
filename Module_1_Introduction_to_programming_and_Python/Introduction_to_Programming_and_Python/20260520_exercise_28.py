# Using Logic

number1 = 5
number2 = 5

if number1 > 0 and number2 > 0:
    print("both numbers are bigger than 0")
if number1 < 0 and number2 < 0:
    print("both numbers are smaller than 0")
if number1 > 0 or number2 > 0:
    print("one number is bigger than 0")
if number1 < 0 or number2 < 0:
    print("one number is smaller than 0")
if (number1 > 0 and number2 < 0) or (number1 < 0 and number2 > 0):
    print("one number is bigger than 0, the other is not")
if(number1 >= -10 and number1 <= 10) and (number2 >= -10 and number2 <= 10):
    print("both numbers are in range of -10 to 10")

# Alternative:
if -10 <= number1 <= 10 and 11 > number2 > -11:
    print("both numbers are in range of -10 to 10")
    
if number1 in range(-10, 11):
    print("This also works, for intengers")