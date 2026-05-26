# Nested ifs

number1 = 0
number2 = -5

if -50 <= number1 <= 50 and -50 <= number2 <= 50:
    print("both numbers are in range")
    
    if number1 > 0:
        print("number1 is greater than 0")
        if number2 > 0:
            print("number2 is greater than 0")
        if number2 < 0:
            print("number2 is smaller than 0")
        
    elif number1 < 0:
        print("number1 is smaller than 0")
        if number2 < 0:
            print("number2 is smaller than 0")
        
    elif number1 == 0:
        print("number1 is equal to 0")
        if number2 != 0:
            print("number2 is not equal to 0")
else:
    print("one number is outside of range")