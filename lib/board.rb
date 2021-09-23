# frozen_string_literal: true

require_relative "square"

# Create a representation of a chess board
class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) { Square.new } }
    asign_square_names
  end

  def asign_square_names
    col_names = ("a".."h").to_a
    row_name = ("1".."8").to_a.reverse
    board.each_index do |col|
      board.each_index do |row|
        board[row][col].name = col_names[col] + row_name[row]
      end
    end
  end

  def show_board
    display_board = Array.new(8) { Array.new(8) }
    (0..7).each do |row|
      (0..7).each do |col|
        display_board[row][col] = board[row][col].name
      end
      p display_board[row]
    end
  end

end

test = Board.new
test.show_board
