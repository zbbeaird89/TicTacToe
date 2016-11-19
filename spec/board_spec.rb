require "spec_helper"

module TicTacToe
	describe Board do 
		context "#initialize" do 
			it "passes when initialized with a hash that has a grid key" do
				expect { Board.new({ grid: "grid" }) }.to_not raise_error
			end

			it "creates 3 rows by default" do 
				board = Board.new
				expect(board.grid.length).to eq 3
			end

			it "creates 3 columns by default" do 
				board = Board.new
				board.grid.each do |row|
					expect(row.length).to eq 3
				end
			end
		end

		context "#grid" do 
			it "returns the grid" do 
				board = Board.new(grid: "blah")
				expect(board.grid).to eq "blah"
			end
		end

		context "#get_cell" do 
			it "returns the cell at the given coordinates" do 
				grid = [["", "", ""], ["", "", "Hello"], ["", "", ""]]
				board = Board.new(grid: grid)
				expect(board.get_cell(2, 1)).to eq "Hello"
			end
		end

		context "#set_cell" do 
			it "updates the value of a cell" do 
				Cat = Struct.new(:value)	
				grid = [[Cat.new("Hello"), "", ""], ["", "", ""], ["", "", ""]]
				board = Board.new(grid: grid)
				board.set_cell(0, 0, "Meow")
				expect(board.get_cell(0, 0).value).to eq "Meow"
			end
		end

		context "#game_over" do 
			it "returns :winner if winner? is true" do 
				board = Board.new
				board.stub(:winner?) { true }
				expect(board.game_over).to eq :winner
			end

			it "returns :draw if winner? is false and draw? is true" do 
				board = Board.new
				board.stub(:winner?) { false }
				board.stub(:draw?) { true }
				expect(board.game_over).to eq :draw
			end

			it "returns false if winner? is false and draw? is false" do 
				board = Board.new
				board.stub(:winner?) { false }
				board.stub(:draw?) { false }
				expect(board.game_over).to eq false
			end
		end
	end
end