# String methods
# With strings from  exercise 01

s1 = "AAAAAAAAAAAAAAAAA"
s2 = "ACTGACTGACTGACTGACTG"
s3 = "HAIMGVVFTWIMALACAAPPLVGWSRY"
s4 = "SSSIYNPVIYIMLNKQFRNCMLTTLCCGKNPLG"
s5 = "PFSNVTGVVRSPFEQPQYYLAEPWQFSMLAAYMFLLIVLGFPINFLTLYVTVQH"

print("##### First occurrences #####")
print(f"First occurrences of the letter 'A': s1: {s1.find("A")}, s2: {s2.find("A")}, s3: {s3.find("A")}, s4: {s4.find("A")}, s5: {s5.find("A")}")
print(f"First occurrences of the letter 'C': s1: {s1.find("C")}, s2: {s2.find("C")}, s3: {s3.find("C")}, s4: {s4.find("C")}, s5: {s5.find("C")}")
print(f"First occurrences of the letter 'G': s1: {s1.find("G")}, s2: {s2.find("G")}, s3: {s3.find("G")}, s4: {s4.find("G")}, s5: {s5.find("G")}")
print(f"First occurrences of the letter 'N': s1: {s1.find("N")}, s2: {s2.find("N")}, s3: {s3.find("N")}, s4: {s4.find("N")}, s5: {s5.find("N")}")
print(f"First occurrences of the letter 'T': s1: {s1.find("T")}, s2: {s2.find("T")}, s3: {s3.find("T")}, s4: {s4.find("T")}, s5: {s5.find("T")}")
print(f"First occurrences of the letter 'U': s1: {s1.find("U")}, s2: {s2.find("U")}, s3: {s3.find("U")}, s4: {s4.find("U")}, s5: {s5.find("U")}")
print()

print("##### Patterns #####")
print(f"First occurrences of the pattern 'TG': s1: {s1.split("TG")}, s2: {s2.split("TG")}, s3: {s3.split("TG")}, s4: {s4.split("TG")}, s5: {s5.split("TG")}")
print(f"First occurrences of the pattern 'TT': s1: {s1.split("TT")}, s2: {s2.split("TT")}, s3: {s3.split("TT")}, s4: {s4.split("TT")}, s5: {s5.split("TT")}")
print(f"First occurrences of the pattern 'AA': s1: {s1.split("AA")}, s2: {s2.split("AA")}, s3: {s3.split("AA")}, s4: {s4.split("AA")}, s5: {s5.split("AA")}")
print()

print("##### If statements #####")
ls = [s1, s2, s3, s4, s5] # put all the strings in a list so we can loop
counter = -1
for string in ls:
    counter += 1
    if "FLL" in string:
        print(f"The pattern 'FLL' can be found in the string {"s"+str(counter)}")


counter = -1 # reset counter
for string in ls:
    counter += 1
    if "MLT" in string:
        print(f"The pattern 'MLT' can be found in the string {"s"+str(counter)}")
