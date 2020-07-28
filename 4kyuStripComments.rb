def solution(input, markers)
  input.split("\n").map do |row|
    line = row
    markers.each do |marker|
      marker = '\\' + marker
      regex = /#{marker}.*\z/
      line.gsub!(regex, '')
    end
    line.strip
  end.join("\n")
end

p solution("apples, plums % and bananas\npears\noranges !applesauce", ["%", "!"])