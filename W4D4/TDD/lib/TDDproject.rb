def my_uniq(arr)
    new_arr = []
    arr.each {|ele|  new_arr << ele if !new_arr.include?(ele)  }
    new_arr
end

def two_sum(arr)
    pairs = []

    arr.each_index do |i|
        ((i + 1)...arr.length).to_a.each do |j|
            pairs << [i, j] if arr[i] + arr[j] == 0
        end
    end

    pairs
end

def my_transpose(matrix)
    new_matrix = []
    matrix.each_with_index do |row, idx1|
        new_matrix[idx1] = []
        row.each_with_index do |col, idx2|
            new_matrix[idx1] << matrix[idx2][idx1]
        end
    end
    new_matrix
end

def stock_picker(arr) #[ [[price pair][price pair]] [[price pair][price pair]] [[price pair][price pair]] [[price pair][price pair]] [[price pair][price pair]]]
    indices = [] #shouldnt it be best price pairs for each day?
    sums = []
    # DAYS = [0,1,2,3,4]
    arr.each_index do| ele, i| #ele.each >>> prices for the day
        arr.each_with_index do |ele1, j| #prices.each and find the best pair. (which should be a helper function ) 
            #the helper should produce a set of indicies that we push into the best day combo array that we will be returning in the end (an array of best pairs for each day) 
            sums << ele1 - ele 
              #we need to find all possible pairs for each day. to find the max one 
        end
    end

    max_price = sums.max
      arr.each_with_index do| ele, i| 
        arr.each_with_index do |ele1, j| 
            indices += [i, j] if ele1 - ele == max_price  
        end
    end
    indices 
end








