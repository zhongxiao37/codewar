import math

def list_squared(m, n):
    squared_list = []
    for i in range(m, n):
        squared_sum = int(sum([e ** 2 for e in divisorGenerator(i)]))
        print(squared_sum)
        if math.ceil(math.sqrt(squared_sum)) ** 2 == squared_sum:
            squared_list.append([i, squared_sum])

    return squared_list
    



def divisorGenerator(n):
    large_divisors = []
    for i in range(1, int(math.sqrt(n) + 1)):
        if n % i == 0:
            yield i
            if i*i != n:
                large_divisors.append(n / i)
    for divisor in reversed(large_divisors):
        yield divisor


print(list_squared(1, 44))