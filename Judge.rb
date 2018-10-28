class Judge
  def row_line(bingo,board)
    if board[bingo][0..2].uniq.count == 1 &&
       board[bingo][0]!=0
      true
    else
      false
    end
  end

  def column_line(bingo,board)
    if board[0][bingo] == board[1][bingo] &&
       board[0][bingo] == board[2][bingo] &&
       board[0][bingo]!=0
       true
    else
      false
    end
  end

  def diagonal_left(board)
    if board[0][0] == board[1][1] &&
      board[0][0] == board[2][2] &&
      board[0][0]!=0
      true
    else
      false
    end
  end

  def diagonal_right(board)
    if board[0][2] == board[1][1] &&
        board[0][2] == board[2][0] &&
        board[0][2]!=0
        true
    else
      false
    end
  end

  def win(board)
    flag = false
    (0..2).each do | bingo |
      if row_line(bingo,board) || column_line(bingo,board) ||
         diagonal_left(board) || diagonal_right(board)
        flag = true
      end
    end
    if flag
      true
    end
  end
end