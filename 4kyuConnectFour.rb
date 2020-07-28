COLUMNS = ('A'..'G').to_a

def who_is_winner(list)
  matrix = (0..5).map { (0..6).map { ' ' } }

  until list.empty?
    i = 5
    piece = list.shift
    _, column, color = piece.match(/([A-G])_(\w*)/).to_a
    i -= 1 until matrix[i][COLUMNS.index(column)] == ' '
    matrix[i][COLUMNS.index(column)] = color

    winner = examine_winner(matrix)
    return winner if winner
  end

  'Draw'
end

def examine_winner(matrix)
  left_bottom_to_right_top = []
  (0..5).each do |row_index|
    i = row_index
    j = 0
    row = []
    while i >= 0
      row << matrix[i][j]
      j += 1
      i -= 1
    end
    left_bottom_to_right_top << row
  end

  (1..6).each do |col_index|
    i = 5
    j = col_index
    row = []
    while i >= 0 && j <= 6
      row << matrix[i][j]
      j += 1
      i -= 1
    end
    left_bottom_to_right_top << row
  end

  right_bottom_to_left_top = []
  5.step(0, -1).each do |row_index|
    i = row_index
    j = 0
    row = []
    while i <= 5
      row << matrix[i][j]
      j += 1
      i += 1
    end
    right_bottom_to_left_top << row
  end

  (1..6).each do |col_index|
    i = 0
    j = col_index
    row = []
    while i <= 5 && j <= 6
      row << matrix[i][j]
      j += 1
      i += 1
    end
    right_bottom_to_left_top << row
  end

  ['Red', 'Yellow'].each do |color|
    found = matrix.any? { |row| row.join.include?(color * 4) }
    return color if found

    found = matrix.transpose.any? { |row| row.join.include?(color * 4) }
    return color if found

    found = left_bottom_to_right_top.any? { |row| row.join.include?(color * 4) }
    return color if found

    found = right_bottom_to_left_top.any? { |row| row.join.include?(color * 4) }
    return color if found
  end

  nil
end