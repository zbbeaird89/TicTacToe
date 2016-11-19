require "spec_helper"

describe Array do 
	context "#all_empty?" do 
		it "returns true if all elements in the array are empty" do 
			expect(["", "", ""].all_empty?).to eq true
		end

		it "returns false if some elements in the array are empty" do 
			expect(["", "Hello", 3].all_empty?).to eq false
		end

		it "returns true for an empty array" do 
			expect([].all_empty?).to eq true
		end
	end

	context "#all_same?" do 
		it "returns true if all elements in the array are the same" do 
			expect(["X", "X", "X"].all_same?).to eq true
		end

		it "returns false if some elements in the array are the same" do 
			expect(["X", "O", "X"].all_same?).to eq false
		end

		it "returns true for an empty array" do 
			expect([].all_same?).to eq true
		end
	end

	context "#any_empty?" do 
		it "returns true if any elements in the array are empty" do 
			expect(["", 2, "X", :a].any_empty?).to eq true
		end

		it "returns false if there are no empty elements" do 
			expect(["O", 3, :a].any_empty?).to eq false
		end

		it "returns false for an empty array" do 
			expect([].any_empty?).to eq false
		end
	end

	context "#none_empty" do 
		it "returns true if no elements in the array are empty" do 
			expect([2, "X", :a].none_empty?).to eq true
		end

		it "returns false if some elements in the array are empty" do 
			expect(["", 2, :a].none_empty?).to eq false
		end

		it "returns true for an empty array" do 
			expect([].none_empty?).to eq true
		end
	end
end