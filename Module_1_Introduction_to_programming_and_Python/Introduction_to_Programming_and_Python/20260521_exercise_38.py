# Working with any() and all()

ls1 = [10,20,-3,-4,8,1,5,-25,5,6,-7,9,2,15]

if any(elem > 10 for elem in ls1):
    print("At least on number is bigger than 10.")

if any(elem < -5 for elem in ls1):
    print("At least on number is smaller than -5.")
    
if any(elem == 20 for elem in ls1):
    print("At least on number is equal to 20.")
    
if any(elem != -10 for elem in ls1):
    print("At least on number is not equal to -10.")
    
if all(elem < 0 for elem in ls1):
    print("All numbers are negative.")
else:
    print("There are positive numbers in the list,")
    
if all(elem > 0 for elem in ls1):
    print("All numbers are positive.")
else:
    print("There are negative numbers in the list.")
    
if all(elem == 15 for elem in ls1):
    print("All numbers are equal to 15.")
else:
    print("There are numbers in the list that are not equal to 15.")

if all(-30 <= elem <= 30 for elem in ls1):
    print("All numbers are between -30 and 30.")
else:
    print("Some numbers in the list are outside the -30 to 30 range.")