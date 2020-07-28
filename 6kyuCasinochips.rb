def solve arr
  [arr.sort[0..1].sum, arr.sum/2.floor].min
end