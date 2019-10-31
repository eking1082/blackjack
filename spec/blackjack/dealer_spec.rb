module Blackjack
  describe 'Dealer' do
    before(:each) do
      @dealer = Dealer.new
    end

    describe '#hit?' do
      it 'stays when player\'s hand is beaten' do
        @dealer.hand = [
          Card.new('Q', 'Spades'),
          Card.new('2', 'Clubs'),
          Card.new('6', 'Hearts')
        ]
        expect(@dealer.hit?(16)).to be(false)
      end

      it 'hits when player\'s hand is not beaten' do
        @dealer.hand = [
          Card.new('3', 'Clubs'),
          Card.new('7', 'Hearts')
        ]
        expect(@dealer.hit?(17)).to be(true)
      end

      it 'stays when player\'s hand is tied' do
        @dealer.hand = [
          Card.new('10', 'Clubs'),
          Card.new('2', 'Hearts'),
          Card.new('6', 'Diamonds')
        ]
        expect(@dealer.hit?(18)).to be(false)
      end
    end
  end
end
