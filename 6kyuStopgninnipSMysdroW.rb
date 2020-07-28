def spinWords(string)
  string.split.map { |s| s.chars.size >= 5 ? s.reverse : s }.join(' ')
end