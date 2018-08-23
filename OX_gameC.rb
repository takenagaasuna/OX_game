require './Board'
require './Judge'

board = Array.new(3,0){ Array.new(3,0) }
turn = 1
count =0

(0..8).each do | cycle |
  print("\nPlayer",turn ," turn !\n\n")
  show(board)
    
  begin
    print("input row-number(0~2): ")
    row = gets.to_i
    print("input column-number(0~2): ")
    column = gets.to_i
    
    if row > 2|| column >2
       print("Cannot draw !!\n")
       redo
    end
    if board[row][column] != 0
       print("Cannot draw !!\n")
    end
  end while board[row][column] != 0

  board[row][column] = turn
  judge = win(board)
  if judge
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