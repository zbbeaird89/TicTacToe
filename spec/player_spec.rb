require "spec_helper"

module TicTacToe
	describe Player do 
		context "#initialize" do 
			it "raises exception when given {}" do 
				expect { Player.new }.to raise_error
			end

			it "passes when given correct values" do 
				player = Player.new({ name: "Zach", color: "X" })
				expect { player }.to_not raise_error
			end
		end

		context "#name" do 
			it "returns the player's name" do 
				player = Player.new({ name: "Zach", color: "X" })
				expect(player.name).to eq "Zach"
			end
		end

		context "#color" do 
			it "returns the player's color" do 
				player = Player.new({ name: "Zach", color: "X" })
				expect(player.color).to eq "X"
			end
		end
	end
end