require "spec_helper"

module TicTacToe
	describe Cell do 
		context "#initialize" do 
			it "creates empty string by default" do 
				cell = Cell.new
				expect(cell.value).to eq ""
			end

			it "excepts 'X' as a value" do 
				cell = Cell.new("X")
				expect(cell.value).to eq "X"
			end	
		end

		context "#value" do 
			it "value can be changed" do 
				cell = Cell.new
				cell.value = "X"
				expect(cell.value).to eq "X"
			end
		end
	end
end