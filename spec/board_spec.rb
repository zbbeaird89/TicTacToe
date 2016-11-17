module TicTacToe
	describe Board do 
		context "#initialize" do 
			it "passes when initialized with a hash that has a grid key" do
				expect { Board.new({ grid: "grid" }) }.to_not raise_error
			end
		end
	end
end