# 1 ** 3 + 2 ** 3 + ... + n ** 3
# equals
# (n * (n + 1) / 2) ** 2

import itertools
def find_nb(m):
    temp_sum = 0
    for i in itertools.count(start=1, step=1):
        temp_sum += i ** 3
        if temp_sum == m:
            return i
        elif temp_sum > m:
            return -1

print(find_nb(4183059834009))