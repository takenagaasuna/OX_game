#board[3][3]

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
