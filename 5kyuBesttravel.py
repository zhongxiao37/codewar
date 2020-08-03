from itertools import combinations

def choose_best_sum(t, k, ls):
    options = [sum(e) for e in combinations(ls, k) if sum(e) <= t]
    if len(options) == 0:
        return None
    return max(options)

xs = [100, 76, 56, 44, 89, 73, 68, 56, 64, 123, 2333, 144, 50, 132, 123, 34, 89]
choose_best_sum(230, 4, xs)