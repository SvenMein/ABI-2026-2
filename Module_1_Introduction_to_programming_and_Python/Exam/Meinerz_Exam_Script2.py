# create function to calculate the nth number of the triangular number sequence.
def tns(number):
    value = number*(number+1)/2
    return value

print(f"The triangular number on position 1 is {tns(1)}")
print(f"The triangular number on position 1 is {tns(6)}")
print(f"The triangular number on position 1 is {tns(215)}")