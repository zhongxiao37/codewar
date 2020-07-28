def dirReduc(arr)
  s = arr.join('#')
  new_size = s.size
  loop do
  	s.gsub!(/WEST#+EAST/, '')
  	s.gsub!(/EAST#+WEST/, '')
  	s.gsub!(/NORTH#+SOUTH/, '')
  	s.gsub!(/SOUTH#+NORTH/, '')
  	break if s.size == new_size
  	new_size = s.size
  end
  s.split(/#+/).reject { |e| e.empty? }
end

a = ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]

p dirReduc(a)

u=["NORTH", "WEST", "SOUTH", "EAST"]

p dirReduc(u)