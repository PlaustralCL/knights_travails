# frozen_string_literal: true

require_relative "board"
require_relative "square"

# Create a graph of possible knight moves by connecting each square on the board
# to the squares a knight could go from there.
class Graph
  attr_accessor :board

  def initialize(board = Board.new)
    @board = board.board
    build_graph
  end

  def build_graph
    flat_board = board.flatten
    flat_board.each_with_index do |square, index|
      knight_moves.each do |move|
        position = square.position
        if move_allowed?(move, position)
          target_square = move_square(move, position)
          square.adjacent << grid_to_object(target_square)
        end
      end
    end
  end

  def grid_to_object(grid_coord)
    board[grid_coord.first][grid_coord.last]
  end

  def move_square(move, position)
    [move.first + position.first, move.last + position.last]
  end

  def move_allowed?(move, position)
    row_allowed?(move, position) && col_allowed?(move, position)
  end

  def row_allowed?(move, position)
    position.first + move.first >= 0 && position.first + move.first <= 7
  end

  def col_allowed?(move, position)
    position.last + move.last >= 0 && position.last + move.last <= 7
  end

  def knight_moves
    [[1, -2], [2, -1], [2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2]]
  end

  def min_square
    0
  end

  def max_square
    7
  end

  def adjacent_list
    board.flatten.each_with_object({}) do |square, hash|
      list = []
      square.adjacent.each { |element| list << element.name }
      hash[square.name] = list
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  graph = Graph.new
  graph.build_graph
  graph.adjacent_list.each { |key, value| puts "#{key} --> #{value}" }
end
