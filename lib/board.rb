# frozen_string_literal: true

require_relative "square"

# Create a representation of a chess board
class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) { Square.new } }
    asign_square_names
  end

  # rubocop:todo Metrics/AbcSize
  def asign_square_names
    col_names = ("a".."h").to_a
    row_name = ("1".."8").to_a.reverse
    board.each_index do |col|
      board.each_index do |row|
        board[row][col].name = col_names[col] + row_name[row]
        board[row][col].position = [row, col]

      end
    end
  end
  # robocop:enable Metrics/AbcSize

  def show_board
    display_board = Array.new(8) { Array.new(8) }
    (0..7).each do |row|
      (0..7).each do |col|
        display_board[row][col] = board[row][col].position
      end
      p display_board[row]
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  test = Board.new
  test.show_board
end
