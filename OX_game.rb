board[0,0,0][0,0,0]
turn = 1

for num in 0..4 do
  if num%2 == 0 then
      2.times{
        print(" | ")
      }
      print("\n")
  else
      3.times{
        print("ー")
      }
      print("\n")
  end
end

print("input row-number: ")
  row = gets
  row = row.chomp!
  p row
print("input column-number: ")
  column = gets
  column = column.chomp!
  p column
  
  if board[row][column]!=0 then
      print("Cannot draw !!")
  else
      board[raw][column] = turn
      if turn == 1 then
          turn += 1
      else 
          turn -= 1
      end
  end
