module TicTacToe
	class Player 
		attr_reader :name
		attr_accessor :color
		def initialize(input = {})
			@name  = input.fetch(:name)
			@color = input.fetch(:color)
		end
	end
end