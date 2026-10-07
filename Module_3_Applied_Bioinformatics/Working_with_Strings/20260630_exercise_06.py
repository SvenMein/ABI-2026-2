# Reading a file
with open("20260629_exercise_05_file2.txt", "r") as read_file:
    sum_up = 0
    for line in read_file:
        number = line.replace("\n", "")
        print(number)
        sum_up += int(number)
    print()
    print("Sum of numbners:", sum_up)