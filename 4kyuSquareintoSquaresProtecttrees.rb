def decompose(n)
    result = decomposer(n, n * n);

    return result.nil? ? nil : result[0..-2];
end

def decomposer(n, remain)
  return [n] if remain == 0
  
  (n-1).step(0, -1).each do |i|
    if remain - i ** 2 >= 0
      r = decomposer(i, remain - i ** 2)

      if r
        r.push(n)
        return r
      end
    end
  end

  nil
end