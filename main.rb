require "./game"
require "./player"

p1 = Player.new("Player 1")
p2 = Player.new("Player 2")

game = Game.new()
game.game_loop()