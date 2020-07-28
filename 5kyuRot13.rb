def rot13(string)
  lower_dict = ('a'..'z').to_a
  upper_dict = ('A'..'Z').to_a
  string.chars.map do |s|
    n = lower_dict[(lower_dict.index(s) + 13) % 26] if lower_dict.include?(s)
    n = upper_dict[(upper_dict.index(s) + 13) % 26] if upper_dict.include?(s)
    n || s
  end.join
end

p rot13('test')