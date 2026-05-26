# Looping a dictionary

dic = {"A":10, "B":45, "C":42, "D":9}

for key in dic:
    if dic[key] > 10:
        print(f"The value {dic[key]} of the key {key} is bigger than 10")
    elif dic[key] == 10:
        print(f"The value {dic[key]} of the key {key} is equal to 10")
    else:
        print(f"The value {dic[key]} of the key {key} is smaller than 10")