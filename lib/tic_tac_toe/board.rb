module TicTacToe
	class Board
		attr_accessor :grid
		def intialize(input = {})
			@grid = input.fetch(:grid, default_grid)
		end

		private

		def default_grid
			Array.new(3) { Array.new(3) { Cell.new } }
		end
	end
end