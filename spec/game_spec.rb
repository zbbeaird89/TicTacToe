require "spec_helper"
require "stringio"

module TicTacToe
	describe Game do 
		let(:bob) { Player.new({ color: "X", name: "bob" }) }
		let(:frank) { Player.new({ color: "O", name: "frank" }) }

		context "#initialize" do 
			it "randomly selects a current_player" do 
				players = [bob, frank]
				allow(players).to receive(:shuffle).and_return([frank, bob])
				game = Game.new(players)
				expect(game.current_player).to eq frank 
			end

			it "randomly selects the other_player" do 
				players = [bob, frank]
				allow(players).to receive(:shuffle).and_return([frank, bob])
				game = Game.new(players)
				expect(game.other_player).to eq bob
			end
		end

		context "#switch_players" do 
			it "will set current_player to other_player" do 
				game = Game.new([bob, frank])
				other_player = game.other_player
				game.switch_players
				expect(game.current_player).to eq other_player
			end

			it "will set other_player to current_player" do 
				game = Game.new([bob, frank])
				current_player = game.current_player
				game.switch_players
				expect(game.other_player).to eq current_player
			end
		end

		context "#solicit_move" do 
			it "asks the player to make a move" do 
				game = Game.new([bob, frank])
				allow(game).to receive(:current_player).and_return(bob)
				expected = "bob: Enter a number between 1 and 9 to make your move."
				expect(game.solicit_move).to eq expected
			end
		end

		context "#get_move" do 
			it "converts human_move of '1' to [0, 0]" do 
				game = Game.new([bob, frank])
				expect(game.get_move("1")).to eq [0, 0]
			end

			it "converts human_move of '7' to [0, 2]" do 
				game = Game.new([bob, frank])
				expect(game.get_move("7")).to eq [0, 2] 
			end
		end

		context "#game_over_message" do 
			it "returns {current player name} if the board shows a winner" do 
				game = Game.new([bob, frank])
				allow(game).to receive(:current_player).and_return(bob)
				allow(game.board).to receive(:game_over).and_return(:winner)
				expect(game.game_over_message).to eq "bob won!"
			end

			it "returns 'The game ended in a tie!' if the board shows a draw" do 
				game = Game.new([bob, frank])
				allow(game.board).to receive(:game_over).and_return(:draw)
				expect(game.game_over_message).to eq "The game ended in a tie!"
			end
		end

		context "#check_move" do 
			it "passes when input is a number" do 
				game = Game.new([bob, frank])
				allow(game).to receive(:solicit_move).and_return(1)
				move = game.solicit_move
				expect(game.check_move(move)).to eq 1
			end

			it "returns false when input is not a number" do 
				game = Game.new([bob, frank])
				allow(game).to receive(:solicit_move).and_return("A")
				move = game.solicit_move
				expect(game.check_move(move)).to eq false
			end

			it "returns false when input isn't 1 - 9" do 
				game = Game.new([bob, frank])
				allow(game).to receive(:solicit_move).and_return(10)
				move = game.solicit_move
				expect(game.check_move(move)).to eq false
			end
		end
	end
end	