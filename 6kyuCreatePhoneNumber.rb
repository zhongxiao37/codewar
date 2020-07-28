def createPhoneNumber(numbers)
  "(%3s) %3s-%4s" % [numbers[0..2].join, numbers[3..5].join, numbers[6..9].join]
end