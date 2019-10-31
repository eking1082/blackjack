module Blackjack
  describe 'Shoe' do
    before(:each) do
      @shoe = Shoe.new
    end

    describe '#initialize' do
      it 'creates a shoe with the correct number of cards' do
        expect(@shoe.count).to eq(52 * 6)
      end
    end

    describe '#deal_card' do
      it 'removes a card from the shoe' do
        card = @shoe.deal_card
        expect(card).to be_kind_of(Card)
        expect(@shoe.count).to eq((52 * 6) - 1)
      end
    end
  end
end
