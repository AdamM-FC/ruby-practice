# frozen_string_literal: true

require_relative './card.rb'

class Deck
  attr_reader :cards

  def initialize
    @cards = []

    setup_deck
  end

  def setup_deck
    %i[clubs diamonds spades hearts].each do |suit|
      (2..10).each do |number|
        @cards << Card.new(suit, number)
      end

      %w[J Q K A].each do |facecard|
        @cards << Card.new(suit, facecard)
      end
    end

    3.times { @cards.shuffle! }
  end

  def pop_card
    @cards.pop
  end
end
