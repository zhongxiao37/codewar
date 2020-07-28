def interpret(code)
  code_matrix = code.split("\n").map(&:chars)
  stack = []
  output = []
  pt = [0, 0]
  direction = [0, 1]
  handle_ascii = false

  loop do
    point = code_matrix[pt[0]][pt[1]]

    if handle_ascii && point =~ /[^"]/
      stack.push point.ord
    else
      case point
      when '>'
        direction = [0, 1]
      when '<'
        direction = [0, -1]
      when '^'
        direction = [-1, 0]
      when 'v'
        direction = [1, 0]
      when /\d/
        stack.push point.to_i
      when '.'
        val = stack.pop
        output.push val
      when ','
        val = stack.pop
        output.push val.chr
      when ':'
        stack.empty? ? stack.push(0) : stack.push(stack[-1])
      when '_'
        val = stack.pop
        direction = val.zero? ? [0, 1] : [0, -1]
      when '|'
        val = stack.pop
        direction = val.zero? ? [1, 0] : [-1, 0]
      when '+', '*'
        b, a = stack.pop(2)
        stack.push(a.send(point, b))
      when '-'
        b, a = stack.pop(2)
        stack.push(b.send(point, a))
      when '/'
        b, a = stack.pop(2)
        stack.push(a.zero? ? 0 : (b / a).floor)
      when '%'
        b, a = stack.pop(2)
        stack.push(a.zero? ? 0 : b % a)
      when '?'
        direction = [[0, 1], [0, -1], [1, 0], [-1, 0]].sample
      when '"'
        handle_ascii = !handle_ascii
      when '!'
        stack.push(stack.pop.zero? ? 1 : 0)
      when '`'
        b, a = stack.pop(2)
        stack.push(b > a ? 1 : 0)
      when '\\'
        a = stack.pop
        b = stack.pop rescue 0
        stack.push(a, b)
      when '$'
        stack.pop
      when '#'
        pt[0] += direction[0]
        pt[1] += direction[1]
      when 'p'
        v, x, y = stack.pop(3)
        code_matrix[y][x] = v.chr
      when 'g'
        x, y = stack.pop(2)
        stack.push code_matrix[y][x].ord
      when '@'
        break
      else
        # do nothing
      end
    end

    pt[0] += direction[0]
    pt[1] += direction[1]
  end

  output.join
end