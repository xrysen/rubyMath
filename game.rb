class Game
  attr_accessor :current_turn, :state

  def initialize(p1, p2)
    @state = "Playing"
    @p1 = p1
    @p2 = p2
    @current_turn = @p1
  end

  def generate_question
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = @num1 + @num2
    puts "#{@current_turn.name} What's #{@num1} plus #{@num2}?"
  end

  def change_turn
    if @current_turn == @p1 
      @current_turn = @p2
    else
      @current_turn = @p1
    end
    if @state != "Game Over"
      puts "----- NEW TURN -----"
    end
  end

  def check_score
    if @p1.lives == 0 || @p2.lives == 0
      @state = "Game Over"
    end
  end

  def game_over
    if @p1.lives > @p2.lives
      puts "#{@p1.name} wins with a score of #{@p1.lives}/3"
    else
      puts "#{@p2.name} wins with a score of #{@p2.lives}/3"
    end

    puts "----- GAME OVER -----"
    puts "Goodbye!"
  end

  def game_loop
    while @state != "Game Over"
      generate_question()
      puts "Should be #{@answer}"
      answer = gets.chomp
      if answer.to_i == @answer
        puts "#{@current_turn.name}: YES! You are correct!"
        puts "P1: #{@p1.lives}/3 vs. P2: #{@p2.lives}/3"
        change_turn()
      else
        puts "#{@current_turn.name}: Seriously? No!"
        @current_turn.take_life()
        puts "P1: #{@p1.lives}/3 vs. P2: #{@p2.lives}/3"
        check_score()
        change_turn()
      end
    end 
    game_over()
  end
end