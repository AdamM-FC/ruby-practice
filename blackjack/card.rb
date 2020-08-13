# frozen_string_literal: true

class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def card_value
    return 10 if %w[J Q K].include?(@value)
    return 11 if @value == 'A'
    
    @value
  end

  def to_s
   "#{value} - #{suit}"
  end
end
