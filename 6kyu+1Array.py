def up_array(arr):
    if len(arr) == 0:
        return None
    if any(i < 0 or i > 9 for i in arr):
        return None
    acc = 1
    new_arr = []
    for i in range(len(arr)-1, -1, -1):
        e = arr[i] + acc
        new_arr.insert(0, e % 10)
        if e > 9:
            acc = e - 9
        else:
            acc = 0

    if acc > 0:
        new_arr.insert(0, acc)
    return new_arr
