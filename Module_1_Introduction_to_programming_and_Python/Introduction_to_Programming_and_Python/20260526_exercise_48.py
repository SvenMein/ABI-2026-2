# Multiple returns of lists

# ls = list with numbers
def list_statistic(ls):
    length = len(ls)
    sum_up = sum(ls)
    min_value = min(ls)
    max_value = max(ls)
    return length, sum_up, min_value, max_value

ls1 = list(range(0, 11))
ls2 = list(range(-5, 50, 10))
ls3 = list(range(7, 2, -1))

print(list_statistic(ls1))
print(list_statistic(ls2))
print(list_statistic(ls3))