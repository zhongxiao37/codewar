def spiralize(size)
  top, left, right, bottom = 0, 0, size-1, size-1
  i, j = 0, 0
  dir = :right
  matrix = (0...size).map { (0...size).map { 0 }}

  loop do
    matrix[i][j] = 1
    # move ahead
    if dir == :right
      if j < right
        j += 1
      else
        dir = :down
        top += 2
        i += 1
        break if i > bottom
      end
    elsif dir == :down
      if i < bottom
        i += 1
      else
        dir = :left
        right -= 2
        j -= 1
        break if j <= left
      end
    elsif dir == :left
      if j > left
        j -= 1
      else
        dir = :up
        bottom -= 2
        i -= 1
        break if i < top
      end
    elsif dir == :up
      if i > top
        i -= 1
      else
        dir = :right
        left += 2
        j += 1
        break if j >= right
      end
    end

  end

  matrix
end