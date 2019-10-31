module Blackjack
  class Player
    attr_accessor :hand

    def initialize
      @hand = []
      @stay_at = 16
    end

    def hand_value
      aces, rest = hand.partition { |card| card.face == 'A' }
      value = rest.sum { |card| %w[J Q K].include?(card.face) ? 10 : card.face.to_i }
      return value if aces.empty?

      aces.length.times { value += value > 10 ? 1 : 11 }
      value
    end

    def hit?
      hand_value < @stay_at
    end
  end
end
