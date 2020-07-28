def encode(n, s)
	s_arr = s.chars
  p space_index = s_arr.size.times.select { |e| s_arr[e] == ' ' }
  n.times do
  	p s.gsub!(' ', '')
  	k = n  > s.size ? n % s.size : n
  	p s = s[-k..-1] + s[0..(-k-1)]
  	space_index.each do |i|
  		s = s[0...i] + ' ' + s[i..-1]
  	end
  	p s
  	s = s.split(/ +/).map do |e|
  		n.times { e = e[-1] + e[0..-2] }
  		p e
  		e
  	end.join
  	space_index.each do |i|
  		s = s[0...i] + ' ' + s[i..-1]
  	end
  	p s
  end
  s
end

def decode(s)
	m = /\A(\d+) (.*)\z/m.match(s)
	n = m[1].to_i
	s = m[2]
	s_arr = s.chars
  p space_index = s_arr.size.times.select { |e| s_arr[e] == ' ' }
  n.times do
  	s = s.split(/ +/).map do |e|
  		n.times { e = e[1..-1] + e[0] }
  		p e
  		e
  	end.join
  	space_index.each do |i|
  		s = s[0...i] + ' ' + s[i..-1]
  	end
  	p s

  	p s.gsub!(' ', '')
  	k = n  > s.size ? n % s.size : n
  	p s = s[k..-1] + s[0..(k-1)]
  	space_index.each do |i|
  		s = s[0...i] + ' ' + s[i..-1]
  	end
  	p s
  end
  s
end

