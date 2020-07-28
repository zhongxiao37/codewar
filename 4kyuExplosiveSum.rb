def exp_sum(n)
  return 0 if n <= 0
  
  exp_sum_data = [[0, 0]]
  1.step(n, 1) do |i|
    exp_sum_data[i] = [0, 0]
    1.step(i, 1) do |j|
      if i == 1 || j == 1
        exp_sum_data[i][j] = 1
      elsif i == j
        exp_sum_data[i][j] = exp_sum_data[i][j-1] + 1
      elsif (i-j)<j
        exp_sum_data[i][j] = exp_sum_data[i-j][i-j] + exp_sum_data[i][j-1]
      else
        exp_sum_data[i][j] = exp_sum_data[i-j][j] + exp_sum_data[i][j-1]
      end
    end
  end
  exp_sum_data[n][n]
end