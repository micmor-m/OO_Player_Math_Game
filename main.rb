# This is the main entrypoint into the program
# It requires the other files/gems that it needs
# require 'pp'
require './player'
require './game'

player1 = Player.new('Player 1')
player2 = Player.new('Player 2')

game = Game.new(player1, player2)

# game(player1, player2)
#for test
#game.player

#start the game
game.play