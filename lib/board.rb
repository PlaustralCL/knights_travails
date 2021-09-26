# frozen_string_literal: true

require_relative "square"

# Create a representation of a chess board
class Board
  attr_reader :board

  def initialize
    @board = Array.new(8) { Array.new(8) { Square.new } }
    asign_square_names
  end

  def asign_square_names
    board.each_index do |col|
      iterate_row(col)
    end
  end

  def iterate_row(col)
    board.each_index do |row|
      assign_properties(col, row)
    end
  end

  def assign_properties(col, row)
    square = board[row][col]
    square.name = col_names[col] + row_name[row]
    square.position = [row, col]
    square.path << square.name
  end

  def col_names
    ("a".."h").to_a
  end

  def row_name
    ("1".."8").to_a.reverse
  end

  def each_square(&block)
    return unless block_given?

    board.flatten.each do |square|
      block.call(square)
    end
  end

  def show_board
    display_board = Array.new(8) { Array.new(8) }
    (0..7).each do |row|
      p display_board[row]
    end
  end

  def iterate_display_col(row)
    (0..7).each do |col|
      display_board[row][col] = board[row][col].position
    end
  end



end

if __FILE__ == $PROGRAM_NAME
  test = Board.new
  test.show_board
end
