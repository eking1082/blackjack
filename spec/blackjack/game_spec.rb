module Blackjack
  describe 'Game' do
    before(:each) do
      @player = Player.new
      @dealer = Dealer.new
    end

    describe '#play' do
      it 'plays a game with unshuffled shoe' do
        shoe = Shoe.new
        game = Game.new(@player, @dealer)
        expect(game.play(shoe)).to be(true)
        expect(game.to_s).to eq([
          "Player hand: A Spades, Q Spades = 21",
          "Dealer hand: K Spades, J Spades, 10 Spades = 30",
          "Result: Player wins!",
        ].join("\n"))
      end
    end

    describe '#to_s' do
      it 'builds string properly' do
        @player.hand = [
          Card.new('Q', 'Spades'),
          Card.new('2', 'Clubs'),
          Card.new('5', 'Hearts')
        ]
        @dealer.hand = [
          Card.new('A', 'Spades'),
          Card.new('2', 'Clubs'),
          Card.new('7', 'Hearts')
        ]

        game = Game.new(@player, @dealer)
        game.winner = 'Dealer'

        expect(game.to_s).to eq([
          "Player hand: Q Spades, 2 Clubs, 5 Hearts = 17",
          "Dealer hand: A Spades, 2 Clubs, 7 Hearts = 20",
          "Result: Dealer wins!",
        ].join("\n"))
      end

      it 'handles push properly' do
        @player.hand = [
          Card.new('Q', 'Spades'),
          Card.new('2', 'Clubs'),
          Card.new('5', 'Hearts')
        ]
        @dealer.hand = [
          Card.new('Q', 'Spades'),
          Card.new('2', 'Clubs'),
          Card.new('5', 'Hearts')
        ]

        game = Game.new(@player, @dealer)
        game.winner = 'Push'

        expect(game.to_s).to eq([
          "Player hand: Q Spades, 2 Clubs, 5 Hearts = 17",
          "Dealer hand: Q Spades, 2 Clubs, 5 Hearts = 17",
          "Result: Push!",
        ].join("\n"))
      end
    end
  end
end
