def iq_test(numbers):
    evenness_checkor = []
    find_even = None
    counter = 1
    for i in numbers.split(' '):
        num = int(i) % 2
        if find_even is None:
            evenness_checkor.append(num)
            if len([i for i in evenness_checkor if i]) > 1:
                find_even = False
            elif len([i for i in evenness_checkor if not i]) > 1:
                find_even = True

            if find_even is not None:
                if len(evenness_checkor) > 2:
                    return evenness_checkor.index(find_even) + 1
        else:
            if num == find_even:
                return counter


        counter += 1

    

print(iq_test("2 4 7 8 10"))