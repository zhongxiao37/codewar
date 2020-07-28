def solve(m)
  # m = x / (1-x) ** 2
  k = 0.5
  diff = 0.5
  s = nil
  100.times do |i|
    old = k
    s = k / (1 - k) ** 2
    if (s - m).abs <= 1e-12
      break
    elsif s > m
      k -= diff/2
    else
      k += diff/2
    end
    diff = (old - k).abs
  end
  k
end