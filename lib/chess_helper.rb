# frozen_string_literal: true

# This collects the name of a square on a chess board from the user,
# in standard chess notation, based on a grid where the columns are labeled
# a-h and the rows are labeled 1-8. The name is converted to x and y coordinates
# with 0, 0 being the upper left. This is to faciliate working with an array
# with 8 embeded arrays, each with 8 elements.
module ChessNotation
  def valid_input?(square)
    square.match?(/^[a-h][1-8]$/)
  end

  def choose_square
    puts "Please enter the name of the square using chess notation:"
    square = gets.chomp.downcase
    until valid_input?(square)
      puts "That was not a valid square, please try again"
      square = gets.chomp.downcase
    end
    square
  end

  def split_square(square)
    square.match(/^([a-h])([1-8])$/).captures
  end

  def file_to_grid(file)
    file.tr("a-h", "0-7").to_i
  end

  def rank_to_grid(rank)
    rank.tr("1-8", "76543210").to_i
  end

  def name_to_grid(name)
    file, rank = split_square(name)
    [rank_to_grid(rank), file_to_grid(file)]
  end
end

class Practice
  include ChessNotation
  attr_accessor :square
end

if __FILE__ == $PROGRAM_NAME
  square = Practice.new
  square.square = square.choose_square
  p square.square
  p square.to_grid
  # square = choose_square
  # file, rank = split_square(square)
  # puts "File: #{file}"
  # puts "Rank: #{rank}"
  # puts "File grid: #{file_to_grid(file)}"
  # puts "Rank grid: #{rank_to_grid(rank)}"
  # p square.to_grid
end