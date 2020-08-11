# frozen_string_literal: true

require_relative './dice.rb'

puts 'Welcome to the dice game where you have to guess the roll of the dice'
puts 'This is a 2 player game, the first person to guess the roll of the dice wins'

players = []

2.times do |i|
  puts "Enter player name #{i + 1}"
  player = gets.chomp
  puts "Hello #{player}"
  players << player
end

dice = Dice.new

loop do
  players.each do |player|
    begin
      puts "#{player}, enter your guess"
      user_guess = gets.chomp
      user_guess = Integer(user_guess)
    rescue ArgumentError
      puts 'Please enter a number:'
      retry
    end
    answer_correct = dice.win?(user_guess)

    dice.game_winner(player) if answer_correct
    exit if answer_correct
    puts "You guessed #{user_guess}, that is incorrect"
  end
end
