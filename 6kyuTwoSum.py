def two_sum(lst, s):
    cache = {}
    for i in range(len(lst)):
        if s - lst[i] in cache:
            return [cache[s - lst[i]], i]
        cache[lst[i]] = i

print(two_sum([1,2,3], 4))
print(two_sum([2,2,3], 4))