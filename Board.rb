class Board

  def draw(board,locate)
    (0..2).each do |locate2 |
      case board[locate/2][locate2]
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
  end

  def show(board)
    (0..4).each do | locate |
      if locate.even?
        draw(board,locate)
      else
        13.times{ print("―") }
      print("\n")
      end
    end
  end
end