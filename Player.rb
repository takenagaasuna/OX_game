class Player 
  def input(board, row, column, turn)
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
  end
end