require './Place'
require './Judge'
require './Player'

player1_turn = 1

board = Array.new(3,0){ Array.new(3,0) }
turn = player1_turn
count = 0
row = 10
column = 10

place = Place.new
judge = Judge.new
player1 = Player.new
player2 = Player.new

(0..8).each do |cycle|
    
  turn == 1 ?
  player1.input(board, row, column, turn) :
  player2.input(board, row, column, turn)
  
  if judge.win(board)
    place.show(board)
    print( "winner is player",turn," !!\n")
    break
  end
  
  count = cycle
  turn == player1_turn ? turn += 1 : turn -= 1
end

if count == 8
  place.show(board)
  print( "Draw !!\n")
end