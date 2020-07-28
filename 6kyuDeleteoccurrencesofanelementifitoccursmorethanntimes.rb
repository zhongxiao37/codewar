def delete_nth(order,max_e)
  hash = {}
  order.map do |e|
    if hash.key?(e)
      hash[e] += 1
    else
      hash[e] = 1
    end
    next if hash[e] > max_e
    e
  end.compact
end