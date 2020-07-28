def last_digit(lst)
  return 1 if lst.empty?
  return last_digit_core(lst[0] % 10, lst[1]) if lst.size == 2
  
  base = lst.shift % 10
  return 1 if base == 1
  return base % 10 if lst.empty?

  a, b = lst.pop(2)
  
  a = a % 100 + 100 if a > 100
  b = b % 100 + 100 if b > 100

  k = a ** b
  k = k % 100 + 100 if k > 100

  while lst.size.positive?
    m = lst.pop
    k = m ** k
    k = k % 100 + 100 if k > 100
  end
  
  last_digit_core(base, k)
end


def last_digit_core(n1, n2)
  n2.zero? ? 1 : ((n1 % 10) ** (n2 % 4 + 4)) % 10
end