# Usage of f-Strings
full_name = "Sven M"
age = 32
hours_per_day = 8
salary = 55555
lesson = "Var and Datastructures"
has_studied = True
time = 2.25
workplace = "Labs"

print(f"Hello, my name is {full_name} and I work at {workplace}")
print(f"I am {age} years old and I work at {hours_per_day} hours for a salary of {salary} €")
print(f"Currently {time} hours of today's lesson about {lesson} are over")
print(f"Did the participant {full_name} study? {has_studied}")
print()

print("Hello my name is",full_name,"and I work at",workplace)
print("I am",age,"years old and I work",hours_per_day,"hours for a salary of",salary,"€")