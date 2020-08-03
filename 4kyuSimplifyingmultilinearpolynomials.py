import re
def simplify(poly):
    terms = dict()
    simplified_list = []
    for s in re.findall(r'[\+\-]?[0-9]*[a-z]+', poly):
        m = re.match(r'([\+\-]?)([0-9]*)([a-z]+)', s)
        sign = m.group(1)
        num = m.group(2) if m.group(2) else 1
        term = ''.join(sorted(m.group(3)))
        if term in terms:
            terms[term] += int('{}{}'.format(sign, num))
        else:
            terms[term] = int('{}{}'.format(sign, num))

    num = None
    terms_keys = list(terms.keys())
    terms_keys.sort(key=lambda x: (len(x), x))
    for k in terms_keys:
        num = terms[k]
        if num > 0:
            if len(simplified_list) == 0:
                simplified_list.extend(['' if abs(num) == 1 else str(num), k])
            else:
                simplified_list.extend(['+', '' if abs(num) == 1 else str(num), k])
        elif num < 0:
            simplified_list.extend(['-' if abs(num) == 1 else str(num), k])

    print(simplified_list)
    return ''.join(simplified_list)





print(simplify("-a+5ab+3a-c-2a"))  # "-c+5ab"