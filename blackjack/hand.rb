# frozen_string_literal: true

require_relative './card.rb'

class Hand
  attr_reader :total_value
  
  def initialize
    @cards = []
    @total_value = 0
  end

  def add_card(card)
    @cards << card
    @total_value = cards_value
  end

  def sample_card
    @cards.sample
  end

  def cards_value
    @cards.inject(0) do |sum, card|
      sum + card.card_value
    end
  end

  def show_hand
    @cards.each do |card|
      puts "#{card.card_value} - #{card.suit}"
    end
    puts "Total value is #{total_value}"
  end
end
