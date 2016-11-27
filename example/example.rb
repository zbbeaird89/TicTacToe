require_relative "../lib/tic_tac_toe.rb"

puts "Welcome to Tic Tac Toe"

puts "1 player or 2 players? (Type 1 or 2)"

num_of_players = gets.chomp

puts "What is your name?"

human_name = gets.chomp

color1 = nil
color2 = nil
color1, color2 = ["X", "O"].shuffle

human_player1 = nil
human_player2 = nil
computer = nil

if num_of_players == "1"
	human_player = TicTacToe::Player.new({ color: color1, name: human_name })
	computer = TicTacToe::Player.new({ color: color2, name: "Computer" })
end

players = [human_player, computer]
TicTacToe::Game.new(players).play
