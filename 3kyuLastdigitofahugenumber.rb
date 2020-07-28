# Requirement
# For a given list [x1, x2, x3, ..., xn] compute the last (decimal) digit of x1 ^ (x2 ^ (x3 ^ (... ^ xn))).
# e.g.
# last_digit({3, 4, 2}, 3) == 1

# Thinking
# 最后一位的数字这类题有一个规律，即每4次开始重复
# 比如，7: 7,9,3,1,7...

def last_digit(lst)
  n = 1

  # the ones digit is at most a 4 cycle for any a^b
  # therefor (a ^ b) % 10 == (a ^ (b % 4)) % 10
  # special case when b is non-zero and divisible by 4, we should use 4 instead

  # x1 ^ (x2 ^ (x3 ^ x4)) % 10
  # let a = x1
  #     b = x2 ^ (x3 ^ x4)
  #
  # a ^ b % 10 == a ^ (b % 4) % 10
  #
  # b % 4 = x2 ^ (x3 ^ x4) % 4 = (x2 ^ (x3 ^ x4) % 4) % 10
  # continue ...

  lst.reverse.each do |x|
    power = n < 4 ? n : n % 4 + 4
    n = x ** power
  end

  n % 10
end
