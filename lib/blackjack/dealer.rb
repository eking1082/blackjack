module Blackjack
  class Dealer < Player
    def initialize
      @hand = []
    end

    def hit?(value_to_beat)
      hand_value < value_to_beat
    end
  end
end
