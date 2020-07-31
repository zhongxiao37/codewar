import re
def dig_pow(n, p):
    nums = [int(i) for i in re.findall(r'\d', str(n))]
    nums_sum = 0
    for i in range(p, p + len(nums), 1):
        nums_sum += nums.pop(0) ** i

    if nums_sum % n == 0:
        return nums_sum // n
    return -1

print(dig_pow(46288, 3))