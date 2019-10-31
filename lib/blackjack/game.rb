module Blackjack
  class Game
    attr_reader :player
    attr_accessor :winner

    def initialize(player, dealer)
      @winner = nil
      @player = player
      @dealer = dealer
    end

    def play(shoe)
      return false if shoe.count < 4

      @player.hand << shoe.deal_card
      @dealer.hand << shoe.deal_card
      @player.hand << shoe.deal_card
      @dealer.hand << shoe.deal_card

      while @player.hit?
        return false if shoe.empty?

        @player.hand << shoe.deal_card
      end

      player_value = @player.hand_value
      if player_value > 21
        @winner = 'Dealer'
        return true
      end

      while @dealer.hit?(player_value)
        return false if shoe.empty?

        @dealer.hand << shoe.deal_card
      end

      dealer_value = @dealer.hand_value
      @winner = if dealer_value <= 21 && dealer_value > player_value
                 'Dealer'
               elsif dealer_value == player_value
                 'Push'
               else
                 'Player'
      end

      true
    end

    def to_s
      game_string = "Player hand: #{@player.hand.join(', ')} = #{@player.hand_value}\n"
      game_string += "Dealer hand: #{@dealer.hand.join(', ')} = #{@dealer.hand_value}\n"
      game_string += if @winner != 'Push'
                       "Result: #{@winner} wins!"
                     else
                       'Result: Push!'
                     end

      game_string
    end
  end
end
