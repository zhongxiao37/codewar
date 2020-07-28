def longest_slide_down(pyramid)
  dp = pyramid[-1]
  n = pyramid.size

  (n-2).step(-1, -1).each do |i|
    (0..i).each do |j|
      dp[j] = pyramid[i][j] + [dp[j], dp[j+1]].max
    end
  end
  dp.max
end