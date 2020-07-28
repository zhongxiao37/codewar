def snail(array)
  array_size = array.size
  return [] if array.any?(&:empty?)
  return [] if array_size != array[0].size

  top, left, right, bottom = 0, 0, array_size-1, array_size-1
  i, j = 0, 0
  dir = :right
  list = []

  loop do
    list << array[i][j]
    # move ahead
    if dir == :right
      if j < right
        j += 1
      else
        dir = :down
        top += 1
        i += 1
        break if i > bottom
      end
    elsif dir == :down
      if i < bottom
        i += 1
      else
        dir = :left
        right -= 1
        j -= 1
        break if j <= left
      end
    elsif dir == :left
      if j > left
        j -= 1
      else
        dir = :up
        bottom -= 1
        i -= 1
        break if i < top
      end
    elsif dir == :up
      if i > top
        i -= 1
      else
        dir = :right
        left += 1
        j += 1
        break if j >= right
      end
    end
  end

  list << array[i][j] if array[i] && array[i][j]
  list
end

p snail([[1]])
p snail([[1,2,3],[4,5,6],[7,8,9]])
p snail([[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]])