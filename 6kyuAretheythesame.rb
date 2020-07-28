def comp(array1, array2)
  return false if array1.nil? || array2.nil?
  array1.sort!
  array2.sort!
  return false if array1.size != array2.size
  (0..(array1.size-1)).all? { |i| array2[i] == array1[i] ** 2 }
end