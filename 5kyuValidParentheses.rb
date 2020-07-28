def valid_parentheses(string)
  parentheses = []
  valid = true
  string.scan(/[\(\)]/).each do |c|
    parentheses.push(c) if c == '('
    if c == ')'
      if parentheses[-1] == '('
        parentheses.pop
      else
        valid = false
        break
      end
    end
  end
  valid = false if parentheses.size > 0
  valid
end