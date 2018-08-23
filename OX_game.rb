def show
  (0..4).each do | locate |
    if locate.even?
      (0..2).each do |locate2 |
        case $board[locate/2][locate2]
        when 0
          ox = "  "
        when 1
          ox = "〇"
        when 2
          ox = "✕"
        end
        print(ox," | ")
      end
      print("\n")
    else
      13.times{ print("―") }
      print("\n")
    end
  end
end
  
def row_line(bingo)
  if $board[bingo][0..2].uniq.count == 1 &&
     $board[bingo][0]!=0 then
    true
  else
    false
  end
end

def column_line(bingo)
  if $board[0][bingo] == $board[1][bingo] &&
     $board[0][bingo] == $board[2][bingo] &&
     $board[0][bingo]!=0 then
     true
  else
    false
  end
end

def diagonal_left
  if $board[0][0] == $board[1][1] &&
    $board[0][0] == $board[2][2] &&
    $board[0][0]!=0 then
    true
  else
    false
  end
end

def diagonal_right
  if $board[0][2] == $board[1][1] &&
      $board[0][2] == $board[2][0] &&
      $board[0][2]!=0 then
      true
    else
      false
  end
end

     
def win
  (0..2).each do | bingo |
    if row_line(bingo) || column_line(bingo) ||
       diagonal_left || diagonal_right then
      return true
    end
  end
  return false
end

$board = Array.new(3,0){ Array.new(3,0) }
turn = 1

(0..8).each do | i |
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
  if judge then
    show
    print( "winner is player",turn,"!!\n")
    break
  end
  
  @count = i
  turn == 1 ? turn += 1 : turn -= 1
end

if @count == 8
  show
  print( "Draw !!\n")
end