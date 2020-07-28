def listPosition(word)
  # 如果word就只有一个字母，就返回1
  return 1 if word.size == 1
  # 对word按照字母顺序排序
  sorted_chars = word.chars.sort
  # 计算每个字母在字母中的顺序
  p word_to_num_by_index = word.chars.map { |e| sorted_chars.index(e) }
  # 排重考虑，比如有N个'A'，计算所有的排列，即n!,再累乘
  p k = sorted_chars.uniq.map { |e| (1..sorted_chars.count(e)).reduce(&:*) }.reduce(&:*)

  # 针对第一个字母，先考虑剩下的字母所有的排列，即(n-1)!, 再乘以该字母在序列word_to_num_by_index中的序号
  # 假如'DBAC'，首字母为'D'，在字母序列word_to_num_by_index中排3，则可能出现以'A','B','C'打头的3种情况
  # 最后还需要处理k来去重
  p counter = (1..(word_to_num_by_index.size-1)).inject(&:*) * word_to_num_by_index[0] / k
  counter + listPosition(word[1..-1])
end

p listPosition('DBAA')
# 针对 'DBAA'，'D'在排序序列中排3，在以'D'打头之前有 3 * (4-1)! / 2 种可能
# 针对 'BAA'，'B'在排序序列中排2，在以'B'打头之前有 2 * (3-1)! / 2 种可能
# 针对 'AA'，'A'在排序序列中排0，在以'A'打头之前有 0 * (2-1)! / 2 种可能
# 针对 'A'，只有一种可能