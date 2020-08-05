import math

def buddy(start, limit):
    for n in range(start, limit+1):
        s_m = sum(list(divisorGenerator(n)))
        s_n = sum(list(divisorGenerator(s_m - 1)))
        if s_n - 1 == n and s_m > n:
            return [n, s_m - 1]
    return 'Nothing'

def divisorGenerator(n):
    large_divisors = []
    for i in range(1, int(math.sqrt(n) + 1)):
        if n % i == 0:
            yield i
            if i*i != n and i != 1:
                large_divisors.append(n // i)
    for divisor in reversed(large_divisors):
        yield divisor


print(buddy(10, 50))