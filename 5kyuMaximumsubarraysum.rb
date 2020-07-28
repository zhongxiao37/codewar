def max_sequence(arr)
  p arr
  return 0 if arr.empty? || arr.all?(&:negative?)

  i = 0
  i += 1 until arr[i].positive?
  j = i
  max_num = arr[i]

  while j < arr.size
    temp = arr[i..j].sum
    max_num = temp if temp > max_num
    if arr[i..j].sum < 0
      i = j + 1
      j = i
    else
      j += 1
    end
  end
  max_num
end

p max_sequence([24, -20, -15, 2, -11, -18, -18, -24, 23, 12, -12, 11, 12, -23, 7, -14, -15, -10, -2, 14, 9, -9, -15, -17])