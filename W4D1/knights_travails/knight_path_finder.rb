require_relative "board"
require_relative "PolyTreeNode"

class KnightPathFinder
    # MOVES = {[2,1][2,-1][]}
    # MOVES = {[[row - 2][col + 1]}
    # MOVES [[1,2][2,1]] pos(3,3) new_pos= pos[0] +move[0]

    MOVES = [
        [2,1], 
        [2,-1],
        [1,2],
        [1,-2],
        [-1,2],
        [-1,-2],
        [-2,1],
        [-2,-1]
    ]

    def self.valid_moves(start)
        possible_moves = new_pos(start).select do |move| 
            row, col = move
            (0..7).include?(row) && (0..7).include?(col)
        end
        possible_moves
    end

    def self.new_pos(pos)
        new_positions = []
        start = pos
        MOVES.each do |move|
            row,col = move 
            row_start,col_start = start
            pos_new = [row+ row_start, col+ col_start]
            new_positions << pos_new 
        end
        new_positions
    end

    def initialize(position)
        @start_pos = position
        @considered_positions = [start_pos]
        build_move_tree
    end

    attr_reader :start_pos
    attr_accessor :root_node, :considered_positions

    def build_move_tree
        self.root_node = PolyTreeNode.new(start_pos)

        nodes = [root_node]
        until nodes.empty?
          current_node = nodes.shift
    
          current_pos = current_node.value
          new_move_positions(current_pos).each do |next_pos|
            next_node = PolyTreeNode.new(next_pos)
            current_node.add_child(next_node)
            nodes << next_node
          end
        end
        
    end

    def find_path(end_pos)
        row,col = end_pos
        #supposed to use dfs and bfs to find the shortest path
        trace_path_back(final_positio).reverse.map(&:value)         
    end

    def new_move_positions(pos)
        moves = KnightPathFinder.valid_moves(pos)
        moves.reject { |move| considered_positions.include?(move) }
        moves.each { |move| considered_positions << move }
      end

    def trace_path_back(final_position)
        positions = []
    position_atm = final_position
    until position_atm == nil
      positions << position_atm
      position_atm = position_atm.parent
    end
    positions
    end
end