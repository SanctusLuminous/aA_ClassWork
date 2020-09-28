class TowersofHanoi
    
    #we initialize 3 arrays
    # # 1 should be full 2 should be empty 
    # u can move one at time
    # bigger one cant go on top of a smaller one
    # we need to move it to the final array as quickly as possible

    def initialize
        @stacks = [[1, 2, 3, 4], [], []]
    end

    def move(start_idx, end_idx) # idx from where to idx1 
        # if start_idx.first < end_idx.first
        #     piece = start_idx.shift 
        # end
        # if end_idx.empty?
        #     end_idx.unshift(piece)
        # elsif piece < end_idx.first
        #     end_idx.unshift(piece)
        # else 
        #     raise "this is impossible dummy" 
        # end

        @stacks[end_idx].unshift(@stacks[start_idx].shift)
    end

    def get_move
        display 

        while !won?
            puts "Pick a start position: "
                start_idx = gets.to_i

            puts "Pick an end position: "
                end_idx = gets.to_i

            if valid_move?(start_idx, end_idx)
                move(start_idx, end_idx)
                display
            else
                display
                puts "Please try again"
            end
        end 

    end

    def valid_move?(start_idx, end_idx)
        return false unless [start_idx, end_idx].all? {|ele| ele.between?(0, 2)}

        return false if @stacks[start_idx].empty?
        
        if !@stacks[end_idx].empty?
            return false if @stacks[start_idx].first > @stacks[end_idx].first
        end

        true

    end

    def win?
        sorted = @stacks[2].sort

        return true if @stacks[0].empty? && @stacks[1].empty? && @stacks[1] == sorted

        false 
    end

    def display
        puts @stacks[0].join(" ")
        puts @stacks[1].join(" ")
        puts @stacks[2].join(" ")
    end

    # [1, 2, 3, 4] []  []
    # until finalarr == originalarr
    # arr = originalarr 
    # vari=arr.shift
    #     if 2ndarr.all? {|ele| ele > vari || ele == nil }
    #          2ndarr.unshift(vari)  
    #     elsif finalarr.all? {|ele| ele > vari || ele == nil}
    #         finalarr.unshift(vari)
    #     else #if the vari is bigger than both 
    #         finalarr.concat(2ndarr)
    #     end

end

#initialize( stacks, pieces )
# move will chose a set or a piece and move it
# win? did we complete the thing that we wanted to do??
# get_move