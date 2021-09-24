# frozen_string_literal: true

require_relative "board"
require_relative "square"

# Create a graph of possible knight moves
class Graph
  attr_accessor :board

  def initialize(board = Board.new)
    @board = board.board
  end

  def build_graph
    flat_board = board.flatten
    flat_board.each_with_index do |square, index|
      # puts "#{index} --> #{square.position}"
      knight_moves.each do |move|
        square.adjacent << move if move_allowed?(move, square.position)
      end
    end
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
    [[-1, 2], [-2, -1], [-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2]]
  end

  def min_square
    0
  end

  def max_square
    7
  end
end

graph = Graph.new
graph.build_graph
puts "#{graph.board[0][0].position} --> #{graph.board[0][0].adjacent}"
