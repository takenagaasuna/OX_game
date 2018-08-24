def draw(board, locate)
  (0..2).each do |locate2|
    case board[locate/2][locate2]
    when 0
      ox = "  "
    when 1
      ox = "〇"
    when 2
      ox = "✕"
    end
    print(ox, " | ")
  end
  print("\n")
end

def show(board)
  (0..4).each do |locate|
    if locate.even?
      draw(board, locate)
    else
      13.times { print("―") }
      print("\n")
    end
  end
end
  
def row_line?(bingo, board)
  if board[bingo][0..2].uniq.count == 1 &&
     board[bingo][0]!=0
    true
  else
    false
  end
end

def column_line?(bingo, board)
  if board[0][bingo] == board[1][bingo] &&
     board[0][bingo] == board[2][bingo] &&
     board[0][bingo]!=0
     true
  else
    false
  end
end

def diagonal_left?(board)
  if board[0][0] == board[1][1] &&
    board[0][0] == board[2][2] &&
    board[0][0] != 0
    true
  else
    false
  end
end

def diagonal_right?(board)
  if board[0][2] == board[1][1] &&
      board[0][2] == board[2][0] &&
      board[0][2] != 0
      true
    else
      false
  end
end

def win?(board)
  flag = false
  (0..2).each do |bingo|
    if row_line?(bingo, board) || column_line?(bingo, board) ||
       diagonal_left?(board) || diagonal_right?(board)
      flag = true
    end
  end
  flag
end

board = Array.new(3,0){ Array.new(3,0) }
turn = 1
count =0

(0..8).each do |cycle|
  print("\nPlayer",turn," turn !\n\n")
  show(board)
    
  begin
    print("input row-number(0~2): ")
    row = gets.to_i
    print("input column-number(0~2): ")
    column = gets.to_i
    
    if row > 2 || column >2
       print("Cannot draw !!\n")
       redo
    end
    if board[row][column] != 0
       print("Cannot draw !!\n")
    end
  end while board[row][column] != 0

  board[row][column] = turn
  if win?(board)
    show(board)
    print( "winner is player",turn," !!\n")
    break
  end
  
  count = cycle
  turn == 1 ? turn += 1 : turn -= 1
end

if count == 8
  show(board)
  print( "Draw !!\n")
end