def validSolution(board)
  # check rows
  valid = board.all? { |row| row.uniq.size == row.size }
  return false unless valid

  # check column
  valid = board.transpose.all? { |row| row.uniq.size == row.size }
  return false unless valid

  0.step(by: 3, to: 8) do |row_idx|
    0.step(by: 3, to: 8).each do |col_idx|
      temp = board[row_idx..row_idx+2].map { |row| row[col_idx..col_idx+2] }.flatten
      valid = temp.size == temp.uniq.size
      return false unless valid
    end
  end

  valid
end



p validSolution([[5, 3, 4, 6, 7, 8, 9, 1, 2],
                 [6, 7, 2, 1, 9, 5, 3, 4, 8],
                 [1, 9, 8, 3, 4, 2, 5, 6, 7],
                 [8, 5, 9, 7, 6, 1, 4, 2, 3],
                 [4, 2, 6, 8, 5, 3, 7, 9, 1],
                 [7, 1, 3, 9, 2, 4, 8, 5, 6],
                 [9, 6, 1, 5, 3, 7, 2, 8, 4],
                 [2, 8, 7, 4, 1, 9, 6, 3, 5],
                 [3, 4, 5, 2, 8, 6, 1, 7, 9]])
