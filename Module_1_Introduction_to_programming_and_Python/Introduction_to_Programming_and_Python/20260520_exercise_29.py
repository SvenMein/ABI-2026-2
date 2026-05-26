# Negating Conditions

number1 = 500
number2 = 1114

if not number1 > 0:
    print("number1 is smaller than 0")
    
if not number2 < 0:
    print("number2 is bigger than 0")
    
if not -10 <= number1 <= 10:
    print("number1 is outside of range")

if not number2 > -100:
    print("numer2 is smaller than -100")
    
if not number1 < 250:
    print("number1 is bigger than 250")
    
if not number1 < 0 and not number2 < 0:
    print("both numbers are bigger than 0")