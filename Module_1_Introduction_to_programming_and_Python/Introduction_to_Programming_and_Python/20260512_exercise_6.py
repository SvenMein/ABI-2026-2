# Changing types by casting
var1 = "500"
var2 = "48.86"
var3 = 50.97
var4 = 10
var5 = "-5"

print("var1",type(var1),var1)
print("var2",type(var2),var2)
print("var3",type(var3),var3)
print("var4",type(var4),var4)
print("var5",type(var5),var5)
print()

# Cast variables
var1 = int(var1)
print("var1",type(var1),var1)
var1 = float(var1)
print("var1",type(var1),var1)
var2 = float(var2)
print("var2",type(var2),var2)
var2 = str(var2)
print("var2",type(var2),var2)
var3 = str(var3)
print("var3",type(var3),var3)
var4 = str(var4)
print("var4",type(var4),var4)
var4 = float(var4)
print("var4",type(var4),var4)
var5 = float(var5)
print("var5",type(var5),var5)
var5 = int(var5)
print("var5",type(var5),var5