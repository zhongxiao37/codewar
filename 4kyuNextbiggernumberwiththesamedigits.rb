def next_bigger(num)
  reversed_num = num.to_s.split('').map(&:to_i).reverse
  reversed_num.size.times do |i|
    return -1 if i + 1 >= reversed_num.size 
    if reversed_num[i] <= reversed_num[i + 1]
      next
    else
      if i.zero?
        reversed_num[i], reversed_num[i + 1] = reversed_num[i + 1], reversed_num[i]
      else
        j = (0..i).find { |e| reversed_num[e] > reversed_num[i + 1] }
        reversed_num[i + 1], reversed_num[j] = reversed_num[j], reversed_num[i + 1]
        tmp = reversed_num[0..i].sort.reverse
        reversed_num = tmp + reversed_num[i+1..-1]
      end
      break
    end
  end
  reversed_num.reverse.join.to_i
end