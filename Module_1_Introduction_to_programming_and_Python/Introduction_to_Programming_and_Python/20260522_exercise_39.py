# List comprehensions

ls1 = [10,250,-5,2,3,84,-11,0,6,24,115,3,-80]
ls2 = ["Hello" , "HelloWorld", "Christoph" , "Hi", "My Name is", "How are you", "Also Hello", "Nice to see you", "Chris", "Nice"]

print(f"Original list: {ls1}")

greater_ten = [num for num in ls1 if num > 10]
print(f"Numbers in ls1 which are greater than 10: {greater_ten}")

in_range = [num for num in ls1 if 0 < num <10]
print(f"Number within 0 to 10 rnage: {in_range}")

neg_values = [num for num in ls1 if 0 > num]
print(f"All negative numbers in ls1: {neg_values}")

outliners = [num for num in ls1 if -50 > num or 50 < num]
print(f"ls1 contains following numbers as outliners: {outliners}")

print()
print("###Numerical list optional###")
multiples = [num for num in ls1 if str(num)[-1] == "5" or str(num)[-1] == "0"]
print(f"All values wich are multiples of 5 by using strings: {multiples}")

multiples = [num for num in ls1 if num%5 == 0]
print(f"All values wich are multiples of 5 by using math: {multiples}")

print()
print("###String List###")
hello = [word for word in ls2 if "Hello" in word]
print(hello)

letters = [word for word in ls2 if len(word) >= 7]
print(f"These words contain 7 or more letters: {letters}")