require './player'

class Game

  attr_accessor :result, :turn, :plays
  
  def initialize(player1, player2)
    @player1= player1
    @player2= player2
    @plays = 0
  end

  def turn(num1, num2, player)
    puts "#{player.name}: What does #{num1} plus #{num2} equal?"
    result = $stdin.gets.chomp
    #p result
    #p num1 + num2

    if result.to_i === (num1 + num2) 
      then puts "YES! You are correct"
      player.score += 1
      else  puts "#{player.name} Seriously? No!" 
        player.lives -= 1
        #puts "#{player.name} you still have #{player.lives} lives!" 
    end
  end

  def update(player1, player2)
    puts "#{player1.name} #{player1.lives}/3 vs  #{player2.name} #{player2.lives}/3"
    if (player1.lives > 0) && (player2.lives > 0) 
    then puts "------ NEW TURN -----" 
    else
      if (player1.lives === 0)
      then puts "Player 2 wins with a score of #{player2.score}/#{self.plays}\n------ GAME OVER-----\nGood bye!"
      else puts "Player 1 wins with a score of #{player1.score}/#{self.plays}\n------ GAME OVER-----\nGood bye!"
      end
    end
  end

  #  this.turn(prng1.rand(0..20), prng2.rand(0..20))
  #   #update message
  #   @player1.update(player2)
  def play  
    prng1 = Random.new()
    prng2 = Random.new()
    
    i = 1
    while i 
      @plays += 1 
      #make question and get answer
      self.turn(prng1.rand(0..20), prng2.rand(0..20), @player1)
      #update message
      self.update(@player1, @player2)

      #p "i = #{i}"

      if @player1.lives === 0 
        then i = 0
        #p "inside if"
        exit(0)
      end

      self.turn(prng1.rand(0..20), prng2.rand(0..20), @player2)
      #update message
      self.update(@player1, @player2)

      #p "i = #{i}"

      if @player2.lives === 0 
        then i = 0
        #p "inside if"
        exit(0)
      end
    end
  end
end



  
