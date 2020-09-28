require 'rspec'
require 'TDDproject'
#my unique specs
# # it should make sure that there no single member of the array that is duplicated
describe "my_uniq" do 
    let(:arr) { [7,3,"a","b", "a",2,5,12,5] }
    
    it "should accept an array" do  
        my_uniq([7,3,"a","b", "a",2,5,12,5])
    end

    it "should have all elements unique" do 
        expect(my_uniq([7,3,"a","b", "a",2,5,12,5])).to eq([7, 3,"a", "b", 2, 5, 12])
    end

    it "shouldnt use .uniq method" do 
        expect(arr).not_to receive(:uniq)
    end
end


# idx1 + idx2  == 0
#We want each of the pairs to be sorted smaller index before bigger index. ( idx1 < idx2)


# [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]
# [0, 2] before [2, 1] (smaller first elements come first)
# [0, 1] before [0, 2] (then smaller second elements come first)

describe "two_sum" do
    let(:arr) { [-1, 0, 2, -2, 1] }

    it "should accept an array" do  
        two_sum(arr)
    end

    it "should return an array containting all pairs of indices resulting in zero" do
        expect(two_sum(arr)).to eq([[0, 4], [2, 3]])
    end

    it "should return [] if no pair is found" do 
        expect(two_sum([1, 2, 3, 4])).to eq([])
    end
end

#should not use .transpose
# To represent a matrix, or two-dimensional grid of numbers, we can write an array containing arrays which represent rows:

# rows = [
#     [0, 1, 2],
#     [3, 4, 5],
#     [6, 7, 8]
#   ]

# row1 = rows[0]
# row2 = rows[1]
# row3 = rows[2]
# We could equivalently have stored the matrix as an array of columns:

# cols = [
#     [0, 3, 6],
#     [1, 4, 7],
#     [2, 5, 8]
#   ]
# Write a method, my_transpose, which will convert between the row-oriented and column-oriented representations. You may assume square matrices for simplicity's sake. Usage will look like the following:

# my_transpose([
#     [0, 1, 2],
#     [3, 4, 5],
#     [6, 7, 8]
#   ])
#  # => [[0, 3, 6],
#  #    [1, 4, 7],
#  #    [2, 5, 8]]

describe 'my_transpose' do
    let(:matrix) {[[0, 1, 2], [3, 4, 5], [6, 7, 8]]}

    it 'should accept a 2D array as an argument' do
        my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]])
    end

    it "shouldnt use .transpose method" do 
        expect(matrix).not_to receive(:transpose)
    end

    it "should return a 2d array with rows and columns inverted" do 
        expect(my_transpose(matrix)).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end
      
end

# Write a method that takes an array of stock prices (prices on days 0, 1, ...), and outputs the most profitable pair of days on which to first buy the stock and then sell the stock. Remember, you can't sell stock before you buy it!

describe 'stock_picker' do
    let(:arr) { [1, 0, 2, 4, 1] }

    it "should accept an array as an argument" do 
        stock_picker([1, 0, 2, 4, 1])
    end

    it "should return the indices of the most profitable days" do
        expect(stock_picker(arr)).to eq([1, 3])
    end

    
end