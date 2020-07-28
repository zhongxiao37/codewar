def pig_it text
  text.split.map do |s|
    m = s.match(/([a-zA-Z])(\w*)/)
    t = if m
       m[2] + m[1] + 'ay'
    else
      s
    end
    t
  end.join(' ')
end