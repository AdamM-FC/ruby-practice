# frozen_string_literal: true

require_relative './card.rb'
require_relative './hand.rb'
require_relative './deck.rb'

class Blackjack
  attr_reader :deck
  attr_reader :dealer
  attr_reader :player

  def initialize
    @deck = Deck.new
    @dealer = Hand.new
    @player = Hand.new

    2.times { hit_me(player) }
    2.times { hit_me(dealer) }
  end


  def play(name)
    @name = name
    reveal_face_up_dealer_card

    puts 'Your turn first'
    puts '---Players Hand---'
    player.show_hand

    # user goes first
    users_turn

    # check if player is bust
    is_player_bust = check_if_bust?(player)

    # if player is bust, just finish game
    finish if is_player_bust

    # if not, then dealer goes next
    dealers_turn unless is_player_bust
  end

  private

  def reveal_face_up_dealer_card
    puts 'Dealers face up card is:'
    puts @dealer.sample_card
    puts ''
  end

  def users_turn
    loop do
      puts 'Do you want to hit (h) or stay (s)'
      input = gets.chomp
      case input
      when 'h'
        hit_me(@player)
        puts '---Players Hand---'
        @player.show_hand
        break if check_if_bust?(player)
      when 's'
        puts 'You have chosen to stay'
        break
      else
        puts 'Entered wrong command'
      end
    end
  end

  def dealers_turn
    puts 'Dealer has chosen hit'
    hit_me(dealer)
    dealers_turn if dealer.cards_value < 16
    finish if dealer.cards_value >= 16
  end

  def check_if_bust?(hand)
    hand.cards_value > 21
  end

  def hit_me(hand)
    card = @deck.pop_card
    hand.add_card(card)
  end

  def finish
    show_both_hands

    player_value = @player.cards_value
    dealer_value = @dealer.cards_value

    check_winner(player_value, dealer_value)
    print_score
  end

  def show_both_hands
    # show players hand
    puts '---Players Hand---'
    player.show_hand
    puts ''

    puts '---Dealers hand---'
    # show dealers hand
    dealer.show_hand
    puts ''
  end

  def check_winner(player_value, dealer_value)
    return puts 'You win as dealer is bust' if dealer_value > 21
    return puts 'Dealer wins as you are bust' if player_value > 21

    if dealer_value > player_value
      puts "Sorry #{@name}, dealer wins this time"
    elsif player_value == dealer_value
      puts 'You both have the same score, PUSH!'
    else
      puts "Congrats #{@name}, you win!"
    end
  end

  def print_score
    player_value = @player.cards_value
    dealer_value = @dealer.cards_value

    puts "Your hand value was #{player_value}"
    puts "Dealers hand value was #{dealer_value}"
  end
end
