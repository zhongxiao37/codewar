def digital_root(n)
  t = n.to_s.chars.map(&:to_i).reduce(&:+)
  t > 9 ? digital_root(t) : t
end