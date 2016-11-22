require_relative "../lib/tic_tac_toe.rb"

puts "Welcome to Tic Tac Toe"
bob = TicTacToe::Player.new({ color: "X", name: "bob" })
frank = TicTacToe::Player.new({ color: "O", name: "frank" })
players = [bob, frank]
TicTacToe::Game.new(players).play