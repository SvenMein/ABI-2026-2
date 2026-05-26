# Searching in dictionaries
key1 = "E"
value1 = 2

dic1 = {"A": 10, "B": 4, "C": 77, "D": -10}

print(dic1)
print()


if key1 in dic1:
    dic1[key1] = value1
    print("Key is present, update key/value")
else:
    dic1[key1] = value1
    print("Key has been added to dic1")
print(dic1)

print()
print(dic1)

key1 = "E"
value1 += 1

if key1 in dic1:
    dic1[key1] = value1
    print("Key is present, update key/value")
else:
    dic1[key1] = value1
    print("Key has been added to dic1")
print(dic1)