module TicTacToe
	class Game 
		attr_reader :players, :board, :current_player, :other_player
		def initialize(players, board = Board.new)
			@players = players
			@board   = board
			@current_player, @other_player = players.shuffle
		end

		def switch_players 
			@current_player, @other_player = @other_player, @current_player
		end

		def solicit_move
			"#{current_player.name}: Enter a number between 1 and 9 to make your move."
		end

		def get_move(human_move = gets.chomp)
			human_move_to_coordinate(human_move)
		end

		def game_over_message
			return "#{current_player.name} won!" if board.game_over == :winner
			return "The game ended in a tie!" if board.game_over == :draw
		end

		def player_input
			move = nil
			until move.is_a?(Fixnum) 
				if @current_player.name == "Computer"
					value = rand(1..9).to_s
					move = check_move(value)
				else
				    puts solicit_move
					value = gets.chomp
					move = check_move(value)
				end
			end

			x, y = get_move(move.to_s)

			if board.get_cell(x, y).value != ""
				board.formatted_grid
				puts "That cell is already taken."
				player_input
			else
				board.set_cell(x, y, current_player.color)
			end
		end

		def check_move(input)
			value = input.to_i
			unless value.is_a?(Fixnum) && value.between?(1, 9)
				board.formatted_grid
				puts "Incorrect input."
				return false
			else
				return value
			end
		end

		def play 
			puts "#{current_player.name} has been randomly selected as the first player."
			while true
				board.formatted_grid
				player_input
				if board.game_over
					puts game_over_message
					board.formatted_grid
					return
				else
					switch_players
				end
			end
		end



		private


		def human_move_to_coordinate(human_move)
			mapping = {
				"1" => [0, 0],
				"2" => [1, 0],
				"3" => [2, 0],
				"4" => [0, 1],
				"5" => [1, 1],
				"6" => [2, 1],
				"7" => [0, 2],
				"8" => [1, 2],
				"9" => [2, 2]
			}
			mapping[human_move]
		end
	end
end