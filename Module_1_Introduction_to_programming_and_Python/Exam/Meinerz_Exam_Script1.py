# create function with two arguments
def multiples(num, length):
    if type(num) == str:
        raise TypeError("num needs to be a number")
    elif type(length)== str:
        raise TypeError("length needs to be a number")
    else:
        results = []
        for elem in range(1, length+1, 1):
            results.append(num* elem)
    return results

# calls of function
print(multiples(12, 10))
print(multiples(17, 6))