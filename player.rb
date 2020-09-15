
require './game'

class Player
  attr_accessor :lives, :score
  attr_reader :name

  def initialize(name)
    @name= name
    @lives = 3
    @score = 0
  end
end
