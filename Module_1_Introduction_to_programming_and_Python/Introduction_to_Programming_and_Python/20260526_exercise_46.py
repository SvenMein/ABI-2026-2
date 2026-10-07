# Functions with nested loops

# ls1, ls2 = list/set/tuple with numbers
def multi_lists(ls1, ls2):
    multi = []
    for ls1_elem in ls1:
        ls = []
        for ls2_elem in ls2:
            result = ls1_elem * ls2_elem
            ls.append(result)
        multi.append(ls)
    return multi

ls1 = list(range(1, 5))
ls2 = list(range(1, 4))
print(ls1)
print(ls2)
print(multi_lists(ls1, ls2))