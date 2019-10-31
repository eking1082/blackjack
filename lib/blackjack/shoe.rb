module Blackjack
  class Shoe
    DECK_COUNT = 6

    def initialize
      @shoe = Shoe.create_deck * DECK_COUNT
    end

    def shuffle!
      @shoe.shuffle!
    end

    def deal_card
      @shoe.pop
    end

    def count
      @shoe.length
    end

    def empty?
      @shoe.empty?
    end

    def self.create_deck
      %w[Clubs Diamonds Hearts Spades].map do |suit|
        %w[2 3 4 5 6 7 8 9 10 J Q K A].map do |face|
          Card.new(face, suit)
        end
      end.flatten
    end
  end
end
