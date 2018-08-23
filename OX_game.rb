def show
  for num in 0..4 do
    if num%2 == 0 then
      for num2 in 0..2 do
        case $board[num/2][num2]
          when 0 then
            ox = "  "
          when 1 then
            ox = "〇"
          when 2 then
            ox = "✕"
        end
        print(ox," | ")
      end
      print("\n")
    else
      13.times{
        print("―")
      }
      print("\n")
    end
  end
end
  

def win
  for num in 0..2 do
    if ($board[0][num] == $board[1][num] && $board[0][num] == $board[2][num] &&
        $board[0][num]!=0)||
       ($board[num][0..2].uniq.count == 1 && $board[num][0]!=0)||
       ($board[0][0] == $board[1][1] && $board[0][0] == $board[2][2] && $board[0][0]!=0) ||
       ($board[0][2] == $board[1][1] && $board[0][2] == $board[2][0] && $board[0][2]!=0)
        then
      return true
    end
  end
  return false
end

$board = Array.new(3,0){ Array.new(3,0) }
turn = 1

for count in 0..8 do
  print("\nPlayer",turn ," turn !\n\n")
  show
    
  begin
  print("input row-number(0~2): ")
  row = gets.to_i
  print("input column-number(0~2): ")
  column = gets.to_i
    
  if row > 2|| column >2 then
     print("Cannot draw !!\n")
     redo
  end
  if $board[row][column] != 0 then
     print("Cannot draw !!\n")
  end
  end while $board[row][column] != 0

  $board[row][column] = turn
  judge = win
  if judge == true then
    show
    print( "winner is player",turn,"!!\n")
    break
  end
        
  if turn == 1 then
    turn += 1
  else 
    turn -= 1
  end
end

if count == 8 then
  show
  print( "Draw !!\n")
end