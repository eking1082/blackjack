module Blackjack
  describe 'Player' do
    before(:each) do
      @player = Player.new
    end

    describe '#hand_value' do
      it 'sums the correct value for Q 2 5' do
        @player.hand = [
          Card.new('Q', 'Spades'),
          Card.new('2', 'Clubs'),
          Card.new('5', 'Hearts')
        ]
        expect(@player.hand_value).to eq(17)
      end

      it 'sums the correct value for A 3 10' do
        @player.hand = [
          Card.new('A', 'Spades'),
          Card.new('3', 'Clubs'),
          Card.new('10', 'Hearts')
        ]
        expect(@player.hand_value).to eq(14)
      end

      it 'sums the correct value for A 2 7' do
        @player.hand = [
          Card.new('A', 'Spades'),
          Card.new('2', 'Clubs'),
          Card.new('7', 'Hearts')
        ]
        expect(@player.hand_value).to eq(20)
      end

      it 'sums the correct value for A 2 A 4' do
        @player.hand = [
          Card.new('A', 'Spades'),
          Card.new('2', 'Clubs'),
          Card.new('A', 'Diamonds'),
          Card.new('4', 'Hearts')
        ]
        expect(@player.hand_value).to eq(18)
      end
    end

    describe '#hit?' do
      it 'stays on 18' do
        @player.hand = [
          Card.new('Q', 'Spades'),
          Card.new('2', 'Clubs'),
          Card.new('6', 'Hearts')
        ]
        expect(@player.hit?).to be(false)
      end

      it 'hits on 10' do
        @player.hand = [
          Card.new('3', 'Clubs'),
          Card.new('7', 'Hearts')
        ]
        expect(@player.hit?).to be(true)
      end
    end
  end
end
