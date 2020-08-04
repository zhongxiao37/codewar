# solution
# for `mystery(n)`, we want to find the num at index n
# for n = 5, it should be 3 bits starting with '1', like '1XX'
# for 'XX', it should be same num at index (2 ** 3 - 5 - 1)
# as a result, 'XX' should be `mystery_core(2 ** m - n - 1)`
# call this recursively, and finally you will get a list of all bits

# for `mystery_inv(n)`, we want to find the index of num n
# pop the last bit
# if it's 0, idx = 0; else idx = 1
# from now on
# if the last bit is 0, do nothing
# if the last bit is 1, it should be now and new idx 2 ** (i + 1) - idx - 1
# take 5 (101) as an example
# the last bit is 1
# for initial idx is 1
# then it's 0, do nothing, but i will increase by 1
# last it's 1, calculate the new index as 2 ** (2 + 1) - 1 - 1
# the idx is 6 [000, 001, 011, 010, 110, 111, 101, 100]


def mystery(n):
    return int(''.join(mystery_core(n)), 2)

def mystery_core(n):
    if n < 2:
        return [str(n)]

    n_bits = "{0:b}".format(n)
    m = len(n_bits)
    mystery_list = ['0' for _ in range(m)]
    mystery_list[0] = '1'
    child = mystery_core(2 ** m - n - 1)
    mystery_list[-len(child):] = child
    return mystery_list

def mystery_inv(n):
    n_bits = list("{0:b}".format(n))
    m = len(n_bits)
    idx = None
    for i in range(m):
        s = n_bits.pop()
        if i == 0:
            idx = int(s)
        elif s == '0':
            pass
        elif s == '1':
            idx = 2 ** (i + 1) - idx - 1

    return idx

def name_of_mystery():
    return 'Gray code'



print(mystery(4))
print(mystery(5))
print(mystery(6))
print(mystery(7))
print(mystery(8))


print(mystery_inv(6))
print(mystery_inv(7))
print(mystery_inv(5))
print(mystery_inv(4))
print(mystery_inv(12))




