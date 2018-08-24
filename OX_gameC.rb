require './Place'
require './Judge'
require './Player'

board = Array.new(3,0){ Array.new(3,0) }
turn = 1
count = 0
row = 10
column = 10

place = Place.new
judge = Judge.new
player = Player.new

(0..8).each do |cycle|
  print("\nPlayer",turn ," turn !\n\n")
  place.show(board)
    
  player.input(board, row, column, turn)
  
  if judge.win(board)
    place.show(board)
    print( "winner is player",turn," !!\n")
    break
  end
  
  count = cycle
  turn == 1 ? turn += 1 : turn -= 1
end

if count == 8
  place.show(board)
  print( "Draw !!\n")
end