module Blackjack
  class Table
    def initialize
      @games = []
      @shoe = Shoe.new
      @shoe.shuffle!
      @start_time = Time.now
    end

    def play
      loop do
        dealer = Dealer.new
        player = Player.new

        game = Game.new(player, dealer)
        break unless game.play(@shoe)

        puts game, "\n"
        @games << game
      end
    end

    def report_results
      player_wins = @games.select { |game| game.winner == 'Player' }
      player_success_rate = ((player_wins.length / @games.length.to_f) * 100).round(1)

      player_winning_hands = {}
      player_wins.each do |game|
        if player_winning_hands.has_key?(game.player.hand_value)
          player_winning_hands[game.player.hand_value] += 1
        else
          player_winning_hands[game.player.hand_value] = 1
        end
      end

      winning_hands_string = player_winning_hands.sort.reverse.map do |hand_value, count|
        "#{hand_value} => #{count}"
      end.join("\n")

      puts "Number of games: #{@games.length}", "\n"
      puts "Player Success: #{player_success_rate}%", "\n"
      puts "Player Winning Hand => # of times achieved"
      puts winning_hands_string, "\n"
      puts "Time to run: #{((Time.now - @start_time) * 1000).round(2)}ms"
    end
  end
end
