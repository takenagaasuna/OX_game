$board = Array.new(3,0)
$board.length.times{ |i|
  $board[i] = Array.new(3,0)
}
turn = 1
$ox = 0

9.times{
    for num in 0..4 do
      if num%2 == 0 then
          for num2 in 0..2 do
              case $board[num/2][num2]
                when 0 then
                  ox = "△"
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
    
    print("input row-number: ")
    row = gets.to_i
    #p row
    print("input column-number: ")
    column = gets.to_i
    #p column
      
    if $board[row][column]!=0 then
       print("Cannot draw !!\n")
    end
      $board[row][column] = turn
      #p $board
      if turn == 1 then
        turn += 1
      else 
        turn -= 1
      end
}
