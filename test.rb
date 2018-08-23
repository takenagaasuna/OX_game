$board = Array.new(3,0..2)
$board.length.times{ |i|
  $board[i] = Array.new(3,0..2)
}

for num in 0..2 do
  p $board[0..2][num]
  p $board[num][0..2]
end