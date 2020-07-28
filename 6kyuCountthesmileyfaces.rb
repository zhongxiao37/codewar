def count_smileys(arr)
  arr.count { |e| /[:;][-~]?[\)D]/ =~ e }
end