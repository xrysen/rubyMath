require "./player"

class Game
  attr_accessor :current_turn, :state

  def game_loop
    while @state != "Game Over"
      @state = gets.chomp
      puts "#{state}"
    end 
  end
end