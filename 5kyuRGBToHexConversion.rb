def rgb(r, g, b)
  "%2s%2s%2s" % [r, g, b].map do |c|
    c = c < 0 ? 0 : c
    c = c > 255 ? 255 : c
    c.to_s(16).upcase.rjust(2, "0")
  end
end