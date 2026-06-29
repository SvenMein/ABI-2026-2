# Writing files
file = open("20260629_exercise_05_file1.txt", "w")
file.write("This is a test.\n")
file.write("Now this test is over.")
file.close()

file = open("20260629_exercise_05_file1.txt", "a")
file.write("This is a new line.\n")
file.write("These line were appended to the file.\n")
file.write(20*"#")
file.close()

with open("20260629_exercise_05_file2.txt", "w") as with_file:
    for i in range(10, -1, -1):
        with_file.write(str(i)+"\n")