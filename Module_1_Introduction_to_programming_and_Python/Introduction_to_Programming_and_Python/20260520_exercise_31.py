# Checking for elements

ls1 = list(range(0, 10))

check1 = "Hello"
check2 = 15
check3 = 3

if check1 in ls1:
    print("check1 appears in ls1")
else:
    print("check1 does not appear in ls1")
    
if not check2 in ls1:
    print("check2 does not appear in ls1")
else:
    print("check1 appears in ls1")
    
if not check3 not in ls1:
    print("check3 appears in ls1")
else:
    print("check3 does not appear in ls1")