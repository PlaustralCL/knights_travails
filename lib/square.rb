#frozen_string_literal: true

# Create an object to represent each square of the chessboard. This will
# track the state of the individual squares.
class Square
  attr_accessor :name

  def initialize(name = "z0")
    @name = name
  end
end
