import re
from itertools import groupby
def mix(s1, s2):
    s1 = sorted(re.findall(r'[a-z]', s1))
    s2 = sorted(re.findall(r'[a-z]', s2))
    uniq_s = sorted(set(s1+s2))
    mixed = []
    for s in uniq_s:
        c1 = s1.count(s)
        c2 = s2.count(s)
        if max(c1, c2) <= 1:
            continue
        if c1 > c2:
            mixed.append('1:' + s * c1)
        elif c2 > c1:
            mixed.append('2:' + s * c2)
        else:
            mixed.append('=:' + s * c1)

    mixed.sort(key=lambda x: (-len(x), x))
    return '/'.join(mixed)


print(mix("Lords of the Fallen", "gamekult"))