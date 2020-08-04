import math

def consec_kprimes(k, arr):
    count = 0
    found = False
    for num in arr:
        print(factors(num))
        if len(factors(num)) == k:
            if found:
                count += 1
            else:
                found = True
        else:
            found = False
    
    return count

def factors(num):
    if num < 2:
        return []
    if is_prime(num):
        return [num]
    
    prime_factors = []
    last_prime = 2
    while last_prime <= math.floor(math.sqrt(num)):
        if num % last_prime == 0:
            prime_factors.append(last_prime)
            num = num // last_prime
        else:
            last_prime += 1
            while not is_prime(last_prime):
                last_prime += 1
        
    prime_factors.append(num)

    return prime_factors


def is_prime(num):
    if num < 2:
        return False 
    if num % 2 == 0:
        return num == 2 
    if num % 3 == 0:
        return num == 3
    if num < 9:
        return True 
    for e in range(5, math.floor(math.sqrt(num))+1, 2):
        if num % e == 0:
            return False
    return True


arr = [100489]
print(consec_kprimes(2, arr))

