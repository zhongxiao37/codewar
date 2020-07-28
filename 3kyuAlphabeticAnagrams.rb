def listPosition(word)
  return 1 if word.size == 1
  sorted_chars = word.chars.sort
  word_to_num_by_index = word.chars.map { |e| sorted_chars.index(e) }
  k = sorted_chars.uniq.map { |e| (1..sorted_chars.count(e)).reduce(&:*) }.reduce(&:*)

  counter = (1..(word_to_num_by_index.size-1)).inject(&:*) * word_to_num_by_index[0] / k
  counter + listPosition(word[1..-1])
end