class Player
  MAX_HEALTH = 3
  attr_accessor :name, :lives

  def initialize(name)
    @name = name
    @lives = MAX_HEALTH
  end

  def take_life()
    @lives -= 1
  end
end