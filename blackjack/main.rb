# frozen_string_literal: true

require_relative './blackjack.rb'
require_relative './hand.rb'
require_relative './card.rb'

puts 'Welcome to blackjack'
puts 'Enter your name'
name = gets.chomp

puts "Hello #{name}, lets play"
puts ''

# start game
game = Blackjack.new
game.play(name)