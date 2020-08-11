# frozen_string_literal: true

class Dice
  def initialize
    @answer = roll_dice
  end

  def roll_dice
   rand(1..6)
  end

  def win?(user_guess)
    user_guess == @answer
  end

  def game_winner(name)
    puts "Congratulations #{name}, you win!"
  end

  def debug
    puts "The dice is #{@answer}"
  end
end
